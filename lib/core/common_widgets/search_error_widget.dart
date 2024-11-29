import 'package:lottie/lottie.dart';
import 'package:slashhub_app/core/helpers/app_strings.dart';
import 'package:slashhub_app/core/imports/movies_details_imports.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final void Function()? onPressed;

  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImages.errorLottie,
            width: 200.w,
            height: 150.w,
            fit: BoxFit.cover,
          ),
          DefaultSizedBox.vertical(15.h),
          Text(
            errorMessage,
            style: getMediumStyle(color: ColorManager.white, fontSize: 18.sp),
          ),
          DefaultSizedBox.vertical(20.h),
          SizedBox(
            width: 130.w,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red[800])),
              onPressed: onPressed,
              child: Text(
                AppStrings.retry,
                style:
                    getMediumStyle(color: ColorManager.white, fontSize: 19.sp),
              ),
            ),
          ),
          DefaultSizedBox.vertical(100.h),
        ],
      ),
    );
  }
}
