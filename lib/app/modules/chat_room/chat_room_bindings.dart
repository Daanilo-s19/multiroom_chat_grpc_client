import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/providers/chat_manager_client_provider.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/chat_repository.dart';
import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_argument.dart';
import 'package:aplication_flutter_grpc/app/modules/chat_room/chat_room_controller.dart';
import 'package:get/get.dart';

class ChatRoomBindings implements Bindings {
  @override
  void dependencies() {
    final ChatRoomArgument arg = Get.arguments;
    Get.lazyPut<ChatManagerClientProvider>(
      () => ChatManagerClientProvider(arg.room.address),
    );
    Get.lazyPut<ChatRepository>(
      () => ChatRepository(clientProvider: Get.find()),
    );
    Get.lazyPut<ChatRoomController>(
      () => ChatRoomController(repository: Get.find()),
    );
  }
}
