import 'package:flutter/material.dart';
import 'package:training/common/I_button.dart';
import 'package:training/common/i_input.dart';
import 'package:training/models/person_dart.dart';

class FriendFormPage extends StatefulWidget {
  const FriendFormPage({super.key});

  @override
  State<FriendFormPage> createState() => _FriendFormPageState();
}

class _FriendFormPageState extends State<FriendFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Person person= Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidate creation"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IIinput(
                name: 'Nom',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                 // print("Valeur à sauvegarder $value");
                  person.name=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
             SizedBox(height: 20,),
              IIinput(
                name: 'Prénom(s)',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.surname=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20,),
              IIinput(
                name: 'Description',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.bio=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20,),
              IIinput(
                name: 'Parti Politique',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.parti=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
          if(  _formKey.currentState!.validate()){
            _formKey.currentState!.save();
           Navigator.pop(context, person);
          }
          },
          text: 'Ajouter Candidat',
        ),
      ),
    );
  }
}
