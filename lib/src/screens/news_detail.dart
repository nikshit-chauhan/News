import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget{
  final int itemId;

  NewsDetail({required this.itemId});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: const Text('Im a details screen'),
    );
  }
}