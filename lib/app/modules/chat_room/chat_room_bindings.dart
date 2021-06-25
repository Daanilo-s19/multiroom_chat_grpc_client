import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/providers/chat_manager_client_provider.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/chat_repository.dart';
import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_controller.dart';
import 'package:get/get.dart';

class ChatRoomBindings implements Bindings {
  @override
  void dependencies() {
    final Room room = Get.arguments;
    Get.put<ChatManagerClientProvider>(
      ChatManagerClientProvider(room.address),
      permanent: false,
    );
    Get.put<ChatRepository>(
      ChatRepository(clientProvider: Get.find()),
      permanent: true,
    );
    Get.put<ChatRoomController>(
      ChatRoomController(repository: Get.find()),
      permanent: true,
    );
  }
}
