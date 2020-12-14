import 'package:flutter/material.dart';

import 'dialog_set_proxy.dart';

class PageSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // how to set the proxy??
      body: ListView(
        children: [
          ListTile(
            title: Text("Set Proxy"),
            onTap: () {
              showDialog(context: context, builder: (_) => DialogSetProxy());
            },
          )
        ],
      ),
    );
  }
}
