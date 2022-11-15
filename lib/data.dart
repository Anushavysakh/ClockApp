import 'dart:ui';

import 'package:clock_app/constants/theme.dart';
import 'package:clock_app/model/enums.dart';

import 'alarm_info.dart';
import 'model/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,title: 'Clock',imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,title: 'Alarm',imageSource: 'assets/alarm.png'),
  MenuInfo(MenuType.timer,title: 'Clock',imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,title: 'Clock',imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [AlarmInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Office',gradientColors: GradientColors.fire),
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Sports',gradientColors: GradientColors.sky),
];