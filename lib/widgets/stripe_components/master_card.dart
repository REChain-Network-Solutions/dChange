import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../custom_assets/assets.gen.dart';
import '../../language/english.dart';

Card buildCreditCard({
  required Color color,
  required String cardNumber,
  required String cardHolder,
  required String cardExpiration,
}) {
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.r),
    ),
    child: Container(
      height: 200.h,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.appName.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
              Image.asset(
                Assets.card.stripe.path,
                height: 60.h,
                width: 60.w,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.card.chip.path,
                height: 50.h,
                width: 60.w,
              ),
              SizedBox(width: 8.w),
              Image.asset(
                Assets.card.contactLess.path,
                height: 30.h,
                width: 30.w,
              ),
            ],
          ),
          Text(
            cardNumber,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21.sp,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildDetailsBlock(
                label: Strings.cardHolder.tr.toUpperCase().replaceAll(' ', ''),
                value: cardHolder,
              ),
              buildDetailsBlock(
                  label: Strings.validThru.tr, value: cardExpiration),
            ],
          ),
        ],
      ),
    ),
  );
}

Column buildDetailsBlock({required String label, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: .5,
        ),
      )
    ],
  );
}
