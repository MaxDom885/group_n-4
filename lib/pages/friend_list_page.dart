import 'package:flutter/material.dart';
import 'package:training/models/person_dart.dart';
import 'package:training/pages/friend_form_page.dart';
import 'package:training/pages/friend_page.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  String name = "";
  bool liked = false;
  List<Person> persons = [];
  List<Person> friends = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Hello Samiat",
        style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: () async {
                Person person = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FriendPage(
                        friends: friends,
                      ),
                    ));
                print(person.name);
                friends.remove(person);
                setState(() {});
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      body:
      Container(
        margin: EdgeInsets.all(20.0),
        color: Colors.white,
        child:
        ListView(
    padding: EdgeInsets.all(20),
    children: persons.map((person) => ListTile(
    title: Text("${person.name} ${person.surname}",
      style: TextStyle(fontWeight: FontWeight.bold),),
    subtitle: Text("${person.bio}...${person.parti}"),
    leading: CircleAvatar(
      backgroundImage: NetworkImage('https://media.istockphoto.com/id/1293444852/photo/african-american-motivational-speaker-on-stage.jpg?s=1024x1024&w=is&k=20&c=WMBLm-j4ZoRBbscqAUI_uKwuHBp0a9LnBmvcNf1FxO4='),
    ),
    trailing: Icon(
    Icons.star,
    color: checkIfExists(person) ? Colors.yellow : Colors.black,
    ),

    onTap: () {
    addFriend(person);
    setState(() {});
    },

    ))
        .toList(),
    ),
    ),
      
      floatingActionButton: FloatingActionButton(
      foregroundColor: Colors.green,
      onPressed: () async {
        Person person = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FriendFormPage(),
            ));

        setState(() => persons.add(person));
      },
      child: Icon(Icons.add),
    ),
    );
  }

  bool checkIfExists(Person person) {
    return friends.contains(person);
  }

  void addFriend(Person person) {
    if (!checkIfExists(person)) {
      friends.add(person);
    } else {
      friends.remove(person);
    }
  }
}
