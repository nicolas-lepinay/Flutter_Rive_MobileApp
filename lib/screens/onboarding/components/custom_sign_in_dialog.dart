import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_in_form.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true, // se ferme quand on clique en dehors
    barrierLabel:
        "Se connecter", // OBLIGATOIRE pour que barrierDismissible fonctionne
    context: context,
    transitionDuration: const Duration(milliseconds: 500),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 640,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 36),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            reverse: true,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Entrez votre identifiant et votre mot de passe pour vous connecter à l'application.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SignInForm(),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "OU",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Se connecter avec Apple ou Google",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(2),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/apple_round.svg",
                            color: Colors.black87,
                            height: 86,
                            width: 86,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/google_round.svg",
                            color: Colors.black87,
                            height: 86,
                            width: 86,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Positioned(
                  bottom: -56,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
