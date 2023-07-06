import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/wallpage3.dart';

class wallpage2 extends StatelessWidget {
  var name;
  var imgs;


  wallpage2(this.name,this.imgs);

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(name,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white
        ),),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body:
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 300),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        if(index==0){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>wallpage3())
                        );
                        }
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(imgs[index].toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Text(arrvalue[index]['name'].toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
                          ],
                        ),
                      ),
                    );

                  },
                  itemCount: 8,
                ),

              ),
            ),

          ],
        ),



    );
  }
}
