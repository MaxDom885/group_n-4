import 'package:flutter/material.dart';

class responsive_widget extends StatelessWidget {
  const responsive_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print(constraints);
          if (constraints.maxWidth<=780){
            //phone
            return Scaffold();

          }
          if (constraints.maxWidth>=780 && constraints.maxWidth<=992){
            //tablet
            return Scaffold();
          }
          if (constraints.maxWidth>=992) {
            //desktops
            return Scaffold();
          }
          return Container(

          );
        },),

    );
  }
}
