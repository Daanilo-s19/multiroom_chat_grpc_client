import 'package:aplication_flutter_grpc/app/data/models/message_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/chat_repository.dart';
import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatRoomController extends GetxController {
  final ChatRepository _chatRepository;

  ChatRoomController({ChatRepository repository})
      : _chatRepository = repository;

  final messagesChat = List<types.Message>.empty().obs;
  final users = List<User>.empty().obs;

  final _room = Room().obs;
  User _user = User(id: Uuid().v4());

  @override
  void onInit() {
    super.onInit();
    init(Get.arguments);
    _setupStreams();
  }

  void init(ChatRoomArgument args) {
    _room.value = args.room;
    _user = args.user;
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
        text: event.message,
      );
      addMessage(textMessage);
    });
  }

  void getUserCount() {
    final stream = _chatRepository.listenUsers(_user);
    stream.listen((event) {
      users
        ..clear()
        ..addAll(event);
    });
  }

  Future<void> sendMessage(String msg) async {
    await _chatRepository.sendMessage(Message(
      message: msg,
      room: _room.value,
      user: _user,
    ));
  }

  @override
  void onClose() async {
    await _chatRepository.exitRoom(_user);
    super.onClose();
  }

  void setUserName(String name) {
    _user = User(id: _user.id, name: name);
  }

  void addMessage(types.Message message) {
    messagesChat.insert(0, message);
  }

  get userChat => types.User(id: _user.id);
  Room get room => _room.value;
}
