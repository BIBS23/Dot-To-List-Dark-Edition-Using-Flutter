import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:gradient_floating_button/gradient_floating_button.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MyDot extends StatefulWidget {
  MyDot({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDot> createState() => _MyDotState();
}

class _MyDotState extends State<MyDot> {
  List title = [];
  List des = [];
  TextEditingController tx1 = TextEditingController();
  TextEditingController tx2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child:  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Colors.blue,
                      Colors.red,
                    ])),
                height: 100,
                width: 200,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            title[index],
                            style: const TextStyle(
                                fontSize: 30,
                                letterSpacing: 10,
                                fontWeight: FontWeight.bold),
                            colors: const [
                              Colors.green,
                              Colors.blue,
                            ],
                          ),
                          GradientText(
                            des[index],
                            style: const TextStyle(fontSize: 25),
                            colors: const [
                              Colors.green,
                              Colors.blue,
                            ],
                          ),
                        ]
                      ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80, right: 20),
          child: GradientFloatingButton().withLinearGradient(
              onTap: () {
                dialoguebox(context);
              },
              iconWidget: const Icon(Icons.add),
              colors: [
                Colors.blue,
                Colors.red,
              ]
          )
        ),
    );
  }
  Future<dynamic> dialoguebox(BuildContext context) {
    return showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.black,
                      content: Container(
                        height: 400,
                        width: 800,
                        decoration: const BoxDecoration(
                            border: GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                          Colors.blue,
                          Colors.red,
                        ]))),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: GradientText("Create New DOT",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    colors: const [
                                      Colors.blue,
                                      Colors.red,
                                    ])),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 10, right: 10),
                              child: TextField(
                                controller: tx1,
                                style: const TextStyle(color: Colors.blue),
                                decoration: const InputDecoration(
                                  hintText: "TITLE",
                                  hintStyle: TextStyle(
                                      color: Colors.blue, letterSpacing: 10),
                                  border: GradientOutlineInputBorder(
                                      gradient: LinearGradient(colors: [
                                    Colors.blue,
                                    Colors.red,
                                  ])),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 45, left: 10, right: 10),
                              child: TextField(
                                controller: tx2,
                                style: const TextStyle(color: Colors.blue),
                                decoration: const InputDecoration(
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      color: Colors.blue, letterSpacing: 3),
                                  border: GradientOutlineInputBorder(
                                      gradient: LinearGradient(colors: [
                                    Colors.blue,
                                    Colors.red,
                                  ])),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.blue,
                                        Colors.red,
                                      ]),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          var t1 = tx1.text.toUpperCase();
                                          var t2 = tx2.text;
                                          title.add(t1);
                                          des.add(t2);
                                          tx1.clear();
                                          tx2.clear();
                                          Navigator.pop(context);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.transparent),                                      child: GradientText("Create",
                                        style: const TextStyle(fontSize: 20),
                                        colors: const [
                                         Colors.green,
                                         Colors.blue,
                                        ]
                                    ),
                                )
                             ),
                          ),
                        ),
                    ],
                ),
            )
          )
      );
  }
}
