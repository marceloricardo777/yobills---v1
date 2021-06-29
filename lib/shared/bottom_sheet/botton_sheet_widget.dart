import 'package:flutter/material.dart';
import 'package:yobills/shared/themes/app_text_styles.dart';
import 'package:yobills/shared/themes/appcolors.dart';
import 'package:yobills/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;
  const BottomSheetWidget(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: SafeArea(
        child: Material(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.black.withOpacity(0.6),
              )),
              Container(
                color: AppColors.shape,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            style: TextStyles.buttonBoldHeading,
                            text: title,
                            children: [
                              TextSpan(
                                  style: TextStyles.buttonHeading,
                                  text: "\n$subtitle")
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Divider(
                          thickness: 1,
                          color: AppColors.stroke,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.stroke,
                        ),
                      ],
                    ),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPressed: secondaryOnPressed,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
