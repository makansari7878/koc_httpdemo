import 'package:flutter/material.dart';
import 'package:koc_httpdemo/HttpDemo.dart';

import 'ModalSheetDemo.dart';
import 'WebViewDemo.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
       title: "My title",
      home: WebViewApp()
    );
  }

}
