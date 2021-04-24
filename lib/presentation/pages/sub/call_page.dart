import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/pages/sub/single_item_call_page.dart';
import 'package:whatsapp_clone/presentation/widgets/theme/style.dart';

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SingleItemCallPage();
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
    );
  }
}
