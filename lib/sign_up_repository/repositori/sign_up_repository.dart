import 'package:mudanzaya/models/data_user.dart';

abstract class SignUpRepository {
  Future<SignUpResponsy> registrar(UserData data);
}
