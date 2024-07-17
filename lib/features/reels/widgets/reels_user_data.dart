import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels_app/core/theming/app_images.dart';
import '../../../core/theming/styles.dart';

class ReelsUserData extends StatelessWidget {
  const ReelsUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: 10.w,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage(AppImages.userImage),
              ),
              SizedBox(width: 10.w),
              Text(
                "Islam Abdelmajeed",
                style: TextStyles.font13WhiteBoldWeight,
              ),
              SizedBox(width: 10.w),
              Container(
                alignment: Alignment.center,
                width: 60.w,
                height: 25.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  'Follow',
                  style: TextStyles.font12White500Weight,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "Hello everyone .. 👋❤️",
            style: TextStyles.font12White500Weight,
          ),
        ],
      ),
    );
  }
}
