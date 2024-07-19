import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int total = 0;
  void incrementNumber(int count) {
    print(count);
    setState(() {
      total += count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        body: Column(children: [
          Expanded(
              child: Column(children: [
            ShoppingItem(
              title: "iPad Pro",
              onIncrement: (int count) {
                incrementNumber(count);
              },
            ),
          ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                total.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              const Text(
                "Bath",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange),
                child: const Text("Clear"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}

class ShoppingItem extends StatefulWidget {
  final String title;
  final Function(int count) onIncrement;
  ShoppingItem({required this.title, required this.onIncrement});

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 28),
              ),
              const Text("32,000฿")
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                icon: const Icon(Icons.remove)),
            const SizedBox(
              width: 10,
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                  widget.onIncrement(count);
                },
                icon: const Icon(Icons.add))
          ],
        )
      ],
    );
  }
}
