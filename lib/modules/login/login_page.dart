import 'package:flutter/material.dart';
import 'package:yobills/modules/login/login_controller.dart';
import 'package:yobills/modules/login/social_login/social_login_button.dart';
import 'package:yobills/shared/themes/app_images.dart';
import 'package:yobills/shared/themes/app_text_styles.dart';
import 'package:yobills/shared/themes/appcolors.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppImages.person,
                  width: 200,
                  height: 450,
                )),
            Positioned(
              bottom: size.height * 0.08,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 70, right: 70),
                    child: Text(
                      'Organize suas contas em um só lugar',
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 10),
                    child: SocialLoginButton(onTap: () {
                      controller.googleSignIn(context);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
