import 'package:cash_book/data/models/storage_items.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final secureStorage = const FlutterSecureStorage();

  static const _keyUserId = 'userId';
  static const _keyPhone = 'Phone';
  static const _keyToken = 'token';
  static const _keyRefreshToken = 'refreshToken';

  AndroidOptions _getAndroidOption() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  Future<void>writeSecureData(StorageItem item) async{
    await secureStorage.write(key: item.key, value: item.value, aOptions: _getAndroidOption());
  }

  // Future setPhone(String phone) async => await secureStorage.write(key: _keyPhone, value: phone);

  // Future<String?> getPhone() async => await secureStorage.read(key: _keyPhone);

  Future<String?>readSecureData(String key) async{
    var readData = await secureStorage.read(key: key, aOptions: _getAndroidOption());
    return readData;
  }

  Future<void> deleteSecureData(StorageItem item) async{
    await secureStorage.delete(key: item.key, aOptions: _getAndroidOption());
  }

  Future<bool> containsKeyInSecureData(String key) async {
  var containsKey = await secureStorage.containsKey(key: key, aOptions: _getAndroidOption());
  return containsKey;
  }

  Future<List<StorageItem>> readAllSecureData() async{
    var allData = await secureStorage.readAll(aOptions: _getAndroidOption());
    List<StorageItem> list = allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return list;
  }

  Future<void>deleteAllSecureDAta() async{
    await secureStorage.deleteAll(aOptions: _getAndroidOption());
  }

}