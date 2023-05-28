import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';
import 'package:shared/ui/components/text_form_custom.dart';
import 'package:shared/ui/components/text_form_password.dart';
import 'package:shared/ui/components/elevated_button_custom.dart';
import 'package:shared/util/enum.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> stateHidePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> stateHideConfPassword = ValueNotifier<bool>(true);

  void changeStateShowPassword() =>
      stateHidePassword.value = !stateHidePassword.value;
  void changeStateShowConfPassword() =>
      stateHideConfPassword.value = !stateHideConfPassword.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Hai, ",
                        style: primaryTextStyle.copyWith(fontSize: 28),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Selamat Datang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor))
                        ]),
                  ),
                  Text(
                    "Silahkan register untuk melanjutkan",
                    style: secondTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            ),
            Image.asset("assets/images/image_login.png"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormFieldCustom(
                          titleText: "Nama Depan",
                          hintText: "Masukkan nama depan anda",
                          validatorType: ValidatorTypeForm.Email,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormFieldCustom(
                          titleText: "Nama Belakang",
                          hintText: "Masukkan nama belakang anda",
                          validatorType: ValidatorTypeForm.Email,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormFieldCustom(
                    titleText: "No. KTP",
                    hintText: "Masukkan No.KTP anda",
                    validatorType: ValidatorTypeForm.KTPNumber,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormFieldCustom(
                    titleText: "Email",
                    hintText: "Masukkan email anda",
                    validatorType: ValidatorTypeForm.Email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormFieldCustom(
                    titleText: "No. Telpon",
                    hintText: "Masukkan No.Telpon anda",
                    validatorType: ValidatorTypeForm.PhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ValueListenableBuilder(
                    valueListenable: stateHidePassword,
                    builder: (context, value, child) => TextFormFieldPassword(
                      titleText: "Password",
                      hintText: "Masukkan password anda",
                      obsecureText: stateHidePassword.value,
                      textEditingController: passwordController,
                      onTapShowPassword: () => changeStateShowPassword(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ValueListenableBuilder(
                    valueListenable: stateHideConfPassword,
                    builder: (context, value, child) => TextFormFieldPassword(
                      titleText: "Konfimasi Password",
                      hintText: "Konfirmasi password anda",
                      obsecureText: stateHideConfPassword.value,
                      textEditingController: passwordController,
                      onTapShowPassword: () => changeStateShowConfPassword(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButtonCustom(
                    text: "Register",
                    onTap: () {},
                    iconData: Icon(
                      Icons.arrow_forward,
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Sudah punya akun ?",
                        style: greyTextStyle.copyWith(fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: "  Login sekarang",
                              style: TextStyle(
                                  fontWeight: semibold, color: kPrimaryColor))
                        ]),
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright_outlined,
                        color: kGreyColor,
                        size: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "SILK. all right reserved.",
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: semibold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
