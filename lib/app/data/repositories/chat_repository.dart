import 'package:aplication_flutter_grpc/app/data/models/message_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/providers/chat_manager_client_provider.dart';

class ChatRepository {
  final ChatManagerClientProvider _clientProvider;

  const ChatRepository({ChatManagerClientProvider clientProvider})
      : _clientProvider = clientProvider;

  Future<void> joinRoom(User user) async {
    await _clientProvider.client.joinRoom(user.toApi());
  }

  Stream<Message> listenMessages(User user) {
    final stream = _clientProvider.client.receiveMessage(user.toApi());

    return stream.map((data) => Message.fromApi(data));
  }

  Stream<List<User>> listenUsers(User user) {
    final stream = _clientProvider.client.listUsers(user.toApi());

    return stream.map(
      (data) => data.users.map((u) => User.fromApi(u)).toList(),
    );
  }

  Future<void> sendMessage(Message message) async {
    await _clientProvider.client.sendMessage(message.toApi());
  }

  Future<void> exitRoom(User user) async {
    await _clientProvider.client.exitRoom(user.toApi());
  }
}
