import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:trivia_app_flutter/app/utils/app_routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Trivia App',
      theme: ThemeData(
        fontFamily: 'Neuzeit',
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.homeModule,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
