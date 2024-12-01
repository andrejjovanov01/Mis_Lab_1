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
  List<Widget> cards = [];
  // String selectedTheme = "lib/images/3.jpg";

  @override
  void initState(){
    super.initState();
    cards.add(buildCard('T-shirt', '10'));
    cards.add(buildCard('Веб базирани системи', 'Јовановиќ Милош'));
    cards.add(buildCard('Напредна интеракција човек-компјутер', 'Ацковска Невена'));
    cards.add(buildCard('Мобилни информациски ситеми', 'Ламески Петре'));
    cards.add(buildCard('Менаџмент информациски ситеми', 'Велинов Горан'));
    cards.add(buildCard('Тимски проект', 'Ламески Петре'));
  }

  Color myCustomColor2 = Color(0xFFFFFFFF);
  Color myCustomColor = Color(0xFF1A237E);
  Widget buildCard(String title, String subTitle) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: Text('Delete'),
              content: Container(
                width: 300,
                child: Text('Are you sure to delete?'),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              actions: [
                TextButton(
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => Navigator.pop(context, true),
                ),
                TextButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (_) {
        setState(() {
          cards.removeWhere((item) => item.key == UniqueKey());
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Subject deleted')),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
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
                'lib/images/img.jpg',
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: myCustomColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 5),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 5),
            ],
          ),
        ),
      ),
    );
  }

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
      body: ListView(
        children: cards,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewScreen()),
          );

          if (result != null && result.length == 2) {
            String subject = result[0];
            String prof = result[1];
            setState(() {
              cards.add(buildCard(subject, prof));
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _notesEditingController = TextEditingController();
  String selectedTheme = "lib/images/3.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Create Subject'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30.0),
              TextFormField(
                controller: _nameEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter subject name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _notesEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter subject professor',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String name = _nameEditingController.text;
                    String notes = _notesEditingController.text;
                    Navigator.pop(context, [name, notes]);
                  }
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}