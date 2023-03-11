import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build (context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: const Text ('Show some news here'),
    );
  }
}