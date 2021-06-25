import 'package:aplication_flutter_grpc/app/data/models/message_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/chat_repository.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatRoomController extends GetxController {
  final ChatRepository _chatRepository;

  ChatRoomController({ChatRepository repository})
      : _chatRepository = repository;

  final _messageList = <Message>[].obs;
  final _userCount = 0.obs;

  User _user = User(id: Uuid().v4());
  Room _room;

  List<Message> get messageList => _messageList;
  Rx<int> get userCount => _userCount;

  void init(Room room) {
    _room = room;
  }

  void getMessages() {
    final stream = _chatRepository.listenMessages(_user);

    stream.listen((event) {
      _messageList.value = List<Message>.from(_messageList)..add(event);
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
      room: _room,
      user: _user,
    ));
  }

  void setUserName(String name) {
    _user = User(id: _user.id, name: name);
  }
}
