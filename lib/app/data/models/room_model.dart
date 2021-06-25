import 'package:aplication_flutter_grpc/generated/manager.pb.dart' as api;

class Room {
  final String id;
  final String name;
  final Uri address;

  const Room({this.id, this.name, this.address});

  factory Room.fromApi(api.Room apiRoom) {
    return Room(
      id: apiRoom.id,
      name: apiRoom.name,
      address: Uri.parse(apiRoom.address),
    );
  }

  api.Room toApi() => api.Room(id: id, name: name, address: address.toString());
}
