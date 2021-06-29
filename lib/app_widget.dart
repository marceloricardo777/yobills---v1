import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yobills/modules/home/home_page.dart';
import 'package:yobills/modules/splash/splash_page.dart';
import 'package:yobills/shared/models/user_model.dart';
import 'package:yobills/shared/themes/appcolors.dart';

import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/insert_boleto/insert_boleto_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primary));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yobills',
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      home: Loginpage(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => Loginpage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : '',
            )
      },
    );
  }
}
