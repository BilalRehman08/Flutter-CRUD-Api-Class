import 'dart:convert';

import 'package:fluttercrudapi/models/model.dart';
import 'package:http/http.dart' as http;

getUser() async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);
  return UserModel.fromJson(responseData);
}

postData(Data model) async {
  var uri = Uri.parse('https://maaz-api.tga-edu.com/api/users');

  await http.post(uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(model.toJson()));
}

updateData({required Data model, required id}) async {
  var uri = Uri.parse('https://maaz-api.tga-edu.com/api/users/${id}');

  await http.put(uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(model.toJson()));
}

deleteData({required id}) async {
  var uri = Uri.parse('https://maaz-api.tga-edu.com/api/users/${id}');

  await http.delete(
    uri,
    headers: {'Content-Type': 'application/json'},
  );
}
