import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {

  List<Book> books = [
    Book(title: 'book 1', author: 'me'),
    Book(title: 'The alchemist', author: 'Paulo Coelho'),
    Book(title: 'Theory of everything', author: 'Stephen Hawkins'),
    Book(title: 'Banner Tale', author: 'unknown'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test2'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      // drawer: MyDrawer(),
      body: ListView(
        children: books.map((e) =>CustomWidget(e: e, delete: (){
          setState(() {
            books.remove(e);
          });
        })
        ).toList(),
      ),
    );
  }
}

Widget myWidget(e){
  return CustomWidget(e: e);
}

class CustomWidget extends StatelessWidget {
  final Book e;
  final Function delete;
  CustomWidget({this.e, this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.fromLTRB(5, 2, 5, 0),
              padding: EdgeInsets.all(10),
              child: Card(
              elevation: 8,
              child: Container(
                  padding: EdgeInsets.only(top:15, left: 15, right: 15),
                  child: Column(
                  children: [
                   Align(
                      child: Text('${e.title}'),
                      alignment: Alignment.centerLeft,
                   ),
                   SizedBox(height: 8),
                   Align(
                     alignment: Alignment.bottomLeft,
                     child: Text('--- ${e.author}')
                  ),
                  // SizedBox(height: 10),
                  Align(alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.delete_forever), onPressed:delete
                    )
                  )
                ],),
              ),
            ),
          );
  }
}


class Book {
  String title;
  String author;
    Book({this.title, this.author});
}
