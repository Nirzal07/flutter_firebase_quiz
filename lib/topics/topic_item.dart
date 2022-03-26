import 'package:flutter/material.dart';
import 'package:myapp/services/firestore.dart';
import 'package:myapp/shared/bottom_nav.dart';
import 'package:myapp/shared/loading.dart';
import 'package:myapp/shared/error.dart';
import 'package:myapp/services/models.dart';
import 'package:myapp/shared/progress_bar.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: topic.img,
        child: Card(
          // clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => TopicDetail(topic: topic),
                ),
              );
            },
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 3,
                    child: SizedBox(
                      child: Image.asset(
                        'assets/covers/${topic.img}',
                        // fit: BoxFit.cover,
                      ),
                    )),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      topic.title,
                      style: const TextStyle(
                          height: 1.5, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
                Flexible(
                    child: TopicProgress(
                  topic: topic,
                ))
              ],
            ),
          ),
        ));
  }
}

class TopicDetail extends StatelessWidget {
  final Topic topic;
  const TopicDetail({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Hero(
            tag: topic.img,
            child: Image.asset(
              'assets/covers/${topic.img}',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Text(
            topic.title,
            style: const TextStyle(
              height: 2,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
