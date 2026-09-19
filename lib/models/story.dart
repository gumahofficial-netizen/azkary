class Story {
  final String id;
  final String title;
  final String content;
  final String category; // 'prophets', 'quran', 'companions'
  final String? image;

  Story({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    this.image,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      category: json['category'] ?? 'prophets',
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'category': category,
    'image': image,
  };
}
