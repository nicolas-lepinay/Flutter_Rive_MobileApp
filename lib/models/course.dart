import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course(
      {required this.title,
      this.description =
          "Créer et animer une application mobile avec Flutter et la bibliothèque Rive.",
      this.iconSrc = "assets/icons/code.svg",
      this.bgColor = const Color(0xFF7553F6)});
}

List<Course> courses = [
  Course(title: "Animations avec Flutter"),
  Course(
      title: "La données avec Swift et Realm",
      description:
          "Saucegarder et récupérer de la données dans une application iOS avec Swift et Realm.",
      iconSrc: "assets/icons/ios.svg",
      bgColor: const Color(0xFF80A4FF))
];

List<Course> recentCourses = [
  Course(title: "State Machine"),
  Course(title: "Menu animé", iconSrc: "assets/icons/ios.svg", bgColor: const Color(0xFF9CC5FF)),
  Course(title: "Live chat"),
  Course(
      title: "Barre de navigation",
      iconSrc: "assets/icons/code.svg",
      bgColor: const Color(0xFF9CC5FF))
];
