import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'core/extensions/context_extension.dart';
import 'core/extensions/string_extension.dart';
import 'view/food/view/food_view.dart';
import 'view/user/view/login_page.dart';
import 'view/user/view_model/user_view_model_provider.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);
  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<UserViewModelProvider>(context, listen: false).verifyToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<UserViewModelProvider>().isLoading
        ? Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.normalValue),
              child: Center(child: Lottie.asset('food_delivery'.toLottieJson)),
            ),
          )
        : context.read<UserViewModelProvider>().isVerified
            ? const FoodView()
            : const LoginPage();
  }
}
