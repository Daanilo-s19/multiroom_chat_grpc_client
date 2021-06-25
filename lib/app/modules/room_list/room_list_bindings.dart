import 'package:aplication_flutter_grpc/app/data/providers/room_manager_client_provider.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/room_manager_repository.dart';
import 'package:aplication_flutter_grpc/app/modules/room_list/room_list_controller.dart';
import 'package:get/get.dart';

class RoomListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<RoomManagerClientProvider>(
      RoomManagerClientProvider(),
      permanent: true,
    );
    Get.put<RoomRepository>(
      RoomRepository(clientProvider: Get.find()),
      permanent: true,
    );
    Get.put<RoomListController>(
      RoomListController(repository: Get.find()),
      permanent: true,
    );
  }
}
