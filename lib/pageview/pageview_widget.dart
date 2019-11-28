import 'package:marvelapp/models/response_object.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  final ResponseFull responseFull;

  MyPageView(this.responseFull);

  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
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