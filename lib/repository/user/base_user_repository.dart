import 'package:dartz/dartz.dart';

import '../../models/user_model.dart';

abstract class BaseUserRepository {
  Future<Either<bool, UserModel>> getinfouser();
    Future updateuserdata(var data);
    Future changepassword(var data);

}
