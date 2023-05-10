import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      required this.src,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "Messages",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Rechercher",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Rendez-vous",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notifications",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profil",
      src: "assets/RiveAssets/icons.riv"),
];
