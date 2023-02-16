import 'package:get/get.dart';
import 'package:solitaire/screens/game/game_controller.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GameController());
  }
}
