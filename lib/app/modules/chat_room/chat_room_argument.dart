import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';

class ChatRoomArgument {
  final User user;
  final Room room;

  const ChatRoomArgument({this.user, this.room});
}
