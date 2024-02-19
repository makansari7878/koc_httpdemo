import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koc_httpdemo/model/UserData.dart';

class HttpDemo extends StatefulWidget {
  @override
  HttpDemoState createState() => HttpDemoState();
}

class HttpDemoState extends State<HttpDemo> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);
    print(responseData);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          body: singleUser["body"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          leading: Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(

                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) => Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.amberAccent,
                      elevation: 5,
                      child: ListTile(
                        title: Text(snapshot.data[index].title, style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                        subtitle: Text(snapshot.data[index].body,style: TextStyle(fontSize: 15, color: Colors.blue),),
                        contentPadding: EdgeInsets.only(bottom: 20.0),
                      ),
                    )
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

