import 'package:flutter/material.dart';
import 'package:offline_project/provider/great_places.dart';
import 'package:offline_project/view/screen/add.dart';
import 'package:offline_project/view/screen/list_Place.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.indigo,
          hintColor: Colors.amber,
        ),
        home: const MyPlace_list(),
        routes: {'addplace': (context) => const Myaddplace()},
      ),
    );
  }
}
