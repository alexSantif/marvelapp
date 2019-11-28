import 'dart:convert';
import 'package:marvelapp/home/home_bloc.dart';
import 'package:marvelapp/network/network.dart';
import 'package:marvelapp/models/character.dart';
import 'package:marvelapp/models/response_object.dart';
import 'package:marvelapp/pageview/pageview_widget.dart';
import 'package:marvelapp/listview/listview_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Marvel API Demo"),
        ),
        body: Container(
            child: Column(
            children: <Widget>[
              StreamBuilder<ResponseFull>(
                stream: null,
                initialData: ResponseFull(null, null, null),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Deu ruim");
                  }

                  return MyPageView(snapshot.data);
                }
              ),
              StreamBuilder<ResponseFull>(
                  stream: homeBloc.streamOutput,
                  initialData: ResponseFull(null, null, null),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Deu ruim");
                    }
                    return MyListView(snapshot.data);
                  }
              )
            ],
        )));
  }
}
