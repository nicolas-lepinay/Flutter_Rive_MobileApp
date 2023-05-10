import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/home/home_screen.dart';

import '../components/animated_bar.dart';
import '../constants.dart';
import '../models/rive_asset.dart';
import '../utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true, // Bottom nav bar doesn't stop body
      body: const HomeScreen(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        //margin: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        decoration: BoxDecoration(
          color: backgroundColor2.withOpacity(0.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              bottomNavs.length,
              (index) => GestureDetector(
                onTap: () {
                  // Show animation
                  bottomNavs[index].input!.change(true);

                  // Set current bottom nav icon
                  if (bottomNavs[index] != selectedBottomNav) {
                    setState(
                      () {
                        selectedBottomNav = bottomNavs[index];
                      },
                    );
                  }

                  // Stop animation
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      bottomNavs[index].input!.change(false);
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs[index].src,
                          artboard: bottomNavs[index].artboard,
                          onInit: (artboard) {
                            StateMachineController? controller = RiveUtils.getRiveController(
                                artboard,
                                stateMachineName: bottomNavs[index].stateMachineName);
                            bottomNavs[index].input = controller!.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
