import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _userName = 'username';

  static Future setJWTToken(String _userName) async =>
      await _storage.write(key: _userName, value: _userName);

  static Future<String?> getJWTToken() async =>
      await _storage.read(key: _userName);
}
