import 'package:aplication_flutter_grpc/app/data/providers/signin_client_provider.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/signin_repository.dart';
import 'package:aplication_flutter_grpc/app/modules/signin/signin_controller.dart';
import 'package:get/get.dart';

class SigninBinding implements Bindings {
  @override
  @override
  void dependencies() {
    Get.lazyPut<SigninClientProvider>(
      () => SigninClientProvider(),
    );
    Get.lazyPut<SigninRepository>(
      () => SigninRepository(Get.find()),
    );
    Get.lazyPut<SigninController>(
      () => SigninController(Get.find()),
    );
  }
}
