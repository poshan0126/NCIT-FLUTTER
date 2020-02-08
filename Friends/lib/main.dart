import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Friends/Screens/friendsprofile.dart';
// import 'package:Friends/Screens/friendslist.dart';
// import 'package:Friends/Widgets/appdrawer.dart';

void main() => runApp(MyFriends());

class MyFriends extends StatefulWidget {
  @override
  _MyFriendsState createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {
  Future<List<Friends>> _getFriends() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/cgqDKqTsBK?indent=2");
    var friends_data = json.decode(data.body);
    List<Friends> friendsList = [];
    for (var u in friends_data) {
      Friends fr =
          Friends(u["index"], u["about"], u["email"], u["name"], u["picture"]);
      friendsList.add(fr);
    }
    return friendsList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'MY FRIENDS',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
            future: _getFriends(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data[index].picture),
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].email),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    FriendProfile(snapshot.data[index])));
                      },
                    );
                  },
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text("Add"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.black26,
      ),
    ));
  }
}

class Friends {
  final int index;
  final String about;
  final String name;
  final String email;
  final String picture;

  Friends(this.index, this.about, this.email, this.name, this.picture);
}
