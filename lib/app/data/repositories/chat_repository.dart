import 'package:aplication_flutter_grpc/app/data/models/message_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/providers/chat_manager_client_provider.dart';

class ChatRepository {
  final ChatManagerClientProvider _clientProvider;

  const ChatRepository({ChatManagerClientProvider clientProvider})
      : _clientProvider = clientProvider;

  Stream<Message> listenMessages(User user) {
    final stream = _clientProvider.client.receiveMessage(user.toApi());

    return stream.map((data) => Message.fromApi(data));
  }

  Stream<int> listenUserQuantity(User user) {
    final stream = _clientProvider.client.listUsers(user.toApi());

    return stream.map((data) => data.users.length);
  }

  Future<void> sendMessage(Message message) async {
    await _clientProvider.client.sendMessage(message.toApi());
  }
}
