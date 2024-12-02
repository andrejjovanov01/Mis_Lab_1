import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListSubjects(),
  ));
}

class ListSubjects extends StatefulWidget {
  @override
  _ListSubjectsState createState() => _ListSubjectsState();
}

class _ListSubjectsState extends State<ListSubjects> {
  List<Map<String, String>> items = [
    {
      "title": "T-shirt",
      "price": "10",
      "description": "A comfortable cotton t-shirt.",
      "image": "../lib/images/tshirt.jpg"
    },
    {
      "title": "Jacket",
      "price": "50",
      "description": "A warm and stylish jacket.",
      "image": "../lib/images/jacket.jpg"
    },
    {
      "title": "Shoes",
      "price": "70",
      "description": "Durable and fashionable running shoes.",
      "image": "../lib/images/shoes.jpg"
    },
  ];

  Color myCustomColor2 = Color(0xFFFFFFFF);
  Color myCustomColor = Color(0xFF1A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "201189",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildCard(items[index]);
        },
      ),
    );
  }

  Widget buildCard(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: item["title"]!,
              price: item["price"]!,
              description: item["description"]!,
              image: item["image"]!,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 11.0, 8.0, 15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: myCustomColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                item["image"]!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item["title"]!,
                      style: TextStyle(
                        fontSize: 20,
                        color: myCustomColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "\$${item["price"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String image;

  DetailScreen({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Price: \$${price}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}