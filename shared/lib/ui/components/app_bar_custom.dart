import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onMenuClick;
  final List<Widget>? actions;
  const AppBarCustom({super.key, this.onMenuClick, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(
        color: kPrimaryColor, //change your color here
      ),
      actions: <Widget>[
        new Container(),
      ],
      elevation: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(
          margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
          child: Row(
            children: [
              onMenuClick != null
                  ? GestureDetector(
                      onTap: onMenuClick,
                      child: Icon(
                        Icons.menu,
                        color: kPrimaryColor,
                      ),
                    )
                  : SizedBox(),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.notifications,
                    color: kPrimaryColor,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
