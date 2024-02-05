import 'package:fe_clinicas_core/fe_clinicas_core.dart';

abstract interface class UserRepository {
  Future<Either<AuthException,String>> login(String email, String password);
}  