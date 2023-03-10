import 'dart:convert';
import '../models/item_model.dart';
import 'package:http/http.dart' show Client;

const _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    var url = Uri.parse('$_root/topstories.json');
    final response = await client.get(url);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }
  Future<ItemModel> fetchItem(int id) async{
    var url = Uri.parse('$_root/item/$id.json');
    final response = await client.get(url);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}