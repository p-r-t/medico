import 'package:flutter/material.dart';
import './request.dart';
import './requestview.dart';

class CardList extends StatefulWidget {
  CardList({Key key, this.title, this.subtitle}) : super(key: key);
  final String subtitle;
  final String title;

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: buildCard(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return Request();
          }));
        },
      ),
    );
  }

  Card buildCard() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assignment_ind),
            title: Text(widget.title),
            subtitle: Text(widget.subtitle),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: const Text("End Request"),
                onPressed: () {},
              ),
              FlatButton(
                child: const Text("View Request"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return PatientRequest();
                  }));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
