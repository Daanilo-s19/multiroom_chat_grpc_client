import 'package:aplication_flutter_grpc/generated/room.pbgrpc.dart';
import 'package:grpc/grpc.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class SigninClientProvider {
  final _channel = ClientChannel(
    'localhost',
    port: 5001,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  ChatManagerClient get client => ChatManagerClient(_channel);

  void dispose() async {
    await _channel.shutdown();
  }
}
