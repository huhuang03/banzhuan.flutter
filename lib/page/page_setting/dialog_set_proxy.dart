import 'package:banzhuan/ds/ds_proxy.dart';
import 'package:flutter/material.dart';

class DialogSetProxy extends StatelessWidget {
  final ctrlHost = TextEditingController();
  final ctrlPort = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (hasProxy()) {
      ctrlHost.text = getProxyHost();
      ctrlPort.text = getProxyPort();
    }
    return Scaffold(
      body: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Proxy Host:"
                ),
                controller: ctrlHost,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Proxy Port:"
                ),
                controller: ctrlPort,
              ),

              RaisedButton(child: Text("Sure"), onPressed: () {
                setProxy(ctrlHost.text, ctrlPort.text);
                Navigator.pop(context);
             },),
              RaisedButton(child: Text("Cancel"), onPressed: () {
                Navigator.pop(context);
              },),
            ],
          ),
        )
    );
  }
}
