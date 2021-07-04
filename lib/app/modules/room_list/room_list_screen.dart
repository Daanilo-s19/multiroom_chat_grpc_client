import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_argument.dart';
import 'package:aplication_flutter_grpc/app/modules/room_list/room_list_controller.dart';
import 'package:aplication_flutter_grpc/app/modules/signin/signin_controller.dart';
import 'package:aplication_flutter_grpc/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomListScreen extends GetView<RoomListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _appBar(),
      body: Obx(_render),
    );
  }

  Widget _render() {
    if (controller.roomList == null || controller.roomList.isEmpty) {
      return Center(
        child: Text("Sem salas até o momento"),
      );
    }

    return ListView(
      children: [
        for (var room in controller.roomList)
          InkWell(
            onTap: () async {
              await Get.toNamed(
                AppRoutes.chat,
                arguments: ChatRoomArgument(
                  room: room,
                  user: Get.find<SigninController>().user,
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: ListTile(
                title: Text(room.name),
                subtitle: Text("Esta sala utiliza tecnologia gRPC"),
                leading: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/200/200'),
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text("Salas"),
      backgroundColor: Colors.black,
    );
  }
}
