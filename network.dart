import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'photo.dart';
import 'package:http/http.dart' as http;

List<Photo> parsePhoto(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

Future<List<Photo>> fetchPhoto() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/photos');
  if (response.statusCode == 200) {
    return compute(parsePhoto, response.body);
  } else {
    throw Exception('error');
  }
}