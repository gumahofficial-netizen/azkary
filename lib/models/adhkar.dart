class AdhkarCategory {
  final int id;
  final String category;
  final List<AdhkarItem> items;

  AdhkarCategory({
    required this.id,
    required this.category,
    required this.items,
  });

  factory AdhkarCategory.fromJson(Map<String, dynamic> json) {
    return AdhkarCategory(
      id: json['id'] is int ? json['id'] : 0,
      category: json['category'] ?? '',
      items: (json['array'] as List? ?? [])
          .map((i) => AdhkarItem.fromJson(i))
          .toList(),
    );
  }
}

class AdhkarItem {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;

  AdhkarItem({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });

  factory AdhkarItem.fromJson(Map<String, dynamic> json) {
    return AdhkarItem(
      id: json['id'] is int ? json['id'] : 0,
      text: json['text'] ?? '',
      count: json['count'] is int ? json['count'] : (int.tryParse(json['count']?.toString() ?? '1') ?? 1),
      audio: json['audio'] ?? '',
      filename: json['filename'] ?? '',
    );
  }
}
