import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    final Room room = Get.arguments;

    return Scaffold(
      appBar: _appBar(room),
      body: GetX<ChatRoomController>(
        initState: (_) {
          _.controller.init(room);
        },
        builder: (_) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: ListView(
                  children: [
                    for (var msg in _.messageList)
                      Card(
                        child: ListTile(
                          title: Text(msg.user.name),
                          subtitle: Text(msg.message),
                        ),
                      )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(child: Text("AUEBA")),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _appBar(Room room) {
    return AppBar(
      title: Text('${room.name} - #${controller.userCount.value}'),
    );
  }
}
