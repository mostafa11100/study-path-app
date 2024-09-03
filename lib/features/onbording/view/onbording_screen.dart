import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/onbording/view/loginandsignup_button.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesAssets.onbordingbackgroundimg),
              fit: BoxFit.cover),
        ),
        child: SizedBox(
            height: MediaQuery.of(context).size.height / 2.3,
            child: const LoginAndSignupCustomContainer()),
      ),
    );
  }
}
