import 'package:marvelapp/models/response_object.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  final ResponseFull responseFull;

  MyListView(this.responseFull);

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.responseFull?.data?.results?.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Text(widget.responseFull?.data?.results[index]?.name),
                Image.network(
                    widget.responseFull?.data?.results[index]?.thumbnail?.path +
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