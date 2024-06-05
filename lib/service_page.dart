import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ServicePage extends StatefulWidget {
  static const servicePage = 'Service Page';

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late YoutubePlayerController _controller;
  final String? videoId = YoutubePlayer.convertUrlToId("https://youtu.be/nussKt3CTzY");

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_controller.value.playerState == PlayerState.ended) {
      // Video has ended, you can handle it here
      setState(() {
        _controller.play();
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Business Entity',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            StepCard(
              stepNo: 'Step 1',
              title: 'Do You Have A Business Entity?',
              content:
              'It’s important that you have a strong business foundation and it all starts with filing your business entity with your Secretary of State. Each state has a different filing and fee structure. Like a birth certificate is to an individual, a business entity is the birth of a business.',
              imagePath: 'images/step1.webp',
            ),
            StepCard(
              stepNo: 'Step 2',
              title: 'FILE A BUSINESS ENTITY',
              content:
              'It’s important that you have a strong business foundation and it all starts with filing your business entity with your Secretary of State. Each state has a different filing and fee structure. Like a birth certificate is to an individual, a business entity is the birth of a business.',
              imagePath: 'images/step2.webp',
            ),
            StepCard(
              stepNo: 'Step 3',
              title:
              'ON YOUR BUSINESS ENTITY DOCUMENTS, ARE THE BUSINESS ADDRESS & OWNERSHIP CORRECT?',
              content:
              'Your business name, address, contact information, and ownership should be 100% correct. Lenders and others will pull these records to verify the business information. Please don\'t move forward until all information listed on your entity filing is correct. It’s important that you have a strong business foundation and it all starts with filing your business entity with your Secretary of State. Each state has a different filing and fee structure. Like a birth certificate is to an individual, a business entity is the birth of a business.',
              imagePath: 'images/step3.jpeg',
            )
          ],
        ),
      ),
    );
  }
}
class StepCard extends StatelessWidget {
  String? imagePath;
  String? stepNo;
  String? title;
  String? content;
  StepCard(
      {super.key,
      required this.title,
      required this.stepNo,
      required this.imagePath,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath!),
          ),
          Text(stepNo!),
          Text(title!),
          Text(content!),
        ],
      ),
    );
  }
}
