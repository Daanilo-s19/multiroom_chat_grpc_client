import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/providers/room_manager_client_provider.dart';
import 'package:aplication_flutter_grpc/generated/google/protobuf/empty.pb.dart';

class RoomRepository {
  final RoomManagerClientProvider _clientProvider;

  const RoomRepository({RoomManagerClientProvider clientProvider})
      : _clientProvider = clientProvider;

  Future<List<Room>> listRooms() async {
    final result = await _clientProvider.client.listRoom(new Empty());

    return result.rooms.map((e) => Room.fromApi(e)).toList();
  }
}
