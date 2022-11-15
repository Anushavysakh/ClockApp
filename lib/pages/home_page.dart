import 'package:clock_app/data.dart';
import 'package:clock_app/model/enums.dart';
import 'package:clock_app/model/menu_info.dart';
import 'package:clock_app/pages/clock_view_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'alarm_page.dart';
import 'clock_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '';
    print(timezoneString);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentInfo) => buildElevatedButton(currentInfo))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                print("Inside consumer");
                if (value.menuType == MenuType.clock) {
                  return ClockPage(offsetSign: offsetSign, timezoneString: timezoneString);
                } else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                }
                else {
                  return ClockPage(
                    offsetSign: offsetSign, timezoneString: timezoneString);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildElevatedButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
            color: currentMenuInfo.menuType == value.menuType
                ? Colors.red
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
              //context.read<MenuInfo>().updateMenu(currentMenuInfo);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  currentMenuInfo.imageSource ?? ' ',
                  scale: 1.5,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  currentMenuInfo.title ?? ' ',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ));
      },
    );
  }
}
