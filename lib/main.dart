import 'package:flutter/material.dart';
import 'package:wallpaper_app/wallpage2.dart';

main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myapp',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: wallhome1(),
    );
  }
}

class wallhome1 extends StatefulWidget {
  @override
  State<wallhome1> createState() => wallhome2();
}

class wallhome2 extends State<wallhome1> {
//int? index;
  List<Map<String,dynamic>> arrvalue = [
    {'img': 'assets/images/abstract.jpg', 'color': Colors.greenAccent,'name':'Abstract', 'imgs':
    [
      'assets/images/a1.jpg',
      'assets/images/a2.jpg',
      'assets/images/a3.jpg',
      'assets/images/a4.jpg',
      'assets/images/a5.jpg',
      'assets/images/a6.jpg',
      'assets/images/a7.jpg',
      'assets/images/a8.jpg',
    ],
    },
    {'img': 'assets/images/nature.jpg', 'color': Colors.deepOrange,'name':'Nature','imgs':
        [
          'assets/images/n1.jpg',
          'assets/images/n2.jpg',
          'assets/images/n3.jpg',
          'assets/images/n4.jpg',
          'assets/images/n5.jpg',
          'assets/images/n6.jpg',
          'assets/images/n7.jpg',
          'assets/images/n8.jpg',
        ]
    },
    {'img': 'assets/images/classic.jpg', 'color': Colors.yellowAccent,'name':'Classic','imgs':
        [
          'assets/images/c1.jpg',
          'assets/images/c2.jpg',
          'assets/images/c3.jpg',
          'assets/images/c4.jpg',
          'assets/images/c5.jpg',
          'assets/images/c6.jpg',
          'assets/images/c7.jpg',
          'assets/images/c8.jpg',
        ]
    },
    {'img': 'assets/images/animal.jpg','color': Colors.lightGreenAccent,'name':'Animal','imgs':
        [
          'assets/images/an1.jpg',
          'assets/images/an2.jpg',
          'assets/images/an3.jpg',
          'assets/images/an4.jpg',
          'assets/images/an5.jpg',
          'assets/images/an6.jpg',
          'assets/images/an7.jpg',
          'assets/images/an8.jpg',
        ]
    },
    {'img': 'assets/images/car.jpg','color': Colors.blue,'name':'Car'},
    {'img': 'assets/images/bird.jpg','color': Colors.purple,'name':'Birds'},
    {'img': 'assets/images/ballon.jpg','color': Colors.lightGreenAccent,'name':'Balloon'},
    {'img': 'assets/images/icecream.jpg','color': Colors.yellow,'name':'Icecream'},
  ];

  var arrimg=[
  {'imge': 'assets/images/w1.jpg'},
    {'imge': 'assets/images/w2.jpg'},
    {'imge': 'assets/images/w3.jpg'},
    {'imge': 'assets/images/w4.jpg'},
    {'imge': 'assets/images/w5.jpg'},
    {'imge': 'assets/images/w6.jpg'},
    {'imge': 'assets/images/w7.jpg'},
    {'imge': 'assets/images/w8.jpg'},

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text('Find Images'),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Best Of The Month',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 190,
                          child: ListView.builder(
                            itemCount: arrimg.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              height: 300,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          arrimg[index]['imge'].toString()),
                                      fit: BoxFit.fill)),
                              margin: EdgeInsets.only(right: 8, left: 8, top: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                  child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'The color Tone',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: SingleChildScrollView(

                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                            child: ListView.builder(
                              itemCount: arrvalue.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(

                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    color: arrvalue[index]['color'] as Color,

                                  ),
                                ),
                              ),
                            )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 8),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Categories',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 100,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => wallpage2(
                                      arrvalue[index]['name'],
                                      arrvalue[index]['imgs'])));

                            },
                            child: Container(
                              child: Center(
                                child: Text(arrvalue[index]['name'].toString(),
                                  style: TextStyle(
                                  fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),

                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        arrvalue[index]['img'].toString()),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          );
                        },
                        itemCount: arrvalue.length,
                      ),
                    )
                  ],
                ),
              )),

            ],
          ),
        ));
  }
}
