import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:aplication_flutter_grpc/app/data/providers/signin_client_provider.dart';

class SigninRepository {
  final SigninClientProvider api;

  SigninRepository(this.api);

  getUserName(User user) {
    return api.client.receiveMessage(user.toApi());
  }
}
