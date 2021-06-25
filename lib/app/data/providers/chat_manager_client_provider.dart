import 'package:aplication_flutter_grpc/generated/room.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class ChatManagerClientProvider {
  final ClientChannel _channel;

  ChatManagerClientProvider(Uri address)
      : _channel = ClientChannel(
          address.host,
          port: address.port,
          options: ChannelOptions(credentials: ChannelCredentials.insecure()),
        );

  ChatManagerClient get client => ChatManagerClient(_channel);

  void dispose() async {
    await _channel.shutdown();
  }
}
