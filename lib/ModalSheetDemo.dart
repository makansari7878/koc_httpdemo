
import 'package:flutter/material.dart';
class ModalSheetDemo extends StatefulWidget {
  @override
  ModalBottomSheetState createState() => ModalBottomSheetState();
}

class ModalBottomSheetState extends State<ModalSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modal Bottom Sheet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color:Colors.amberAccent,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Ensure it's centered
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.5, // Adjust the height as needed
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text('Photo'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.music_note),
                              title: Text('Music'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.video_call_rounded),
                              title: Text('Video'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.share),
                              title: Text('Share'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("CLICK"),
            ),
          ],
        ),
      ),
    );
  }
}



