abstract class BaseAuthRepository {
  Future<bool> login(var data);
  Future<bool> signup(var data);
}
