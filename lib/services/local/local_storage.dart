import 'package:biometric_storage/biometric_storage.dart';

import 'logger.dart';

class AppStorage {
  static final String baseName = 'default';

  BiometricStorageFile? _authStorage;
  static BiometricStorageFile? _storage;
  BiometricStorageFile? _customPrompt;
  BiometricStorageFile? _noConfirmation;

  Future<CanAuthenticateResponse> _checkAuthenticate() async {
    final response = await BiometricStorage().canAuthenticate();
    //AppLogger.info('checked if authentication was possible: $response');
    return response;
  }

  check() async {
    final authenticate = await _checkAuthenticate();
    if (authenticate == CanAuthenticateResponse.unsupported) {
      // _logger.severe('Unable to use authenticate. Unable to get storage.');
      return;
    }
    final supportsAuthenticated =
        authenticate == CanAuthenticateResponse.success ||
            authenticate == CanAuthenticateResponse.statusUnknown;
    if (supportsAuthenticated) {
      _authStorage = await BiometricStorage().getStorage(
          '${baseName}_authenticated',
          options: StorageFileInitOptions(
              authenticationValidityDurationSeconds: 30));
    }
    _storage =
        await BiometricStorage().getStorage('${baseName}_unauthenticated',
            options: StorageFileInitOptions(
              authenticationRequired: false,
            ));
    if (supportsAuthenticated) {
      _customPrompt = await BiometricStorage().getStorage(
          '${baseName}_customPrompt',
          options:
              StorageFileInitOptions(authenticationValidityDurationSeconds: 30),
          androidPromptInfo: const AndroidPromptInfo(
            title: 'Custom title',
            subtitle: 'Custom subtitle',
            description: 'Custom description',
            negativeButton: 'Nope!',
          ));
      _noConfirmation = await BiometricStorage().getStorage(
          '${baseName}_customPrompt',
          options:
              StorageFileInitOptions(authenticationValidityDurationSeconds: 30),
          androidPromptInfo: const AndroidPromptInfo(
            confirmationRequired: false,
          ));
    }

   // _storage.
  }

  // Read value
  static Future<String?> fetch(String key) async {
    _storage = await _getStorage(key);
    return await _storage!.read();
  }
   // Write value 
  static put(String key, String value) async{
     _storage = await _getStorage(key);
    return await _storage!.write(value);//'{key:$key, value:$value}');
  }

  static Future<BiometricStorageFile> _getStorage(String key) async{
    return await BiometricStorage().getStorage('${key}_store',
            options: StorageFileInitOptions(
              authenticationRequired: false,
            ));
  }

   // Delete value 
  static void delete(String key) async{
     _storage = await _getStorage(key);
    return await _storage!.delete();
  }

/* 
  // Read all values
  static Future<Map<String, String>> fetchAll() async{
    return await _storage.readAll();
  }

 

  // Delete all 
  static deleteAll() async{
    await _storage.deleteAll();
  } */

 
}
