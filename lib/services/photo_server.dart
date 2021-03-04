import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_media/models/photo_model.dart';

class PhotoService {
  Future<List<PhotoModel>> getPhoto() async {
    var url = 'https://jsonplaceholder.typicode.com/photos';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body) as List;
      // return to getPhoto
      return res.map((data) => PhotoModel.fromJson(data)).toList();
    } else {
      throw Exception('Unable to get Photo List');
    }
  }
}
