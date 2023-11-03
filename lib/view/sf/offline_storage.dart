import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> setSFData(String key, String data) async {
  var sf = await SharedPreferences.getInstance();
  await sf.setString(key, data);
}

Future<String> getSFData(String key) async {
  var sf = await SharedPreferences.getInstance();
  return sf.getString(key).toString();

  //   if (data.isEmptyOrNull) {
  //   throw Exception("not found");
  // } else {
  //   return data!;
  // }
}
