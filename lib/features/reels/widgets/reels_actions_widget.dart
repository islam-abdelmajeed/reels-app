import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels_app/core/theming/styles.dart';

class ReelsActionsWidget extends StatelessWidget {
  const ReelsActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 430.h,
      right: 15.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 28.w,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            "100",
            style: TextStyles.font12White500Weight,
          ),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.comment,
              color: Colors.white,
              size: 28.w,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            '26',
            style: TextStyles.font12White500Weight,
          ),
          SizedBox(height: 15.h),
          Icon(
            Icons.send,
            color: Colors.white,
            size: 28.w,
          ),
          SizedBox(height: 3.h),
          Text(
            '0',
            style: TextStyles.font12White500Weight,
          ),
        ],
      ),
    );
  }
}
