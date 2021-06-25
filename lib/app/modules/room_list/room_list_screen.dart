import 'package:aplication_flutter_grpc/app/modules/room_list/room_list_controller.dart';
import 'package:aplication_flutter_grpc/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomListScreen extends GetView<RoomListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: GetX<RoomListController>(initState: (_) async {
        await _.controller.listRooms();
      }, builder: (_) {
        if (_.roomList == null || _.roomList.isEmpty) {
          return Center(
            child: Text("Sem salas até o momento"),
          );
        }

        return ListView(
          children: [
            for (var room in _.roomList)
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.chat, arguments: room),
                child: Card(
                  child: ListTile(title: Text(room.name)),
                ),
              )
          ],
        );
      }),
    );
  }

  Widget _appBar() {
    return AppBar(title: Text("Salas"));
  }
}
