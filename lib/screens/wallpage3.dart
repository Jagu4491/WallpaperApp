import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class wallpage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400 ,
        title: Text(
          'Wallpage3',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage('assets/images/a1.jpg'), fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
              left: 60,
              bottom: 70,
              width: 70,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/images/info3.png'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Positioned(
              left: 170,
              bottom: 70,
              width: 70,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage('assets/images/save.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              right: 70,
              bottom: 70,
              width: 70,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage('assets/images/apply.png'))),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Info',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
