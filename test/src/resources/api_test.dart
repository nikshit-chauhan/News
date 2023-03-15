import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news/src/resources/news_api_provider.dart';
import 'package:test/test.dart';

void main() {
  test('Hacker News API Test', () async {
    final apiProvider = NewsApiProvider();
    var response = await apiProvider.client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/35100743.json'));
    expect(response.statusCode, 200);

    var data = json.decode(response.body);
    if (kDebugMode) {
      print(data);
    }
    expect(data, data);
    expect(data, isNotEmpty);
  });
}
