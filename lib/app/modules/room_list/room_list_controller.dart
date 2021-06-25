import 'package:aplication_flutter_grpc/app/data/models/room_model.dart';
import 'package:aplication_flutter_grpc/app/data/repositories/room_manager_repository.dart';
import 'package:get/get.dart';

class RoomListController extends GetxController {
  final RoomRepository _repository;

  final _roomList = <Room>[].obs;

  RoomListController({RoomRepository repository})
      : _repository = repository,
        super();

  Future<void> listRooms() async {
    _roomList.value = await _repository.listRooms();
  }

  List<Room> get roomList => List<Room>.from(_roomList);
}
