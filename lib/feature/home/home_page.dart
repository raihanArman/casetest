import 'package:casetest/component/hospital_list_section.dart';
import 'package:casetest/component/product_list_section.dart';
import 'package:casetest/component/switch_checkup_type.dart';
import 'package:shared/ui/components/button_circle.dart';
import 'package:shared/ui/components/footer_section.dart';
import 'package:shared/ui/components/text_form_rectangle.dart';
import 'package:shared/ui/components/banner_card.dart';
import 'package:shared/ui/components/service_card.dart';
import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

import '../../component/product_category_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> stateCategoryIndex = ValueNotifier<int>(0);
  void changeCategoryIndex(int index) => stateCategoryIndex.value = index;

  final ValueNotifier<int> stateCheckupIndex = ValueNotifier<int>(0);
  void changeCheckupIndex(int index) => stateCheckupIndex.value = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                SizedBox(
                  height: 30,
                ),
                BannerCard(),
                SizedBox(
                  height: 20,
                ),
                ServiceCard(
                  title: "Layanan Khusus",
                  description: "Tes Covid 19, Cegah Corona Sedini Mungkin",
                  image: "service_1.png",
                  isLeftImage: false,
                  textButton: "Daftar",
                  onClick: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ServiceCard(
                  title: "Track Pemeriksaan",
                  description:
                      "Kamu dapat mengecek progress pemeriksaanmu disini",
                  image: "service_2.png",
                  isLeftImage: true,
                  textButton: "Track",
                  onClick: () {},
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    ButtonCircle(
                        iconData: Image.asset(
                      "assets/images/ic_filter.png",
                      width: 16,
                      height: 16,
                    )),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormFieldRectangle(
                        iconSuffix: Image.asset(
                          "assets/images/ic_search.png",
                          width: 13,
                          height: 13,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ValueListenableBuilder(
                    valueListenable: stateCategoryIndex,
                    builder: (context, value, child) => ProductCategorySection(
                          indexSelected: stateCategoryIndex.value,
                          onTap: (int index) {
                            changeCategoryIndex(index);
                          },
                        )),
                SizedBox(
                  height: 26,
                ),
                ProductListSection(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Pilih Tipe Layanan Kesehatan Anda",
                  style: primaryTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 22,
                ),
                ValueListenableBuilder(
                    valueListenable: stateCheckupIndex,
                    builder: (context, value, child) => SwitchCheckupType(
                          indexSelected: stateCheckupIndex.value,
                          onTap: (int index) {
                            changeCheckupIndex(index);
                          },
                        )),
                SizedBox(
                  height: 40,
                ),
                HospitalListSection(),
                SizedBox(
                  height: 40,
                ),
                Container()
              ],
            ),
          ),
          FooterSection()
        ],
      ),
    );
  }
}
