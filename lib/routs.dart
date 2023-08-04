import 'package:dsa_web/profile/mob_profile.dart';
import 'package:dsa_web/responsive/lap_home.dart';
import 'package:dsa_web/responsive/mob_home.dart';
import 'package:dsa_web/responsive/responsive_layout.dart';
import 'package:dsa_web/responsive/tab_home.dart';
import 'package:dsa_web/setting.dart';
import 'package:dsa_web/splash%20screen/lap_splash.dart';
import 'package:dsa_web/splash%20screen/mob_splash.dart';
import 'package:dsa_web/splash%20screen/tab_splash.dart';
import 'package:dsa_web/test/onlinetest.dart';
import 'package:flutter/cupertino.dart';

import 'about.dart';
import 'college/mob_clg.dart';
import 'home_containers/addstu/addstu.dart';
import 'home_containers/att/att.dart';
import 'home_containers/fees/fees.dart';
import 'home_containers/leave/leave.dart';
import 'home_containers/mess/lap_mess.dart';
import 'home_containers/mess/mob_mess.dart';
import 'home_containers/mess/tab_mess.dart';
import 'home_containers/result/result.dart';
import 'home_containers/test/test.dart';
import 'home_containers/time/time.dart';
import 'login/lap_login.dart';

Map<String, WidgetBuilder> routes = {
  laplog.routeName: (context) => laplog(),
  ResponsiveSplash.routeName: (context) => ResponsiveSplash(
      mobileBody: mobsplash(),
      tabletBody: tabsplash(),
      desktopBody: lapsplash()),
  ResponsiveHome.routeName: (context) => ResponsiveHome(
      mobileBody: mob_home(), tabletBody: tab_home(), desktopBody: lap_home()),
  leaveview.routeName: (context) => leaveview(),
  timeTable.routeName: (context) => timeTable(),
  dailyTest.routeName: (context) => dailyTest(),
  resultview.routeName: (context) => resultview(),
  ResponsiveMess.routeName: (context) => ResponsiveMess(
      mobileBody: mobMess(), tabletBody: tabMess(), desktopBody: lapMess()),
  // lapprof.routeName: (context) => lapprof(),
  onlineTest.routeName: (context) => onlineTest(),
  setting.routeName: (context) => setting(),
  about.routeName: (context) => about(),
  // ResponsiveProff.routeName: (context) => ResponsiveProff(
  //     mobileBody: mobprof(), tabletBody: mobprof(), desktopBody: lapprof()),
  addstu.routename: (context) => addstu(),
  mobprof.routeName: (context) => mobprof(),
  clgnot.routeName: (context) => clgnot(),
  attview.routename: (context) => attview(),
};
