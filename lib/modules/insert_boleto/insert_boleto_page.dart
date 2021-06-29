import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:yobills/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:yobills/shared/themes/app_text_styles.dart';
import 'package:yobills/shared/themes/appcolors.dart';
import 'package:yobills/shared/widgets/input_text/input_text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yobills/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 24),
                child: Text('Prencha os dados',
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBoldHeading),
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                        validator: controller.validateName,
                        label: 'Nome do Boleto',
                        icon: Icons.description_outlined,
                      ),
                      InputTextWidget(
                        validator: controller.validateVencimento,
                        controller: dueDateInputTextController,
                        onChanged: (value) {
                          controller.onChange(dueDate: value);
                        },
                        label: 'Vencimento',
                        icon: FontAwesomeIcons.timesCircle,
                      ),
                      InputTextWidget(
                        validator: (_) => controller.validateValor(
                            moneyInputTextController.numberValue),
                        controller: moneyInputTextController,
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                        label: 'Valor',
                        icon: FontAwesomeIcons.wallet,
                      ),
                      InputTextWidget(
                        validator: controller.validateCodigo,
                        initialValue: widget.barcode,
                        controller: barcodeInputTextController,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                        label: 'Código',
                        icon: FontAwesomeIcons.barcode,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
