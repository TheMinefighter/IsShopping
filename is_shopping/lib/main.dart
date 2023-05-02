import 'package:flutter/material.dart';
import 'shopping_item.dart';

final myController = TextEditingController();

void main() => runApp(const MaterialApp(home: TextListDisplayer()));

class TextListDisplayer extends StatefulWidget {
  const TextListDisplayer({super.key});

  @override
  _TextListDisplayer createState() => _TextListDisplayer();
}

class _TextListDisplayer extends State<TextListDisplayer> {
  List<ShoppingItem> shoppingList = [
    ShoppingItem(itemName: "Milk", emoji: "🐄"),
    ShoppingItem(itemName: "Cheese", emoji: "🧀"),
    ShoppingItem(itemName: "Pizza", emoji: "🍕"),
  ];

  Widget shoppingItemTemplate(shoppingItem) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  '${shoppingItem.itemName} ${shoppingItem.emoji}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.purple,
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("IsShopping"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: shoppingList
              .map((shoppingItem) => shoppingItemTemplate(shoppingItem))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            shoppingList.add(ShoppingItem(itemName: "Cum", emoji: "🤍"));
          });
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
