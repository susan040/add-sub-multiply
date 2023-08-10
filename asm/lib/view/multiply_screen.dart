import 'package:asm/controller/multiply_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiplyScreen extends StatelessWidget {
  MultiplyScreen({super.key});
  final c = Get.put(MultiplyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multiply")),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    "To multiply:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text("Show fields?", style: TextStyle(fontSize: 22)),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    width: Get.width / 2,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                top: Radius.circular(35.0),
                              )),
                              context: context,
                              builder: ((context) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 35, left: 20, right: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Enter two numbers:",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 15),
                                          Form(
                                              key: c.keys,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                      controller:
                                                          c.firstController,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              hintText:
                                                                  "First number"),
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return "This field is required";
                                                        }
                                                        return null;
                                                      }),
                                                  const SizedBox(height: 17),
                                                  TextFormField(
                                                      controller:
                                                          c.secondController,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      width:
                                                                          2)),
                                                          hintText:
                                                              "Second number"),
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return "This field is required";
                                                        }
                                                        return null;
                                                      })
                                                ],
                                              )),
                                          const SizedBox(height: 20),
                                          Center(
                                            child: SizedBox(
                                              height: 50,
                                              width: Get.width / 2,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7))),
                                                  onPressed: () {
                                                    if (c.keys.currentState!
                                                        .validate()) {
                                                      c.firstNumber.value = c
                                                          .firstController.text;
                                                      c.secondNumber.value = c
                                                          .secondController
                                                          .text;
                                                      c.multiplyNumbers();
                                                    }
                                                  },
                                                  child: const Text("Multiply",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                            ),
                                          ),
                                        ]),
                                  )));
                        },
                        child:
                            const Text("OK", style: TextStyle(fontSize: 18))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        const Text("The number is:",
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 13),
                        Row(
                          children: [
                            const Text("a: ",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold)),
                            Obx(() => Text(c.firstNumber.value,
                                style: const TextStyle(fontSize: 17))),
                          ],
                        ),
                        const SizedBox(height: 11),
                        Row(
                          children: [
                            const Text("b: ",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold)),
                            Obx(() => Text(c.secondNumber.value,
                                style: const TextStyle(fontSize: 17)))
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text("The multiply is:",
                                style: TextStyle(fontSize: 20)),
                            Obx(() => Text(c.result.value.toString(),
                                style: const TextStyle(fontSize: 20))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
