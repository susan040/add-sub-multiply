import 'package:asm/controller/sum_controller.dart';
import 'package:asm/view/sub_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final c = Get.put(SumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter two numbers:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Form(
                  key: c.keys,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: c.firstController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "First number"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field is required";
                            }
                            return null;
                          }),
                      const SizedBox(height: 17),
                      TextFormField(
                          controller: c.secondController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(width: 2)),
                              hintText: "Second number"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field is required";
                            }
                            return null;
                          })
                    ],
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("ADD:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 40,
                    width: Get.width / 3.4,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () {
                          if (c.keys.currentState!.validate()) {
                            c.firstNumber.value = c.firstController.text;
                            c.secondNumber.value = c.secondController.text;
                            c.addNumbers();
                          }
                        },
                        child: const Text("ADD",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Text("The number is:", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 13),
              Row(
                children: [
                  const Text("a: ",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  Obx(() => Text(c.firstNumber.value,
                      style: const TextStyle(fontSize: 17))),
                ],
              ),
              const SizedBox(height: 11),
              Row(
                children: [
                  const Text("b: ",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  Obx(() => Text(c.secondNumber.value,
                      style: const TextStyle(fontSize: 17)))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text("The sum is:", style: TextStyle(fontSize: 20)),
                  Obx(() => Text(c.result.value.toString(),
                      style: const TextStyle(fontSize: 20))),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 0.5,
            color: Color.fromARGB(255, 249, 183, 205),
            spreadRadius: 2,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 40,
                width: Get.width / 3,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SubScreen());
                    },
                    child: const Text("NEXT",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }
}
