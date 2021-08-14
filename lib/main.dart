import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test/injection.dart';
import 'package:test/presentation/main/page_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const PageViewWidget(),
    );
  }
}
