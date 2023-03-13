import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class Refresh extends StatelessWidget{
  late final Widget child;

  Refresh({required this.child});

  @override
  Widget build(context){
    final bloc = StoriesProvider.of(context);
    return RefreshIndicator(
        onRefresh: () async{
          await bloc.clearCache();
          await bloc.fetchTopIds();
        },
        child: child,
        );
  }
}