// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fruitapp/Database.dart';
import 'fruitmodel.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  int total = 0;
  int grandtotal = 0;
  int length=0;
  int totalcount =0;


  totalcounts(){
    setState(() {
      DBHelper.count().then((value) {
        totalcount = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    DBHelper.fetchMemos();
    totalcounts();
  }

  totalamount(FruitModel fruitModel, int product) {
    setState(() {
      int total = fruitModel.price! * product;
      debugPrint("THE TOTAL AMOUNT = $total");
    });
  }

  subtotal(FruitModel fruitModel, int product) {
    setState(() {
      grandtotal = grandtotal + (fruitModel.price! * product);
      debugPrint("THE SUBTOTAL IS: $grandtotal");
    });
  }


  _deleteFormDialog(BuildContext context, id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              "Are you sure to DELETE",
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      DBHelper.deleteMemo(id!);
                      totalcounts();
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Delete")),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Close"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Shopping Cart"),
      ),
      body: FutureBuilder<List<FruitModel>>(
          future: DBHelper.fetchMemos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<FruitModel>? data = snapshot.data;
              if (data!.isEmpty) {
                return const Center(child: Text("txtNoDataAvailable"));
              }
              return Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 15),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      FruitModel fruitModel = data[index];
                      return SizedBox(
                        height: 90.0,
                        width: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(fruitModel.fruitname.toString(),
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                const Text("Price:   ",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text(fruitModel.price.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text("Quantity:   ",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text(fruitModel.quantity.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text("TOTAL:   ",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text(fruitModel.total.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                  width: 25,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _deleteFormDialog(context, data[index].id);
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      );
                    }),
              );
            }
            return const Center(child: Text("txtNoDataAvailable"));
          }),
    );
  }
}

