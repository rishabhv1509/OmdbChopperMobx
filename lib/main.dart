import 'package:chopperexample/screens/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chopperexample/data/fetchApiData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => FetchApiData.create(),
      dispose: (context, FetchApiData service) => service.client.dispose(),
      child: MaterialApp(
        home: Post(),
      ),
    );
  }
}
