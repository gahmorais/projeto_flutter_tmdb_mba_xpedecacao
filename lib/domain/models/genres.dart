class Genre {
  int id;
  String name;

  Genre.fromJson(Map json)
      : id = json["id"],
        name = json["name"];
}
