import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ues',
        style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
      ),
      body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image:  DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1540206395-68808572332f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2081&q=80"), fit: BoxFit.cover,),
                  ),
                ),
                Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tae',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),

                    ),
                    Text(count.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'kaushan',
                      color: Colors.white
                    ),)
                  ],
                )
              ),
              ]
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.plus_one),
        onPressed:(){
          setState(() {
            count+=1;
          });
        },
        backgroundColor: Colors.red
      ),
    );
  }
}
