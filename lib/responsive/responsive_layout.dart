import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  static String routeName = 'ResponsiveLayout';

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  ResponsiveLayout({
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileBody;
        } else if (constraints.maxWidth < 1100) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}

class ResponsiveSplash extends ResponsiveLayout {
  ResponsiveSplash(
      {required super.mobileBody,
      required super.tabletBody,
      required super.desktopBody});
  static String routeName = 'ResponsiveSplash';
}

class ResponsiveLog extends ResponsiveLayout {
  ResponsiveLog(
      {required super.mobileBody,
      required super.tabletBody,
      required super.desktopBody});
  static String routeName = 'ResponsiveLog';
}

class ResponsiveHome extends ResponsiveLayout {
  ResponsiveHome(
      {required super.mobileBody,
      required super.tabletBody,
      required super.desktopBody});
  static String routeName = 'ResponsiveHome';
}

class ResponsiveMess extends ResponsiveLayout {
  ResponsiveMess(
      {required super.mobileBody,
      required super.tabletBody,
      required super.desktopBody});
  static String routeName = 'ResponsiveMess';
}

class ResponsiveCycle extends ResponsiveLayout {
  ResponsiveCycle(
      {required super.mobileBody,
      required super.tabletBody,
      required super.desktopBody});
  static String routeName = 'ResponsiveCycle';
}

class ResponsiveProff extends ResponsiveLayout {
  ResponsiveProff(
      {required super.mobileBody,
      required super.tabletBody,
      required super.desktopBody});
  static String routeName = 'ResponsiveProff';
}
