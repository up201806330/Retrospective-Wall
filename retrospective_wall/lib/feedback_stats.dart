import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:retrospective_wall/feedback_text.dart';

class FeedbackStats extends StatefulWidget {
  final DocumentSnapshot _bubble;

  FeedbackStats(this._bubble);

  @override
  State<StatefulWidget> createState() => _FeedbackStats(_bubble);
}

class _FeedbackStats extends State<FeedbackStats> {

  final DocumentSnapshot _bubble;

  bool thumbsDown = false;
  bool thumbsUp = false;

  int likeCounter = 10;
  int dislikeCounter = 2;

  static const double LikeButtonSize = 60;

  _FeedbackStats(this._bubble);

  @override
  Widget build(BuildContext context) {

    // Bubble bubble = new Bubble(_bubble.id,_bubble['title'],_bubble['isAnonymous'],_bubble['category'],FeedbackText('Summary',_bubble['text']));

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LikeButton(
            size: LikeButtonSize,
            // isLiked: null,
            circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                // Icons.arrow_upward_rounded,
                Icons.thumb_up,
                color: isLiked ? Colors.blue : Colors.grey,
                size: LikeButtonSize,
              );
            },

            likeCount: likeCounter,
            isLiked: thumbsUp,

            countBuilder: (int count, bool isLiked, String text) {
              /*print(count); print('\n');
                  print(isLiked); print('\n');*/
              var color = isLiked ? Colors.blue : Colors.grey;
              Widget result;
              if (count == 0) {
                result = Text(
                  "likes",
                  style: TextStyle(color: color),
                );
              } else
                result = Text(
                  text,
                  style: TextStyle(color: color),
                );
              return result;
            },
            onTap: onLikeButtonTapped,
          ),
          LikeButton(
            size: LikeButtonSize,
            circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                // Icons.arrow_downward_rounded,
                Icons.thumb_down,
                color: isLiked ? Colors.orange : Colors.grey,
                size: LikeButtonSize,
              );
            },
            likeCount: dislikeCounter,
            isLiked: thumbsDown,

            likeCountPadding: const EdgeInsets.only(left: 3.0, right: 3.0),

            countBuilder: (int count, bool isLiked, String text) {
              var color = isLiked ? Colors.orange : Colors.grey;
              Widget result;
              if (count == 0) {
                result = Text(
                  "like",
                  style: TextStyle(color: color),
                );
              } else
                result = Text(
                  text,
                  style: TextStyle(color: color),
                );
              return result;
            },
            onTap: onDislikeButtonTapped,
          ),
        ],
      ),

    );


  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    setState(() {
      if (isLiked) likeCounter--;
      if (!isLiked) {
        likeCounter++;
        if (thumbsDown) {thumbsDown = false; dislikeCounter--;}
      }

      isLiked = !isLiked;
      thumbsUp = isLiked;
    });

    return isLiked;
  }

  Future<bool> onDislikeButtonTapped(bool isLiked) async{

    setState(() {
      if (isLiked) dislikeCounter--;
      if (!isLiked) {
        dislikeCounter++;
        if (thumbsUp) {thumbsUp = false; likeCounter--;}
      }
      isLiked = !isLiked;
      thumbsDown = isLiked;
    });

    return isLiked;
  }

}