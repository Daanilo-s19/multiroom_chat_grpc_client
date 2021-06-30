import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/room_manager_repository.dart';
import 'package:get/get.dart';

class RoomListController extends GetxController {
  final RoomRepository _repository;

  final _roomList = <Room>[].obs;

  RoomListController({RoomRepository repository})
      : _repository = repository,
        super();

  @override
  onInit() async {
    super.onInit();
    await listRooms();
  }

  Future<void> listRooms() async {
    final result = await _repository.listRooms();
    _roomList.assignAll(result);
  }

  List<Room> get roomList => List<Room>.from(_roomList);
}
