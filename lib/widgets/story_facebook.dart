import 'package:flutter/material.dart';

class StoryFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 50,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
