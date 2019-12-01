import 'package:flutter/material.dart';
import 'package:marvelapp/app/src/bloc/home_bloc.dart';
import 'package:marvelapp/app/src/resources/models/response_object.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    bloc.getUsers();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Marvel API Demo'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          StreamBuilder(
            stream: bloc.allCharacters,
            builder: (context, AsyncSnapshot<ResponseFull> snapshot) {
              if (snapshot.hasData) {
                return buildViewPager(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          StreamBuilder(
            stream: bloc.allCharacters,
            builder: (context, AsyncSnapshot<ResponseFull> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          )
        ])));
  }

  Widget buildList(AsyncSnapshot<ResponseFull> snapshot) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: snapshot.data.data.results.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(snapshot.data.data.results[index].name),
            Image.network(snapshot.data.data.results[index].thumbnail.path +
                "/portrait_xlarge.jpg"),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
    ));
  }

  Widget buildViewPager(AsyncSnapshot<ResponseFull> snapshot) {
    return Expanded(
        child: PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data.data.results.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(snapshot.data.data.results[index].name),
            Image.network(snapshot.data.data.results[index].thumbnail.path +
                "/portrait_xlarge.jpg"),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
    ));
  }
}
