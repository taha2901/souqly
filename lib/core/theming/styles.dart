import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/theming/colors.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font15BlackBold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
    fontSize: 15.sp,
    fontFamily: 'Nunito Sans',
  );
  static TextStyle  font15greyBold = TextStyle(
    color:  ColorsManager.grey,
    fontWeight: FontWeightHelper.bold,
    fontSize: 15.sp,
    fontFamily: 'Nunito Sans',
  );

  static TextStyle font16WhiteRegular = TextStyle(
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
    fontSize: 16.sp,
    fontFamily: 'Tiro Devanagari Hindi',
  );
  static TextStyle  font14BlackRegular = TextStyle(
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
    fontSize: 14.sp,
    fontFamily: 'Tiro Devanagari Hindi',
  );
  static TextStyle font16BlackRegular = TextStyle(
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
    fontSize: 16.sp,
    fontFamily: 'Tiro Devanagari Hindi',
  );

  static TextStyle font12LighterGreyRegular = TextStyle(
    color: ColorsManager.lighterGrey,
    fontWeight: FontWeightHelper.regular,
    fontSize: 12.sp,
    fontFamily: 'Mulish',
  );

  static TextStyle font16BlackRegularLato = TextStyle(
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
    fontSize: 16.sp,
    fontFamily: 'Lato'
  );

  
}
