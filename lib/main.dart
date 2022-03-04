import 'package:flutter/material.dart';
import 'view/user/view_model/user_view_model_provider.dart';
import 'package:provider/provider.dart';
import 'onboard.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserViewModelProvider()),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Material App',
      home: const OnBoardPage(),
    );
  }
}
