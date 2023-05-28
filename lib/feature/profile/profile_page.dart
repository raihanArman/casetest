import 'package:casetest/component/switch_profile_type.dart';
import 'package:flutter/material.dart';
import 'package:shared/ui/components/elevated_button_custom.dart';
import 'package:shared/ui/components/text_form_custom.dart';
import 'package:shared/ui/components/icon_circle_background.dart';
import 'package:shared/ui/components/footer_section.dart';
import 'package:shared/ui/components/profile_card.dart';
import 'package:shared/ui/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ValueNotifier<int> stateProfileIndex = ValueNotifier<int>(0);
  void changeProfileIndex(int index) => stateProfileIndex.value = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: kBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: stateProfileIndex,
                              builder: (context, value, child) =>
                                  SwitchProfileType(
                                    indexSelected: stateProfileIndex.value,
                                    onTap: (int index) {
                                      changeProfileIndex(index);
                                    },
                                  )),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: kShadowColor.withOpacity(0.16),
                              offset: const Offset(0, 5.0),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ProfileCard(),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pilih data yang ingin ditampilkan",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semibold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      IconCircleBackground(
                                          color: kCyanColor,
                                          iconData: Image.asset(
                                            "assets/images/ic_profile.png",
                                            width: 15,
                                            height: 16,
                                          )),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Data Diri",
                                            style: primaryTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: semibold),
                                          ),
                                          Text(
                                            "Data diri anda sesuai KTP",
                                            style: greyTextStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: regular),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      IconCircleBackground(
                                          color: kGreyLightColor,
                                          iconData: Image.asset(
                                            "assets/images/ic_location.png",
                                            width: 15,
                                            height: 16,
                                            color: kGreyDarkColor,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  TextFormFieldCustom(
                                    titleText: "Nama Depan",
                                    hintText: "Masukkan nama depan anda",
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormFieldCustom(
                                    titleText: "Nama Belakang",
                                    hintText: "Masukkan nama belakang anda",
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormFieldCustom(
                                    titleText: "Nama Email",
                                    hintText: "Masukkan email anda",
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormFieldCustom(
                                    titleText: "No Telpon",
                                    hintText: "Masukkan no telpon anda",
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormFieldCustom(
                                    titleText: "No KTP",
                                    hintText: "Masukkan no ktp anda",
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_info.png",
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya",
                                          style: greyDarkTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 34,
                                  ),
                                  ElevatedButtonCustom(
                                    text: "Simpan Profile",
                                    onTap: () {},
                                    iconData: Image.asset(
                                      "assets/images/ic_save.png",
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 31,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                FooterSection()
              ],
            ),
          )),
    );
  }
}
