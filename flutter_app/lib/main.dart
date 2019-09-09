import 'package:flutter/material.dart';


import 'services/post_services.dart';
import 'model/post_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  callAPI(){
    Post post = Post(
        description: 'Testing body body body',
        Name: "Flutter jam6",
        openingDate: "2019-01-01",
      photoProfile: "1",

    );
    print(post.Name);
    createPost(post).then((response){
      if(response.statusCode > 200)
        print(response.body + "berhasil");

      else
        print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body : FutureBuilder<Post>(
            future: getPost(),
            builder: (context, snapshot) {
             callAPI();
              if(snapshot.connectionState == ConnectionState.done) {

                if(snapshot.hasError){
                  return Text("Error");
                }
                return Text('Title from Posdst JSON : ${snapshot.data.Name}');

              }
              else
                return CircularProgressIndicator();
            }
        )
    );
  }

}

