import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:Friends/main.dart';

class FriendProfile extends StatelessWidget {
  final Friends friend;

  FriendProfile(this.friend);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            )),
        new Scaffold(
          appBar: new AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: new Text(
              friend.name,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: _height / 12,
                ),
                new CircleAvatar(
                  radius: _width < _height ? _width / 4 : _height / 4,
                  backgroundImage: NetworkImage(friend.picture),
                ),
                new SizedBox(
                  height: _height / 25.0,
                ),
                new Text(
                  friend.name,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _width / 15,
                      color: Colors.black),
                ),
                new Text(
                  friend.email,
                  style: new TextStyle(
                      fontSize: _width / 20, color: Colors.black87),
                ),
                new Padding(
                  padding: new EdgeInsets.only(
                      top: _height / 30, left: _width / 8, right: _width / 8),
                  child: new Text(
                    friend.about,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: _width / 25,
                        color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
                new Divider(
                  height: _height / 30,
                  color: Colors.white,
                ),
                new Padding(
                  padding:
                      new EdgeInsets.only(left: _width / 8, right: _width / 8),
                  child: new FlatButton(
                    onPressed: () {},
                    child: new Container(
                        child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.person),
                        new SizedBox(
                          width: _width / 30,
                        ),
                        new Text('FOLLOW')
                      ],
                    )),
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
