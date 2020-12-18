import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../controller/app.dart';

class SubdivisionDetail extends StatefulWidget {
  final int _category;

  SubdivisionDetail(this._category);

  @override
  _SubdivisionDetail createState() => _SubdivisionDetail(_category);
}

class _SubdivisionDetail extends State<SubdivisionDetail> {
  final int category;

  _SubdivisionDetail(this.category);

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return GestureDetector(
      key: Key("Bubble" + document.id.substring(0, 5)),
      child: Container(
        child: Text(document['title'],
            style: Theme.of(context).textTheme.bodyText2),
        alignment: Alignment.center,
        margin: new EdgeInsets.all(20.0),
        padding: new EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () => _onBubbleTap(context, document),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Subdivisions Detail'),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade50, Colors.blue.shade600])),
          child: SafeArea(
            child: Column(
              children: [
                Column(children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
                      height: MediaQuery.of(context).size.height * 0.89,
                      width: MediaQuery.of(context).size.width,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Bubbles')
                              .where('category', isEqualTo: category)
                              .orderBy('timestamp')
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.none) {
                              Navigator.of(context).pop();
                              return null;
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return const Text(
                                'Loading...',
                                textAlign: TextAlign.center,
                              );
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    _buildListItem(
                                        context, snapshot.data.docs[index]));
                          }))
                ])
              ],
            ),
          ),
        ));
  }

  _onBubbleTap(BuildContext context, DocumentSnapshot bubble) {
    Navigator.pushNamed(context, BubbleDetailRoute,
        arguments: {'bubble': bubble});
  }
}
