import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/count_provider.dart';
import 'package:testapp/models/provider/index_provider.dart';
import 'package:testapp/models/provider/name_provider.dart';
import 'package:testapp/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NameProvider()),
          ChangeNotifierProvider(create: (context) => IndexProvider()),
          ChangeNotifierProvider(create: (context) => CountProvider()),
        ],
        child: MaterialApp(
          title: 'Test App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const Home(),
        ));
  }
}
