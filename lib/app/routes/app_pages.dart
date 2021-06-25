import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_bindings.dart';
import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_screen.dart';
import 'package:aplication_flutter_grpc/app/modules/room_list/room_list_bindings.dart';
import 'package:aplication_flutter_grpc/app/modules/room_list/room_list_screen.dart';
import 'package:aplication_flutter_grpc/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.roomList,
      page: () => RoomListScreen(),
      binding: RoomListBindings(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatRoomScreen(),
      binding: ChatRoomBindings(),
    ),
  ];
}
