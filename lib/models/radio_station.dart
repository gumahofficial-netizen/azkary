class RadioStation {
  final String name;
  final String url;
  final String category;

  RadioStation({
    required this.name,
    required this.url,
    required this.category,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
    'category': category,
  };
}
