import 'package:slashhub_app/core/imports/search_imports.dart';

class StartSearchWidget extends StatelessWidget {
  const StartSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          AppImages.searchLottie,
          width: 300.w,
          height: 200.w,
          fit: BoxFit.cover,
        ),
        DefaultSizedBox.vertical(30.h),
        Text(
          AppStrings.startTypingForSearch,
          style: getBoldStyle(
              color: Colors.grey[300] ?? Colors.transparent, fontSize: 18.sp),
        ),
        DefaultSizedBox.vertical(100.h)
      ],
    );
  }
}
