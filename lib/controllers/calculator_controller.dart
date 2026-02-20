// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class CalculatorController extends GetxController {

//   final input = ''.obs;
//   final noteCounts = <int, int>{}.obs;
  
//   final List<int> denominations = const [500, 100, 50, 20, 10, 5, 2, 1];
//   final _box = GetStorage();

//   @override
//   void onInit() {
//     super.onInit();
//     _loadInitialData();
//   }

//   void _loadInitialData() {
//     input.value = _box.read('taka_input') ?? '';
//     _calculateNotes();
//   }

//   void onButtonPressed(String value) {
//     if (value == 'CLEAR') {
//       input.value = '';
//     } else {
//       if (input.isEmpty && value == '0') return;
//       if (input.value.length < 10) {
//         input.value += value;
//       }
//     }

//     _box.write('taka_input', input.value);
//     _calculateNotes();
//   }

//   void _calculateNotes() {
//     int amount = int.tryParse(input.value) ?? 0;
//     Map<int, int> counts = {};
//     int remainingAmount = amount;

//     for (var denom in denominations) {
//       if (remainingAmount >= denom) {
//         counts[denom] = remainingAmount ~/ denom;
//         remainingAmount %= denom;
//       } else {
//         counts[denom] = 0;
//       }
//     }
//     noteCounts.assignAll(counts);
//   }
// }

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CalculatorController extends GetxController {

  final input = ''.obs;
  final noteCounts = <int, int>{}.obs;

  final List<int> denominations = const [500, 100, 50, 20, 10, 5, 2, 1];
  final _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  void _loadInitialData() {
    input.value = _box.read('taka_input') ?? '';
    _calculateNotes();
  }

  void onButtonPressed(String value) {
    if (value == 'CLEAR') {
      input.value = '';
    } else {
      if (input.isEmpty && value == '0') return;
      if (input.value.length < 10) {
        input.value += value;
      }
      

      // --- END: Implemented Logic ---
    }

    _box.write('taka_input', input.value);
    _calculateNotes();
  }

  void _calculateNotes() {
    int amount = int.tryParse(input.value) ?? 0;
    Map<int, int> counts = {};
    int remainingAmount = amount;

    for (var denom in denominations) {
      if (remainingAmount >= denom) {
        counts[denom] = remainingAmount ~/ denom;
        remainingAmount %= denom;
      } else {
        counts[denom] = 0;
      }
    }
    noteCounts.assignAll(counts);
  }
}