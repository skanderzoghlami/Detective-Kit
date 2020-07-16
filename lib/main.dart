import 'dart:math';

import 'package:detectivekit/views/camera.dart';
import 'package:flutter/material.dart';
import 'package:detectivekit/views/flashlight.dart';
import 'package:detectivekit/views/map.dart';

void main() => runApp(new MyApp());

var COLORS = [
  Color(0x333333),
  Color(0xFFFFFF),
  Color(0xE1F4F3),
  Color(0x706C61),
  Color(0xFFB892FF)
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Detective Kit',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Detective Kit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [
    {
      "title": "Voice-Changing Bowtie",
      "content": "Record a person's voice and use it for more features",
      "color": COLORS[new Random().nextInt(5)],
      "image": "https://www.detectiveconanworld.com/wiki/images/1/19/Vlcsnap-2019-01-05-11h48m34s096.png",
      "route": "bow"
    },
    {
      "title": "Stun-Gun Wristwatch",
      "content": "Capture an image and save it to your phone storage",
      "color": COLORS[new Random().nextInt(5)],
      "image": "https://www.detectiveconanworld.com/wiki/images/2/28/Vlcsnap-2019-01-05-11h48m31s911.png",
      "route": "cam"
    },
    {
      "title": "Wristwatch Flashlight",
      "content": "Turn on the flash light",
      "color": COLORS[new Random().nextInt(5)],
      "image": "https://www.detectiveconanworld.com/wiki/images/7/76/Wristwatch_Flashlight_Profile.jpg",
      "route": "fla"
    },
    {
      "title": "Electronic Notebook Map",
      "content": "find a person's whereabouts based on multiple options",
      "color": COLORS[new Random().nextInt(5)],
      "image": "https://www.detectiveconanworld.com/wiki/images/8/85/Electronic_Notebook_Map_Profile.jpg",
      "route": "enm"
    },
    {
      "title": "Warning",
      "content": "Put this App to good use only !",
      "color": COLORS[new Random().nextInt(5)],
      "image": "https://picsum.photos/225?warning",
      "route":"useless"
    },
//    {
//      "title": "Hey Flutterers, See what I did with Flutter",
//      "content": "This is just a text description of the item",
//      "color": COLORS[new Random().nextInt(5)],
//      "image": "https://picsum.photos/250?random"
//    },
//    {
//      "title": "Hey Flutterers, See what I did with Flutter",
//      "content": "This is just a text description of the item",
//      "color": COLORS[new Random().nextInt(5)],
//      "image": "https://picsum.photos/350?random"
//    },
//    {
//      "title": "Hey Flutterers, See what I did with Flutter",
//      "content": "This is just a text description of the item",
//      "color": COLORS[new Random().nextInt(5)],
//      "image": "https://picsum.photos/275?random"
//    },
//    {
//      "title": "Hey Flutterers, See what I did with Flutter",
//      "content": "This is just a text description of the item",
//      "color": COLORS[new Random().nextInt(5)],
//      "image": "https://picsum.photos/300?random"
//    },
//    {
//      "title": "Hey Flutterers, See what I did with Flutter",
//      "content": "This is just a text description of the item",
//      "color": COLORS[new Random().nextInt(5)],
//      "image": "https://picsum.photos/325?random"
//    }
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: new Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new Stack(
        children: <Widget>[
          new Transform.translate(
            offset: new Offset(0.0, MediaQuery.of(context).size.height * 0.1050),
            child: new ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              scrollDirection: Axis.vertical,
              primary: true,
              itemCount: data.length,
              itemBuilder: (BuildContext content, int index) {
                return RaisedButton(
                  onPressed: ()=>
                        {
                        if(data[index]["route"] == "fla")
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FlashLight() ))
                          else if(data[index]["route"] == "cam")
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Camera() ))
                        else if(data[index]["route"] == "enm")
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Map() ))

                        }
                  ,
                  child: AwesomeListItem(
                      title: data[index]["title"],
                      content: data[index]["content"],
                      color: data[index]["color"],
                      image: data[index]["image"]
                  ),
                );
              },
            ),
          ),

          new Transform.translate(
            offset: Offset(0.0, -56.0),
            child: new Container(
              child: new ClipPath(
                clipper: new MyClipper(),
                child: new Stack(
                  children: [
                    new Image.network(
                      "https://www.detectiveconanworld.com/wiki/images/3/33/Vlcsnap-2019-01-05-12h43m41s737.png",
                      fit: BoxFit.cover,
                    ),
                    new Opacity(
                      opacity: 0.2,
                      child: new Container(color: COLORS[0]),
                    ),
                    new Transform.translate(
                      offset: Offset(0.0, 50.0),
                      child: new ListTile(
                        leading: new CircleAvatar(
                          child: new Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://www.detectiveconanworld.com/wiki/images/3/34/Vlcsnap-2019-01-05-11h48m45s718.png"),
                              ),
                            ),
                          ),
                        ),
                        title: new Text(
                          "Professor Agasa ",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              letterSpacing: 2.0),
                        ),
                        subtitle: new Text(
                          "Professor , Inventor",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height / 4.75);
    p.lineTo(0.0, size.height / 3.75);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class AwesomeListItem extends StatefulWidget {
  String title;
  String content;
  Color color;
  String image;

  AwesomeListItem({this.title, this.content, this.color, this.image});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(width: 10.0, height: 190.0, color: widget.color),
        new Expanded(
          child: new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: new Text(
                    widget.content,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        new Container(
          height: 150.0,
          width: 150.0,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              new Transform.translate(
                offset: new Offset(50.0, 0.0),
                child: new Container(
                  height: 100.0,
                  width: 100.0,
                  color: widget.color,
                ),
              ),
              new Transform.translate(
                offset: Offset(10.0, 20.0),
                child: new Card(
                  elevation: 20.0,
                  child: new Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 10.0,
                            color: Colors.white,
                            style: BorderStyle.solid),
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
