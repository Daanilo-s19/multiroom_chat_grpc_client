import 'package:aplication_flutter_grpc/generated/room.pb.dart' as api;

class User {
  final String id;
  final String name;

  const User({this.id, this.name});

  factory User.fromApi(api.User apiUser) => User(
        id: apiUser.id,
        name: apiUser.name,
      );

  api.User toApi() => api.User(id: id, name: name);
}
