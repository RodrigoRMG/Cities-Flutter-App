import 'package:flutter/material.dart';
import 'package:flutter_app/City.dart';
import 'package:flutter_app/Animation/FadeAnimation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const aspectRatio = 2.5 / 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.black)),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          AspectRatio(
                            aspectRatio: aspectRatio,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "All",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          )),
                      FadeAnimation(
                          1.2,
                          AspectRatio(
                              aspectRatio: aspectRatio,
                              child: Container(
                                child: Center(
                                  child: Text("Japan",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              ))),
                      FadeAnimation(
                          1.4,
                          AspectRatio(
                              aspectRatio: aspectRatio,
                              child: Container(
                                child: Center(
                                  child: Text("Mexico",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              ))),
                      FadeAnimation(
                          1.5,
                          AspectRatio(
                              aspectRatio: aspectRatio,
                              child: Container(
                                child: Center(
                                  child: Text("Spain",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              ))),
                      FadeAnimation(
                          1.8,
                          AspectRatio(
                              aspectRatio: aspectRatio,
                              child: Container(
                                child: Center(
                                  child: Text("Germany",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              ))),
                      FadeAnimation(
                          2,
                          AspectRatio(
                              aspectRatio: aspectRatio,
                              child: Container(
                                child: Center(
                                  child: Text("Brazil",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              )))
                    ],
                  )),
              SizedBox(height: 20),
              FadeAnimation(
                  1,
                  makeItem(
                      image: 'assets/images/japan.jpg',
                      tag: 'Japan',
                      city: "Tokio",
                      context: context)),
              FadeAnimation(
                  1.5,
                  makeItem(
                      image: 'assets/images/mexico.jpg',
                      tag: 'Mexico',
                      city: "San cristobal",
                      context: context)),
              FadeAnimation(
                  2,
                  makeItem(
                      image: 'assets/images/germany.jpg',
                      tag: 'Germany',
                      city: "Berlin",
                      context: context))
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget makeItem({image, tag, city, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      City(image: image, tag: tag, city: city)));
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.0)
                      ]),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]),
            ),
            Container(
                padding: EdgeInsets.all(20),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(begin: Alignment.topRight, colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.0)
                  ]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                city,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                tag,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: Icon(Icons.favorite_border, size: 20),
                          ),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
