import 'package:flutter/material.dart';
import '../services/stories_service.dart';
import '../models/story.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Story> stories = StoriesService.getStories();

    return Scaffold(
      appBar: AppBar(title: const Text('القصص الإسلامية')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(story.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(story.content, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                _showStoryDetails(context, story);
              },
            ),
          );
        },
      ),
    );
  }

  void _showStoryDetails(BuildContext context, Story story) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(story.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(story.content, style: const TextStyle(fontSize: 18, height: 1.6)),
              ],
            ),
          ),
        );
      },
    );
  }
}
