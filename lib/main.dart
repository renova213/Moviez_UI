import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_widget/common/constants.dart';
import 'package:material_widget/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 690),
      builder: (context, _) => MaterialApp(
        theme: ThemeData(
          textTheme: kTextTheme,
          scaffoldBackgroundColor: backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
