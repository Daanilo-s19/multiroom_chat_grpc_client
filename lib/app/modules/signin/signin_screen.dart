import 'package:aplication_flutter_grpc/app/modules/signin/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bem-vindo ao Chat GRPC",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.fromLTRB(48, 40, 48, 0),
            child: TextField(
              controller: controller.textEditingController,
              decoration: InputDecoration(hintText: "Como quer ser chamado?"),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: Get.width,
        margin: EdgeInsets.all(32),
        child: ElevatedButton(
          onPressed: controller.redirectUser,
          child: Text("Exibir salas"),
        ),
      ),
    );
  }
}
