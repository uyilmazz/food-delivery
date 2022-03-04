import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/color/color_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../product/widgets/button/login_button.dart';
import '../../../product/widgets/divider/custom_divider.dart';
import '../../food/view/food_view.dart';
import '../view_model/user_view_model_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModelProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.mediumValue),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                      height: context.height * 0.25,
                      child: Image.asset('login'.toPng)),
                  Column(
                    children: [
                      SizedBox(height: context.lowValue),
                      buildMenuBar(context),
                      SizedBox(height: context.height * 0.03),
                      buildFormContainer,
                      SizedBox(height: context.normalValue),
                      buildLoginButton(provider)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildMenuBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.lowValue),
      width: context.width * 0.8,
      height: context.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.mediumValue * 1.5),
          color: ColorConstants.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildMenuBarItem('Login', isLogin ? Colors.white : Colors.transparent,
              isLogin ? Colors.black : Colors.white),
          buildMenuBarItem(
              'Register',
              !isLogin ? Colors.white : Colors.transparent,
              !isLogin ? Colors.black : Colors.white),
        ],
      ),
    );
  }

  Widget buildMenuBarItem(String text, Color containerColor, Color textColor) =>
      GestureDetector(
        onTap: () {
          setState(() {});
          isLogin = text == 'Login' ? true : false;
        },
        child: Container(
          width: context.width * 0.35,
          height: context.height * 0.08,
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(context.mediumValue * 1.5)),
          child: Align(
              alignment: Alignment.center,
              child: Text(text,
                  style: context.textTheme.subtitle1!.copyWith(
                      color: textColor, fontWeight: FontWeight.w500))),
        ),
      );

  Container get buildFormContainer => Container(
        padding: EdgeInsets.all(context.normalValue),
        width: context.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(context.normalValue)),
        child: buildForm,
      );

  Widget get buildForm => Form(
        key: _formKey,
        child: Column(
          children: [
            !isLogin
                ? buildTextFormField('Name', Icons.person_outline_outlined,
                    false, _nameController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name must is not empty!';
                    } else {
                      return null;
                    }
                  })
                : const SizedBox(),
            !isLogin ? const CustomDivider() : const SizedBox(),
            buildTextFormField(
                'Email Address', Icons.email_outlined, false, _emailController,
                (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email Address is not empty!';
              } else if (!value.emailRegex) {
                return 'Email is not in correct format';
              }
              return null;
            }),
            const CustomDivider(),
            buildTextFormField(
                'Password', Icons.lock, true, _passwordController, (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password must is not empty!';
              }
              return null;
            }, suffixIcon: Icons.visibility_outlined, onTap: () {}),
            !isLogin ? const CustomDivider() : const SizedBox(),
            !isLogin
                ? buildTextFormField('Confirm Password', Icons.lock, true,
                    _confirmPasswordController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Confirm Password must is not empty!';
                    } else if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      return 'Confirm password is not the same as password';
                    }
                    return null;
                  }, suffixIcon: Icons.visibility_outlined, onTap: () {})
                : const SizedBox(),
          ],
        ),
      );

  Widget buildTextFormField(
          String hintText,
          IconData leadingIcon,
          bool obscure,
          TextEditingController controller,
          String? Function(String? value) validator,
          {IconData? suffixIcon,
          Function()? onTap}) =>
      TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscure,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: context.normalValue * 1.5),
            prefixIconColor: Colors.grey,
            hintText: hintText,
            hintStyle: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
            prefixIcon: Icon(leadingIcon),
            suffixIcon: suffixIcon != null
                ? IconButton(onPressed: onTap, icon: Icon(suffixIcon))
                : const SizedBox(),
            border: InputBorder.none),
      );

  Widget buildLoginButton(UserViewModelProvider provider) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.mediumValue)),
          textStyle: context.textTheme.headline6!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          primary: ColorConstants.primaryColor,
          padding: EdgeInsets.symmetric(
              horizontal: context.mediumValue * 2,
              vertical: context.normalValue)),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final response = !isLogin
              ? await provider.registerUser(_nameController.text,
                  _emailController.text, _passwordController.text)
              : await provider.loginUser(
                  _emailController.text, _passwordController.text);
          if (response) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FoodView()));
          } else {
            buildShowDialog();
          }
        }
      },
      child: Text(
        isLogin ? 'Login' : 'Register',
      ));

  buildShowDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(context.normalValue)), //this right here
          child: SizedBox(
            height: context.height * 0.25,
            child: Padding(
              padding: EdgeInsets.all(context.lowValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: isLogin
                            ? 'Email or Password is not correct!'
                            : 'Email is already exists!'),
                  ),
                  SizedBox(
                    height: context.height * 0.07,
                    width: context.width * 0.5,
                    child: CustomLoginButton(
                        text: 'OK',
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
