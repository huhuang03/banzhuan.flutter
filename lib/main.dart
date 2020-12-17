import 'dart:io';

import 'package:banzhuan/ds/ds_proxy.dart';
import 'package:banzhuan/market/huobi/api_huobi.dart';
import 'package:banzhuan/market/okex/api_okex.dart';
import 'package:banzhuan/page/home/page_home.dart';
import 'package:flutter/material.dart';
import 'package:dio/adapter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thyi/thyi.dart';

import 'market/bian/api_bian.dart';

void thyiSetProxy(Thyi thyi) {
  (thyi.dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.findProxy = (uri) {
      //proxy all request to localhost:8888
      if (hasProxy()) {
        print("has proxy: ${getProxyHost()}:${getProxyPort()}");
        return "PROXY ${getProxyHost()}:${getProxyPort()}";
      } else {
        print("has no proxy");
        return "DIRECT";
      }
    };
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
}

void main() async {
  await GetStorage.init();
  // databasePath = await getDatabasesPath();

  thyiSetProxy(thyiBian);
  thyiSetProxy(thyiHuobi);
  thyiSetProxy(thyiOkex);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '差价计算'),
    );
  }
}

