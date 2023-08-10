import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumController extends GetxController {
  final keys = GlobalKey<FormState>();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  RxString firstNumber = "No Text".obs;
  RxString secondNumber = "No Text".obs;
  RxInt result = RxInt(0);

  void addNumbers() {
    int firstNum = int.tryParse(firstNumber.value) ?? 0;
    int secondNum = int.tryParse(secondNumber.value) ?? 0;
    result.value = firstNum + secondNum;
  }
}
