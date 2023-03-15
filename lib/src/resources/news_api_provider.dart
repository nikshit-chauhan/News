import 'dart:convert';
import '../models/item_model.dart';
import 'package:http/http.dart' show Client;
import 'repository.dart';

const _root = 'https://hacker-news.firebaseio.com';

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    var url = Uri.parse('$_root/v0/topstories.json');
    final response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch top IDs');
    }
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    var url = Uri.parse('$_root/v0/item/$id.json');
    final response = await client.get(url);
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
