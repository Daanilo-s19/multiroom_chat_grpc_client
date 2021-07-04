import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/signin_repository.dart';
import 'package:aplication_flutter_grpc/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SigninController extends GetxController {
  final SigninRepository repository;
  SigninController(this.repository);
  User user = User();

  final textEditingController = TextEditingController();

  void redirectUser() {
    if (textEditingController.text.isNotEmpty) {
      user = User(id: Uuid().v4(), name: textEditingController.text);
      Get.toNamed(AppRoutes.roomList);
    } else {
      Get.snackbar("Ops!", "Falta pouco, precisamos saber seu nome!",
          backgroundColor: Colors.white);
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
