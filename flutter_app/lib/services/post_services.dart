import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/post_model.dart';
import 'dart:io';

String url = 'http://139.59.97.153:8080/restaurants';
//139.59.97.153
Future<List<Post>> getAllPosts() async {
  final response = await http.get(url);

  return allPostsFromJson(response.body);
}

Future<Post> getPost() async{
  final response = await http.get('$url'+'/1');

  return postFromJson(response.body);

}
Future<http.Response> createPost(Post post) async{

//  Map data ={'Name':'Kebab'};
//Map data = {"Name":"Flutter jam6","Description":"Testing body body body","OpeningDate":"2019-01-01","PhotoProfile":"1"};
print ("sini");
  print(postToJson(post));
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: json.encode(post)

  );
  return response;
}
/*

Future<Post> createPost(Post post) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: postToJson(post)
  );

  return postFromJson(response.body);
}
*/
