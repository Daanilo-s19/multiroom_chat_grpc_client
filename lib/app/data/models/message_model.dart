import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/generated/room.pb.dart' as api;

class Message {
  final String message;
  final User user;
  final Room room;

  const Message({
    this.message,
    this.user,
    this.room,
  });

  factory Message.fromApi(api.Message apiMsg) {
    return Message(
      message: apiMsg.message,
      user: User.fromApi(apiMsg.user),
      room: Room.fromApi(apiMsg.room),
    );
  }

  get isInternal => room.id == user.id;

  api.Message toApi() => api.Message(
        message: message,
        room: room.toApi(),
        user: user.toApi(),
      );
}
