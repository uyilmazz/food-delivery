import 'package:flutter/material.dart';
import 'login_page.dart';
import '../view_model/user_view_model_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/color/color_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/widgets/row/profile_option_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModelProvider = Provider.of<UserViewModelProvider>(context);

    return Column(children: [
      const Spacer(flex: 3),
      Expanded(flex: 9, child: buildProfileImage(context)),
      const Spacer(flex: 2),
      Expanded(flex: 12, child: buildNameEmailNumber(context)),
      const Spacer(),
      Expanded(flex: 8, child: buildOfferDiscount(context)),
      const Spacer(),
      Expanded(flex: 4, child: buildLanguage(context)),
      const Spacer(),
      Expanded(
          flex: 4, child: buildSignOutButton(context, userViewModelProvider)),
      const Spacer(flex: 2),
    ]);
  }

  Widget buildProfileImage(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
              radius: context.mediumValue * 1.3),
          Text(
              context.read<UserViewModelProvider>().user?.name ??
                  'Does not use name',
              style: context.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.w700)),
          Text(
              context.read<UserViewModelProvider>().user?.email ??
                  'Email is not found',
              style: context.textTheme.subtitle1!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w400)),
        ],
      );

  Container buildNameEmailNumber(BuildContext context) => Container(
      color: ColorConstants.secondaryColor,
      child: Column(
        children: [
          const ProfileOptionRow(text: 'Name, Phone Number, Email'),
          buildOptionDivider(context),
          const ProfileOptionRow(text: 'Password & Security'),
          buildOptionDivider(context),
          const ProfileOptionRow(text: 'Payment & Shipping'),
        ],
      ));

  Widget buildOfferDiscount(BuildContext context) => Container(
      color: ColorConstants.secondaryColor,
      child: Column(
        children: [
          const ProfileOptionRow(text: 'Offer & Promos'),
          buildOptionDivider(context),
          const ProfileOptionRow(text: 'Get Discount'),
        ],
      ));

  Widget buildLanguage(BuildContext context) => Container(
        color: ColorConstants.secondaryColor,
        child: const ProfileOptionRow(text: 'Language'),
      );

  Widget buildSignOutButton(
          BuildContext context, UserViewModelProvider userViewModelProvider) =>
      Container(
        width: double.infinity,
        color: ColorConstants.secondaryColor,
        child: GestureDetector(
          onTap: () async {
            await userViewModelProvider.logOut();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: Align(
              alignment: Alignment.center,
              child: Text('Sign Out',
                  style: context.textTheme.subtitle1!
                      .copyWith(color: const Color(0xFFFF5959)))),
        ),
      );

  Widget buildOptionDivider(BuildContext context) => Divider(
      color: const Color(0xFFD8D8D8),
      thickness: 1,
      indent: context.normalValue,
      endIndent: context.normalValue);
}
