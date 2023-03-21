import 'dart:convert';
import '../models/item_model.dart';
import 'package:http/http.dart' show Client;
import 'repository.dart';

const _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    final response = await client.get(Uri.parse('$_root/topstories.json'));
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch top IDs');
    }
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    try {
      final parsedJson = json.decode(response.body);
      return ItemModel.fromJson(parsedJson);
    } on Error catch (e) {
      print('$e\n${e.stackTrace}');
      rethrow;
    }
  }
}
