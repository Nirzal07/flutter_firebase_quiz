import 'package:flutter/material.dart';
import 'package:myapp/services/firestore.dart';
import 'package:myapp/shared/bottom_nav.dart';
import 'package:myapp/shared/loading.dart';
import 'package:myapp/shared/error.dart';
import 'package:myapp/services/models.dart';
import 'package:myapp/topics/drawer.dart';
import 'package:myapp/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Missing <List<Topic>> had a serius bug figure out why
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(
                message: snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              appBar: AppBar(),
              drawer: TopicDrawer(
                topics: topics,
              ),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: topics
                    .map((topic) => TopicItem(
                          topic: topic,
                        ))
                    .toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Text('No topics found in Firestore. Check Database.');
          }
        });
  }
}
