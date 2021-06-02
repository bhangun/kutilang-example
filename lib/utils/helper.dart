import 'dart:async';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'config.dart';

//
setPrefs(String key,String value) {
  // AppStorage.put(key, value);
}

//
Future<String> prefs(String key) async {
  return "";//AppStorage.fetch(key);
}

Future<Map<String, dynamic>> jwt() async {
/* {
     "sub": "1234567890",
     "name": "Gustavo",
     "iat": 1516239022,
     "exp": 1516239022,
     "randomKey": "something else"
  } */
  return JwtDecoder.decode(await prefs(TOKEN));
}

//
Future<List<String>> roles() async {
  return (await jwt())["auth"].split(",");
}

Future<bool> isRole(String role) async {
  final List<String> b=await roles();
  return b.contains(role);
}

instantToDate(DateTime date){
  return DateTime.parse(date.toString().substring(0,date.toString().length-1));
}

