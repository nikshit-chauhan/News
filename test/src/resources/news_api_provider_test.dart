import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('FetchTopIds returns a ids', () async{
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async{
      return Response(json.encode([1,2,3,4,5]), 200);
    });
    final ids = await newsApi.fetchTopIds();

    expect(ids, [1,2,3,4,5]);
  });
  test('FetchItems return a item', () async{
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async{
      final jsonMap = {'id': 8863, 'title': 'foo', 'text': 'bar'};
      return Response(json.encode(jsonMap), 200);
    });
    final item = await newsApi.fetchItem(8863);

    expect(item, isA<ItemModel>());

    expect(item.id, 8863);
    expect(item.title, 'foo');
    expect(item.text, 'bar');
  });
}