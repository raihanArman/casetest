import 'package:casetest/feature/dashboard/dashboard_page.dart';
import 'package:casetest/feature/login/bloc/login_bloc.dart';
import 'package:casetest/feature/login/bloc/login_event.dart';
import 'package:casetest/feature/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';
import 'package:shared/ui/components/text_form_custom.dart';
import 'package:shared/ui/components/text_form_password.dart';
import 'package:shared/ui/components/elevated_button_custom.dart';
import 'package:shared/util/enum.dart';
import 'package:shared_library/flutter_bloc/flutter_bloc.dart';
import 'package:shared/navigation/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> stateHidePassword = ValueNotifier<bool>(true);

  void changeStateShowPassword() =>
      stateHidePassword.value = !stateHidePassword.value;

  void showSnackbar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            print("Ampas Ampas -> $state");
            if (state is ErrorLoginState) {
              showSnackbar(state.error);
            }

            if (state is SuccessLoginState) {
              nextScreenRemoveUntil(context, DashboardPage());
            }
          },
          builder: (context, state) {
            return Container(
                child: SingleChildScrollView(
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
                          "Silahkan login untuk melanjutkan",
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
                        TextFormFieldCustom(
                            titleText: "Email",
                            hintText: "Masukkan email anda",
                            textEditingController: emailController,
                            validatorType: ValidatorTypeForm.Email,
                            textInputType: TextInputType.emailAddress),
                        SizedBox(
                          height: 40,
                        ),
                        ValueListenableBuilder(
                          valueListenable: stateHidePassword,
                          builder: (context, value, child) =>
                              TextFormFieldPassword(
                            titleText: "Password",
                            hintText: "Masukkan password anda",
                            obsecureText: stateHidePassword.value,
                            textEditingController: passwordController,
                            withForgotPass: true,
                            onTapShowPassword: () => changeStateShowPassword(),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButtonCustom(
                          text: "Login",
                          onTap: () {
                            context.read<LoginBloc>().add(
                                  SubmittingLoginEvent(
                                      email: emailController.text,
                                      password: passwordController.text),
                                );
                          },
                          iconData: Icon(
                            Icons.arrow_forward,
                            color: kWhiteColor,
                          ),
                          isLoading: state is LoadingLoginState,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Belum punya akun ?",
                              style: greyTextStyle.copyWith(fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "  Daftar sekarang",
                                    style: TextStyle(
                                        fontWeight: semibold,
                                        color: kPrimaryColor))
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
            ));
          },
        ));
  }
}
