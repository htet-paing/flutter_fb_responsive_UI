import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  Stories({
    @required this.currentUser,
    @required this.stories
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (ctx, i) {
          if (i == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser
              ),
            );
          }
          final Story story = stories[i - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story)
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  _StoryCard({
    this.isAddStory = false,
    this.currentUser,
    this.story
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context)
            ? const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ]
            : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ? 
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                iconSize: 30.0,
                color: Palette.facebookBlue,
                onPressed: () => print('Add a story'),
              ),
            )
          : ProfileAvatar(
            imageUrl: story.user.imageUrl,
            hasBorder: !story.isViewed
          )
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add a Story' : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}