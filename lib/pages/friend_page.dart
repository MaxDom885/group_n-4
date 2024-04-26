import 'package:flutter/material.dart';

import '../models/person_dart.dart';

class FriendPage extends StatelessWidget {
  final List<Person> friends;

  FriendPage({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidats favoris"),
      ),

      body: ListView(
        children: friends.map((person) => ListTile(
          title: Text("${person.name} ${person.surname}",
          style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("${person.bio}...${person.parti }"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://media.istockphoto.com/id/1293444852/photo/african-american-motivational-speaker-on-stage.jpg?s=1024x1024&w=is&k=20&c=WMBLm-j4ZoRBbscqAUI_uKwuHBp0a9LnBmvcNf1FxO4='),

          ),
          onTap: () => Navigator.pop(context, person),

      )).toList(),
    )
    );
  }
}
