class SpillOverModel {
  int id;
  String content;
  String image;
  String title;

  SpillOverModel({
    this.id,
    this.title,
    this.image,
    this.content,
  });

  static SpillOverModel fromJson(Map<String, dynamic> json) {
    return SpillOverModel(
      id: json['id'],
      content: json['content'],
      image: json['image'],
      title: json['title'],
    );
  }
}
