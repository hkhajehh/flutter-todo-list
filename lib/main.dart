import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data.dart';
import 'package:todo/splash.dart';

const todotaskBoxName = 'tasks';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoTaskAdapter());
  await Hive.openBox<TodoTask>(todotaskBoxName);
  runApp(const MyApp());
}

const Color primarColor = Color(0xffFEEECA);
const Color secondaryTextColor = Color(0xffAFBED0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xffFFFFFF);
    return MaterialApp(
      title: 'Todo List ',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
        primary: primarColor,
        surfaceVariant: secondaryTextColor,
        background: Color(0xff070709),
        onSurface: primaryTextColor,
        onBackground: primaryTextColor,
      )),
      home: SplashScreen(),
    );
  }
}
