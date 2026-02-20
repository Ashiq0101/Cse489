
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vangti_chai/controllers/calculator_controller.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize and register the controller. GetX will make sure it's only created once.
    final controller = Get.put(CalculatorController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        title: const Text("VangtiChai", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Wrap the Text widget in Obx to make it reactive to 'input' changes
              Obx(() => Text(
                "Taka: ${controller.input}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              )),
              const SizedBox(height: 16),
              Expanded(
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.portrait) {
                      return _buildPortraitLayout(controller);
                    } else {
                      return _buildLandscapeLayout(controller);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom number pad button widget
  Widget _buildNumpadButton(CalculatorController controller, String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => controller.onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black87,
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(text),
        ),
      ),
    );
  }
  
  // Custom partial layout
  Widget _buildPortraitLayout(CalculatorController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.denominations.map((denom) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                child: Text('$denom: ${controller.noteCounts[denom] ?? 0}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              );
            }).toList(),
          )),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Row(children: [_buildNumpadButton(controller, '1'), _buildNumpadButton(controller, '2'), _buildNumpadButton(controller, '3')]),
              const SizedBox(height: 8),
              Row(children: [_buildNumpadButton(controller, '4'), _buildNumpadButton(controller, '5'), _buildNumpadButton(controller, '6')]),
              const SizedBox(height: 8),
              Row(children: [_buildNumpadButton(controller, '7'), _buildNumpadButton(controller, '8'), _buildNumpadButton(controller, '9')]),
              const SizedBox(height: 8),
              Row(children: [_buildNumpadButton(controller, '0'), _buildNumpadButton(controller, 'CLEAR'), const Spacer()]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(CalculatorController controller) {
    final firstColDenoms = controller.denominations.sublist(0, 4);
    final secondColDenoms = controller.denominations.sublist(4);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: firstColDenoms.map((denom) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Text('$denom: ${controller.noteCounts[denom] ?? 0}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                  )).toList(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: secondColDenoms.map((denom) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Text('$denom: ${controller.noteCounts[denom] ?? 0}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                  )).toList(),
                ),
              ),
            ],
          )),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Row(children: [_buildNumpadButton(controller, '1'), _buildNumpadButton(controller, '2'), _buildNumpadButton(controller, '3'), _buildNumpadButton(controller, '4')]),
              const SizedBox(height: 8),
              Row(children: [_buildNumpadButton(controller, '5'), _buildNumpadButton(controller, '6'), _buildNumpadButton(controller, '7'), _buildNumpadButton(controller, '8')]),
              const SizedBox(height: 8),
              Row(children: [_buildNumpadButton(controller, '9'), _buildNumpadButton(controller, '0'), _buildNumpadButton(controller, 'CLEAR'), const Spacer()]),
            ],
          ),
        ),
      ],
    );
  }
}