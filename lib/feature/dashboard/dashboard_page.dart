import 'package:casetest/component/drawer_dashboard.dart';
import 'package:casetest/feature/home/home_page.dart';
import 'package:casetest/feature/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared/ui/components/app_bar_custom.dart';
import 'package:shared/ui/components/menu_option.dart';
import 'package:shared/ui/components/button_rectangle.dart';
import 'package:shared/ui/theme.dart';
import 'package:shared/util/enum.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final ValueNotifier<MenuTypeScreen> stateMenuScreen =
      ValueNotifier<MenuTypeScreen>(MenuTypeScreen.Home);
  void changestateMenuScreen(MenuTypeScreen menu) {
    _scaffoldKey.currentState?.closeEndDrawer();
    stateMenuScreen.value = menu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        onMenuClick: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: stateMenuScreen,
        builder: (context, value, child) {
          switch (value) {
            case MenuTypeScreen.Home:
              return HomePage();
            case MenuTypeScreen.Profile:
              return ProfilePage();
            default:
              return HomePage();
          }
        },
      ),
      resizeToAvoidBottomInset: true,
      drawerScrimColor: kPrimaryColor.withOpacity(0.9),
      endDrawer: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.closeEndDrawer();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Image.asset(
                  "assets/images/ic_close.png",
                  width: 26,
                  height: 26,
                ),
              )),
          Expanded(
            flex: 1,
            child: DrawerDashboard(
              option: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuOption(
                    text: "Home",
                    onTap: () => changestateMenuScreen(MenuTypeScreen.Home),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MenuOption(
                    text: "Profile Saya",
                    onTap: () => changestateMenuScreen(MenuTypeScreen.Profile),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MenuOption(
                    text: "Pengaturan",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonRectangle(
                    text: "Logout",
                    onTap: () {},
                    color: kRedColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
