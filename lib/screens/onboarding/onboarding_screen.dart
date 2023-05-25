import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';
import 'components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false, // Doesn't play on app start
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND (SPLINE)
          Positioned(
            bottom: 200,
            left: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Opacity(
              opacity: 0.7, // Tweak pour changer l'opacité éventuellement
              child: Image.asset('assets/Backgrounds/Spline.png'),
            ),
          ),
          // BLUR BACKDROP FILTER (INVISIBLE ???)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
            ),
          ),
          // RIV ANIMATION
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
            fit: BoxFit.fitWidth,
          ),
          // BLUR BACKDROP FILTER
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: const SizedBox(), // Nécessaire pour que le blur apparaisse
            ),
          ),
          // TEXT
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            height: MediaQuery.of(context).size.height,
            top: isSignInDialogShown ? -50 : 0,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 3),
                    SizedBox(
                      child: Column(
                        children: const [
                          Text(
                            "Flutter & Rive",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            "Une application faite avec le framework Flutter, la biliothèque d'animation Rive et beaucoup d'amour.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 800), () {
                          setState(() {
                            isSignInDialogShown = true; // Moves text up
                          });
                          customSignInDialog(
                            context,
                            onClosed: (_) {
                              setState(() {
                                isSignInDialogShown = false; // Moves text down
                              });
                            },
                          ); // Open sign-in dialog
                        });
                      },
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 24),
                    //   child: Text("Développée avec Flutter et Rive"),
                    // )
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
