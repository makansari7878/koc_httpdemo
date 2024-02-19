import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Photo>> getRequest() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);
    print(responseData);

    List<Photo> photos = [];
    for (var photoData in responseData) {
      Photo photo = Photo(
        id: photoData["id"],
        albumId: photoData["albumId"],
        title: photoData["title"],
        url: photoData["url"],
        thumbnailUrl: photoData["thumbnailUrl"],
      );
      photos.add(photo);
    }
    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HTTP Get Request"),
          leading: Icon(Icons.get_app),
        ),
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.yellow,
                    elevation: 5,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index].title,
                            style: TextStyle(fontSize: 20, color: Colors.redAccent),
                          ),
                          SizedBox(height: 5),
                          Image.network(
                            snapshot.data[index].thumbnailUrl,
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'Album ID: ${snapshot.data[index].albumId}',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.only(bottom: 20.0),
                      onTap: () {
                        // Handle onTap event
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

