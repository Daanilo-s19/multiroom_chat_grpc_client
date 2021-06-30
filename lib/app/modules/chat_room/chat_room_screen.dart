import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Chat(
        messages: controller.messagesChat,
        onSendPressed: (message) => controller.sendMessage(message.text),
        user: controller.userChat,
      ),
    ));
  }
}
