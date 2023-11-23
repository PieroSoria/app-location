import 'package:mudanzaya/components/data_user.dart';

abstract class SignUpRepository {
  Future<SignUpResponsy> registrar(UserData data);
}
