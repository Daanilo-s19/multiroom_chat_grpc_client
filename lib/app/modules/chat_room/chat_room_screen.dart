import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: TextButton(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.white70;
                }

                return Colors.white;
              }),
            ),
            onPressed: () => _userModal(context),
            child: Text(
              "Sala: ${controller.room.name} - Usuários: ${controller.users.length}",
            ),
          ),
        ),
        body: Chat(
          messages: [...controller.messagesChat],
          onSendPressed: (message) => controller.sendMessage(message.text),
          user: controller.userChat,
          showUserAvatars: true,
          showUserNames: true,
        ),
      ),
    );
  }

  Future<dynamic> _userModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Obx(
        () => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                  child: Text(
                'Lista de usuários',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )),
            ),
            for (final user in controller.users)
              Card(
                child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.id),
                    leading: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/200/200'),
                        ),
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
