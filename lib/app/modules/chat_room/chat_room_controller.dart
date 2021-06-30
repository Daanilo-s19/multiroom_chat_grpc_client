import 'package:aplication_flutter_grpc/app/data/models/message_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatRoomController extends GetxController {
  final ChatRepository _chatRepository;

  ChatRoomController({ChatRepository repository})
      : _chatRepository = repository;

  final _messageList = <Message>[].obs;
  final messagesChat = List<types.Message>.empty().obs;
  final _userCount = 0.obs;

  User _user = User(id: Uuid().v4());
  final _room = Room().obs;

  @override
  void onInit() {
    super.onInit();
    init(Get.arguments);
    _setupStreams();
  }

  void init(Room room) {
    _room.value = room;
    _room.refresh();
  }

  void _setupStreams() async {
    await _chatRepository.joinRoom(_user);

    getMessages();
    getUserCount();
  }

  void getMessages() {
    final stream = _chatRepository.listenMessages(_user);

    stream.listen((event) {
      if (event.isInternal) {
        Get.snackbar(event.user.name, event.message,
            colorText: Colors.white,
            backgroundColor: Colors.grey[600].withOpacity(0.6));
        return;
      }

      final textMessage = types.TextMessage(
          authorId: event.user.id,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          id: Uuid().v4(),
          text: event.message);
      addMessage(textMessage);
    });
  }

  void getUserCount() {
    final stream = _chatRepository.listenUserQuantity(_user);
    stream.listen((event) {
      _userCount.value = event;
    });
  }

  Future<void> sendMessage(String msg) async {
    await _chatRepository.sendMessage(Message(
      message: msg,
      room: _room.value,
      user: _user,
    ));
  }

  void setUserName(String name) {
    _user = User(id: _user.id, name: name);
  }

  void addMessage(types.Message message) {
    messagesChat.insert(0, message);
  }

  get userChat => types.User(id: _user.id);
  List<Message> get messageList => _messageList;
  Room get room => _room.value;
  Rx<int> get userCount => _userCount;
}
