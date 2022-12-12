// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fruitapp/Database.dart';
import 'package:fruitapp/shopping_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int one = 1;
  int two = 1;
  int three = 1;
  int four = 1;
  int five = 1;
  int six = 1;
  int seven = 1;
  int eight = 1;
  int tot = 1;
  int totval = 1;
  int multiple = 1;
  final List list = [0];
  int totalcount = 0;

  //bool _lightIsOn = true;

  @override
  void initState() {
    super.initState();
    totalcounts();
  }

  totalcounts() {
    setState(() {
      DBHelper.count().then((value) {
        totalcount = value;
      });
    });
  }

  inc() {
    setState(() {
      tot = one + two + three + four + five + six + seven + eight;
    });
  }

  add() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Shopping()),
    );
  }

  increment(BuildContext, String value) {
    if (value == '1') {
      setState(() {
        one++;
      });
    } else if (value == '2') {
      setState(() {
        two++;
      });
    } else if (value == '3') {
      setState(() {
        three++;
      });
    } else if (value == '4') {
      setState(() {
        four++;
      });
    } else if (value == '5') {
      setState(() {
        five++;
      });
    } else if (value == '6') {
      setState(() {
        six++;
      });
    } else if (value == '7') {
      setState(() {
        seven++;
      });
    } else if (value == '8') {
      setState(() {
        eight++;
      });
    }
  }

  decrement(BuildContext, String value) {
    assert(BuildContext != null);
    if (value == '1') {
      setState(() {
        one--;
      });
    } else if (value == '2') {
      setState(() {
        two--;
      });
    } else if (value == '3') {
      setState(() {
        three--;
      });
    } else if (value == '4') {
      setState(() {
        four--;
      });
    } else if (value == '5') {
      setState(() {
        five--;
      });
    } else if (value == '6') {
      setState(() {
        six--;
      });
    } else if (value == '7') {
      setState(() {
        seven--;
      });
    } else if (value == '8') {
      setState(() {
        eight--;
      });
    }
  }

  mutipleOnDialog(BuildContext, String value) {
    if (value == '1') {
      multiple = one * 14;
    } else if (value == '2') {
      multiple = two * 15;
    } else if (value == '3') {
      multiple = three * 21;
    } else if (value == '4') {
      multiple = four * 17;
    } else if (value == '5') {
      multiple = five * 15;
    } else if (value == '6') {
      multiple = six * 12;
    } else if (value == '7') {
      multiple = seven * 45;
    } else if (value == '8') {
      multiple = eight * 19;
    }
  }

  showFormDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (one > 1) {
                                        decrement(context, '1');
                                      }
                                      mutipleOnDialog(context, '1');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$one"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (one >= 1) {
                                        increment(context, "1");
                                      }
                                      mutipleOnDialog(context, '1');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("14", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("$multiple"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Orange').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                      <String, dynamic>{};
                                  data['fruitname'] = 'Orange';
                                  data['quantity'] = one;
                                  data['price'] = 30;
                                  DBHelper.addItem(data).then((value) => {
                                        if (value == 1)
                                          {
                                            debugPrint(
                                                'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                          }
                                      });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog2() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (two > 1) {
                                        decrement(context, '2');
                                      }
                                      mutipleOnDialog(context, '2');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$two"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (two >= 0) {
                                        increment(context, "2");
                                      }
                                      mutipleOnDialog(context, "2");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("15", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Pomogranate').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Pomogranate';
                                  data['quantity'] = two;
                                  data['price'] = 15;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog3() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (three > 1) {
                                        decrement(context, '3');
                                      }
                                      mutipleOnDialog(context, '3');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$three"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (three >= 0) {
                                        increment(context, "3");
                                      }
                                      mutipleOnDialog(context, "3");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("21", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Grapes').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Grapes';
                                  data['quantity'] = three;
                                  data['price'] = 21;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog4() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (four > 1) {
                                        decrement(context, '4');
                                      }
                                      mutipleOnDialog(context, '4');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$four"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (four >= 0) {
                                        increment(context, "4");
                                      }
                                      mutipleOnDialog(context, "4");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("17", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Strawberry').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Strawberry';
                                  data['quantity'] = four;
                                  data['price'] = 17;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog5() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (five > 1) {
                                        decrement(context, '5');
                                      }
                                      mutipleOnDialog(context, '5');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$five"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (five >= 0) {
                                        increment(context, "5");
                                      }
                                      mutipleOnDialog(context, "5");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("15", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Pineapple').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Pineapple';
                                  data['quantity'] = five;
                                  data['price'] = 15;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog6() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (six > 1) {
                                        decrement(context, '6');
                                      }
                                      mutipleOnDialog(context, '6');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$six"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (six >= 0) {
                                        increment(context, "6");
                                      }
                                      mutipleOnDialog(context, "6");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("12", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Avacado').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Avacado';
                                  data['quantity'] = six;
                                  data['price'] = 12;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog7() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (seven > 1) {
                                        decrement(context, '7');
                                      }
                                      mutipleOnDialog(context, '7');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$seven"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (seven >= 0) {
                                        increment(context, "7");
                                      }
                                      mutipleOnDialog(context, "7");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("45", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Guava').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Guava';
                                  data['quantity'] = seven;
                                  data['price'] = 45;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  showFormDialog8() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "You can Adjust Quantity",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green[200],
                          height: 40,
                          width: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (eight > 1) {
                                        decrement(context, '8');
                                      }
                                      mutipleOnDialog(context, '8');
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text("$eight"),
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (eight >= 0) {
                                        increment(context, "8");
                                      }
                                      mutipleOnDialog(context, "8");
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 30,
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("X"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("\$", style: TextStyle(fontSize: 15)),
                        const Text("19", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("=", style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 15,
                        ),

                        Text("$multiple"),

                        // Text(
                        //   price.toString(),
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                totalcounts();
                                DBHelper.count().then((value) {
                                  if (value == 1) {
                                    debugPrint(
                                        'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                  }
                                });
                              });
                              DBHelper.check('Watermelon').then((value) {
                                if (value.isNotEmpty) {
                                  debugPrint(
                                      'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value');
                                } else {
                                  Map<String, dynamic> data =
                                  <String, dynamic>{};
                                  data['fruitname'] = 'Watermelon';
                                  data['quantity'] = eight;
                                  data['price'] = 19;
                                  DBHelper.addItem(data).then((value) => {
                                    if (value == 1)
                                      {
                                        debugPrint(
                                            'SHOW LOCAL DATABASE RECORD ADDED STATUS: $value')
                                      }
                                  });
                                }
                              });
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal),
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ), // Cancel function
                ],
              );
            }),
          );
        });
  }

  final List<String> imgList = [
    'https://wallpapercave.com/dwp1x/wp6557308.jpg',
    'https://wallpapercave.com/wp/wp6557305.jpg',
    'https://wallpapercave.com/wp/wp6557471.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Cloud Fruit Store",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  DBHelper.count().then((value) => {
                        debugPrint(
                            'SHOW LOCAL Hari RECORD ADDED STATUS: $value')
                      });
                  add();
                },
              ),
              list.isEmpty
                  ? Container()
                  : Positioned(
                      child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,
                            size: 20.0, color: Colors.green[500]),
                        Positioned(
                            top: 3.0,
                            left: 3.0,
                            right: 2.0,
                            child: Center(
                              child: Text(
                                "$totalcount",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    )),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imgList
                  .map(
                    (item) => Center(
                      child: Image.network(
                        item,
                        width: double.infinity,
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                      ),
                      child: const Text("All")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                      ),
                      child: const Text("Apple")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                      ),
                      child: const Text("orange")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                      ),
                      child: const Text("Banana")),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: SizedBox(
                    height: 30,
                    width: 60,
                    child: Image.asset('assets/image/all.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 60,
                    child: Image.asset('assets/image/apple.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 60,
                    child: Image.asset('assets/image/orange.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 60,
                    child: Image.asset('assets/image/banana1.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Fresh Deals",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ), // JUST A TEXT OF FRESH DETAILS
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 10,
              ),
              child: Row(
                children: [
                  Container(
                    height: 190,
                    width: 180,
                    decoration: const BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/image/orange.jpg'),
                        ),
                        const Text(
                          "Orange",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$14",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 83,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(19),
                                    bottomRight: Radius.circular(19),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: const BoxDecoration(
                      color: Color(0xffbda988),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 10, top: 10, bottom: 20),
                          child: Image.asset('assets/image/pg.jpg'),
                        ),
                        const Text(
                          "Pomegranate",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$15",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 78,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog2();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //COMPLETED***
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Container(
                    height: 190,
                    width: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xff90EE90),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/image/grapes.jpg'),
                        ),
                        const Text(
                          "Grapes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$21",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog3();
                                        inc();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), //GRAPES
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: const BoxDecoration(
                      color: Color(0xffffc0cb),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/image/sb.jpg'),
                        ),
                        const Text(
                          "StrawBerry",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$17",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog4();
                                        inc();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), //STRAWBERRY
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Row(
                children: [
                  Container(
                    height: 190,
                    width: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xffFED8B1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/image/pa.jpg'),
                        ),
                        const Text(
                          "PineApple",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$15",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog5();
                                        inc();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), // PINE APPLE
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: const BoxDecoration(
                      color: Color(0xffb9797f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/image/a.jpg'),
                        ),
                        const Text(
                          "Avacado",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$12",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 78,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog6();
                                        inc();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), // AVACADO
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 190,
                    width: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xffff726f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/image/guava.jpg'),
                        ),
                        const Text(
                          "Guava",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$45",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 78,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog7();
                                        inc();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), // GUAVA
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: const BoxDecoration(
                      color: Color(0xffffb3f1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 20.0, top: 8),
                          child: Image.asset('assets/image/wm.jpg'),
                        ),
                        const Text(
                          "WaterMelon",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "1kg - \$19",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 78,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(19),
                                    topRight: Radius.circular(19),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFormDialog8();
                                        inc();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight:
                                                  Radius.circular(17))),
                                    ),
                                    child: const Text("ADD")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
