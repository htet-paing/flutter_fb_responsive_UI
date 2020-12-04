import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'profile_avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  PostContainer({
    @required this.post
  });
  @override
  Widget build(BuildContext context) {
      final bool isDesktop = Responsive.isDesktop(context);
      return Card(
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: isDesktop ? 5.0 : 0.0),
        elevation: isDesktop ? 1.0 : 0.0,
        shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  SizedBox(height: 4.0,),
                  Text(post.caption),
                  post.imageUrl != null ? SizedBox.shrink() : SizedBox(height: 6.0,)
                ],
              ),
            ),
            post.imageUrl != null 
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CachedNetworkImage(imageUrl: post.imageUrl),
              )
              : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  _PostHeader({
   @required this.post
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name, style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              Row(
                children: [
                  Text('${post.timeAgo}.', style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0
                  ),),
                  Icon(
                    Icons.public, 
                    color: Colors.grey[600],
                    size: 12.0
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('More'),
          icon: Icon(Icons.more_vert),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({
    @required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.thumb_up,
              size: 10.0,
              color: Colors.white,),
            ),
            SizedBox(width: 4.0,),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600]
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
            SizedBox(width: 8.0,),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap : () => print('Like')
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap : () => print('Comment')
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap : () => print('Share')
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  _PostButton({
    @required this.icon,
    @required this.label,
    @required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4.0),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}