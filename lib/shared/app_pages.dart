import 'package:get/get.dart';
import 'package:solitaire/screens/game/game_binding.dart';
import 'package:solitaire/screens/game/game_screen.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: '/game',
      page: () => const GameScreen(),
      binding: GameBinding(),
    ),
  ];
}
