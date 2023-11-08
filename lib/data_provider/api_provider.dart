import 'dart:convert';
import 'package:practice/model/albums.dart';
import 'package:http/http.dart' show Client;

class AlbumApiProvider {
  Client client = Client();

  Future<Albums> fetchAlbumList() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Albums.fromJSON(data);
    } else {
      throw Exception('Failed');
    }
  }
}
