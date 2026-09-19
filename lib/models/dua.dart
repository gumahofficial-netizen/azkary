class Dua {
  final String id;
  final String title;
  final String text;
  final String category;
  final String? reference;

  Dua({
    required this.id,
    required this.title,
    required this.text,
    required this.category,
    this.reference,
  });

  factory Dua.fromJson(Map<String, dynamic> json) {
    return Dua(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      category: json['category'] ?? '',
      reference: json['reference'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'text': text,
    'category': category,
    'reference': reference,
  };
}
