import 'package:flutter/material.dart';
import 'package:project_frame/core/const/app_colors.dart';

/// TO SHOW WHEN THERE IS NO INTERNET CONNECTION
class InternetErrorWidget extends StatelessWidget {
  const InternetErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_sharp,
              size: 36,
              color: AppColors.black,
            ),
            const SizedBox(height: 10),
            const Text("No Internet Connection"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundColorLight,
                foregroundColor: AppColors.primary,
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: const Text(
                "Try Again",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
