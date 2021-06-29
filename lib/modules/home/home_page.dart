import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yobills/modules/extract/extract_page.dart';
import 'package:yobills/modules/home/home_controller.dart';
import 'package:yobills/modules/meus_boletos/meus_boletos_page.dart';
import 'package:yobills/modules/signOut/signOut_controller.dart';
import 'package:yobills/shared/models/user_model.dart';
import 'package:yobills/shared/themes/app_text_styles.dart';
import 'package:yobills/shared/themes/appcolors.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homecontroller = HomeController();
  final singOutcontroller = SignOutController();

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                  title: Text.rich(
                    TextSpan(
                        text: 'Olá,',
                        style: TextStyles.titleRegular,
                        children: [
                          TextSpan(
                              text: ' ${widget.user.name}',
                              style: TextStyles.titleBoldBackground)
                        ]),
                  ),
                  subtitle: Text(
                    'Matenha suas contas em dia',
                    style: TextStyles.captionShape,
                  ),
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.user.photoURL!,
                      height: 55,
                      width: 55,
                    ),
                  )),
            ),
          ),
          preferredSize: Size.fromHeight(152)),
      body: [
        MeusBoletosPage(key: UniqueKey()),
        ExtractPage(key: UniqueKey())
      ][homecontroller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                homecontroller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: homecontroller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            GestureDetector(
              onTap: () async {
                // Navigator.pushNamed(context, "/barcode_scanner");

                await Navigator.pushNamed(context, "/insert_boleto");
                setState(() {});
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                homecontroller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: homecontroller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            IconButton(
              onPressed: () async {
                singOutcontroller.signOut(context);
              },
              icon: Icon(
                Icons.logout_outlined,
                color: AppColors.body,
              ),
            )
          ],
        ),
      ),
    );
  }
}
