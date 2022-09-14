import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const backgroundColor = Color(0xfffbfbfd);

final TextStyle kHeading5 =
    GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold);
final TextStyle kHeading6 =
    GoogleFonts.poppins(fontSize: 19.sp, fontWeight: FontWeight.bold);
final TextStyle kSubtitle =
    GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold);
final TextStyle kBodyText1 =
    GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w400);
final TextStyle kBodyText2 =
    GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400);

final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText1: kBodyText1,
  bodyText2: kBodyText2,
);
