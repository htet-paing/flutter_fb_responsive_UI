import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  CreatePostContainer({@required this.currentUser});
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                SizedBox(width: 8.0,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?'
                    ),
                  ),
                )
              ],
            ),
            Divider(height: 10, thickness: 0.5,),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () => print('Live'),
                    icon: Icon(Icons.videocam, 
                    color: Colors.red),
                    label: Text('Live'),  
                  ),
                  VerticalDivider(width: 8.0),

                  FlatButton.icon(
                    onPressed: () => print('Photo'),
                    icon: Icon(Icons.photo_library,
                    color: Colors.green),
                    label: Text('Photo'),  
                  ),
                  VerticalDivider(width: 8.0),
                  FlatButton.icon(
                    onPressed: () => print('Room'),
                    icon: Icon(Icons.video_call,
                    color: Colors.purpleAccent),
                    label: Text('Room'),  
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}