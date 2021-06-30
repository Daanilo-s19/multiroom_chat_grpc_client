import 'package:aplication_flutter_grpc/app/modules/room_list/room_list_controller.dart';
import 'package:aplication_flutter_grpc/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomListScreen extends GetView<RoomListController> {
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
            onTap: () => Get.toNamed(AppRoutes.chat, arguments: room),
            child: Card(
              child: ListTile(title: Text(room.name)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() => _render()),
    );
  }

  Widget _appBar() {
    return AppBar(title: Text("Salas"));
  }
}
