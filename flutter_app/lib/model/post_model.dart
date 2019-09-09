// Created using https://app.quicktype.io/


// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);



import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {

  final dyn = data.toJson();
  print(json.encode(dyn));

  return json.encode(data);
}


List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String allPostsToJson(List<Post> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Post {
  int id;
  String Name;
  String description;
  String openingDate;
  String photoProfile;

  Post({
    this.Name,
    this.description,
    this.openingDate,
    this.photoProfile
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(

    Name: json["Name"],
    description: json["Description"],
    openingDate: json["OpeningDate"],
    photoProfile: json["PhotoProfile"]
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": Name,
    "Description": description,
    "OpeningDate": openingDate,
    "PhotoProfile": photoProfile
  };
}
