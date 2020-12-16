import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:retrospective_wall/feedback_text.dart';

import 'globals.dart';

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
  bool initialThumbsUp = false;
  bool initialThumbsDown = false;

  bool hasChecked = false;

  int likeCounter;
  int dislikeCounter;

  static const double LikeButtonSize = 60;

  _FeedbackStats(this._bubble) {
    this.likeCounter = _bubble['nLikes'];
    this.dislikeCounter = _bubble['nDislikes'];
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Not Logged in!"),
      content: Text("You have to be logged in to like or dislike a bubble."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!hasChecked && FirebaseAuth.instance.currentUser != null) {
      Future<Null> preferences = FirebaseFirestore.instance
          .collection('UsersPreferences')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .get()
          .then((value) {
        var docs = value.docs;
        if (docs.length > 0) {
          var document = docs[0];
          List likeIds = document['likeIds'];
          for (var i = 0; i < likeIds.length; i++) {
            if (likeIds[i] == _bubble.id) {
              setState(() {
                thumbsUp = true;
                initialThumbsUp = true;
                thumbsDown = false;
                hasChecked = true;
              });
              break;
            }
          }

          List dislikeIds = document['dislikeIds'];
          for (var i = 0; i < dislikeIds.length; i++) {
            if (dislikeIds[i] == _bubble.id) {
              setState(() {
                thumbsDown = true;
                initialThumbsDown = true;
                thumbsUp = false;
                hasChecked = true;
              });
              break;
            }
          }
        } else
          return null;
      });
    }

    return WillPopScope(
      onWillPop: _updateLikesDislikes,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LikeButton(
              key: Key('LikeButton'),
              size: LikeButtonSize,
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
                if (count < 0) {
                  result = Text(
                    "no likes",
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
              key: Key("DislikeButton"),
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
                if (count < 1) {
                  result = Text(
                    "no dislikes",
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
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    setState(() {
      if (isLoggedIn) {
        if (isLiked) likeCounter--;
        if (!isLiked) {
          likeCounter++;
          if (thumbsDown) {
            thumbsDown = false;
            dislikeCounter--;
          }
        }

        isLiked = !isLiked;
        thumbsUp = isLiked;
      } else {
        showAlertDialog(context);
      }
    });

    return isLiked;
  }

  Future<bool> onDislikeButtonTapped(bool isLiked) async {
    setState(() {
      if (isLoggedIn) {
        if (isLiked) dislikeCounter--;
        if (!isLiked) {
          dislikeCounter++;
          if (thumbsUp) {
            thumbsUp = false;
            likeCounter--;
          }
        }
        isLiked = !isLiked;
        thumbsDown = isLiked;
      } else {
        showAlertDialog(context);
      }
    });

    return isLiked;
  }

  void updateDataFirebase(bool initDown, bool initUp, bool down, bool up,
      QueryDocumentSnapshot doc, DocumentSnapshot bubble) {
    print('Document again!!!!!!!!!!!!!!!!!!!!!!!');
    print(doc);
    print(initUp);
    print(initDown);
    print(up);
    print(down);
    if (doc != null) {
      if (initDown == false && initUp == false) {
        if (up) {
          List currentLikeIds = doc['likeIds'];
          currentLikeIds.add(_bubble.id);
          doc.reference.update({'likeIds': currentLikeIds});
        } else if (down) {
          List currentDislikeIds = doc['dislikeIds'];
          currentDislikeIds.add(_bubble.id);
          doc.reference.update({'dislikeIds': currentDislikeIds});
        }
      } else if (initUp && !initDown) {
        if (down) {
          List currentLikeIds = doc['likeIds'];
          List currentDislikeIds = doc['dislikeIds'];
          currentLikeIds.removeWhere((element) => element == bubble.id);
          currentDislikeIds.add(_bubble.id);
          doc.reference.update(
              {'likeIds': currentLikeIds, 'dislikeIds': currentDislikeIds});
        } else if (!down && !up) {
          List currentLikeIds = doc['likeIds'];
          currentLikeIds.removeWhere((element) => element == bubble.id);
          doc.reference.update({'likeIds': currentLikeIds});
        }
      } else if (initDown && !initUp) {
        if (up) {
          List currentLikeIds = doc['likeIds'];
          List currentDislikeIds = doc['dislikeIds'];
          currentDislikeIds.removeWhere((element) => element == bubble.id);
          currentLikeIds.add(_bubble.id);
          doc.reference.update(
              {'likeIds': currentLikeIds, 'dislikeIds': currentDislikeIds});
        } else if (!down && !up) {
          List currentDislikeIds = doc['dislikeIds'];
          currentDislikeIds.removeWhere((element) => element == bubble.id);
          doc.reference.update({'dislikeIds': currentDislikeIds});
        }
      }
    }
  }

  Future<bool> _updateLikesDislikes() async {
    if (initialThumbsDown != thumbsDown || initialThumbsUp != thumbsUp) {
      Future<Null> preferences = FirebaseFirestore.instance
          .collection('UsersPreferences')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .get()
          .then((value) {
        var docs = value.docs;
        print(docs.length);
        if (docs.length > 0) {
          var document = docs[0];
          updateDataFirebase(initialThumbsDown, initialThumbsUp, thumbsDown,
              thumbsUp, document, _bubble);
        } else
          return null;
      });

      _bubble.reference
          .update({'nLikes': likeCounter, 'nDislikes': dislikeCounter});
    }

    setState(() {
      hasChecked = false;
    });

    return true;
  }
}
