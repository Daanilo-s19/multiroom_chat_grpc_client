import 'package:aplication_flutter_grpc/generated/manager.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class RoomManagerClientProvider {
  final _channel = ClientChannel(
    'localhost',
    port: 5001,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  RoomManagerClient get client => RoomManagerClient(_channel);

  void dispose() async {
    await _channel.shutdown();
  }
}
