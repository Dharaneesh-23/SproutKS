import 'dart:async';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:cached_video_player/cached_video_player.dart';

class TutorialPage extends StatefulWidget {
  final bool completionStatus;
  const TutorialPage({super.key, required this.completionStatus});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late CachedVideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  bool _isVideoInitialized = false;
  Timer? _timer;
  Duration _playedDuration = Duration.zero;
  bool _hasReached80Percent = false;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer('https://cdn.pixabay.com/video/2015/08/10/209-135852365_large.mp4');
  }

  void initializeVideoPlayer(String videoUrl) async {
    if (_isVideoInitialized) {
      _videoPlayerController.dispose();
    }

    _videoPlayerController = CachedVideoPlayerController.network(videoUrl)

        _videoPlayerController.addListener(() {
          if (_videoPlayerController.value.isPlaying) {
            _startTimer();
          } else {
            _stopTimer();
          }

          if (_getPlayedPercentage() >= 0.8 && !_hasReached80Percent) {
            _hasReached80Percent = true;
            print("User has watched 80% of the video");
            // _videoPlayerController.pause();
          }
        });
      });

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
    );
  }


  void _stopTimer() {
    _timer?.cancel();
  }

  double _getPlayedPercentage() {
    final totalDuration = _videoPlayerController.value.duration;
    if (totalDuration.inSeconds == 0) return 0;
    return _playedDuration.inSeconds / totalDuration.inSeconds;
  }

  @override
  void dispose() {
    _stopTimer();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(data['courseTitle']),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            if (_isVideoInitialized)
              Expanded(
                flex: 4,
                child: CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
              )
            else
              const Center(child: CircularProgressIndicator()),
            const TabBar(
              indicatorColor: Colors.orangeAccent,
              labelColor: Colors.orangeAccent,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Lessons'),
                Tab(text: 'AI Assistant'),
              ],
            ),
            Expanded(
              flex: 7,
              child: TabBarView(
                children: [
                  OverviewTab(),
                  LessonsTab(onLessonSelected: (videoUrl) {
                    setState(() {
                      initializeVideoPlayer(videoUrl);
                    });
                  },CompletionStatus: widget.completionStatus,courseName: data['courseTitle'],),
                  AIAssistantTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spoken English',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.orangeAccent),
              Icon(Icons.star, color: Colors.orangeAccent),
              Icon(Icons.star, color: Colors.orangeAccent),
              Icon(Icons.star, color: Colors.orangeAccent),
              Icon(Icons.star_border, color: Colors.orangeAccent),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: const [
              Icon(Icons.play_circle_fill, color: Colors.blue),
              SizedBox(width: 8.0),
              Text('80+ Lectures'),
              SizedBox(width: 16.0),
              Icon(Icons.thumb_up, color: Colors.blue),
              SizedBox(width: 8.0),
              Text('Confidence'),
              SizedBox(width: 16.0),
              Icon(Icons.discount, color: Colors.blue),
              SizedBox(width: 8.0),
              Text('10% Off'),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Skills',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            children: const [
              Chip(label: Text('Adobe')),
              Chip(label: Text('Adobe Photoshop')),
              Chip(label: Text('Logo')),
              Chip(label: Text('Designing')),
              Chip(label: Text('Poster Design')),
              Chip(label: Text('Figma')),
            ],
          ),
        ],
      ),
    );
  }
}

class LessonsTab extends StatefulWidget {
  final Function(String) onLessonSelected;
  final bool CompletionStatus;
  final String courseName;
  LessonsTab({required this.onLessonSelected, required this.CompletionStatus, required this.courseName});

  @override
  _LessonsTabState createState() => _LessonsTabState();
}

class _LessonsTabState extends State<LessonsTab> {
  // Track which lessons are enabled
  List<bool> _lessonEnabled = [true, false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ChapterTile(
          chapterTitle: 'Chapter 1: Greetings and Introductions',
          lessons: [
            Lesson(title: 'Lesson 1: Basic Greetings', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
            Lesson(title: 'Lesson 2: Introductions', videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
            Lesson(title: 'Lesson 3: Formal Greetings', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'),
          ],
          onLessonSelected: widget.onLessonSelected,
          lessonEnabled: _lessonEnabled,
          onLessonWatched: _enableNextLesson,
          chapterIndex: 0,
        ),
        ChapterTile(
          chapterTitle: 'Chapter 2: Everyday Conversations',
          lessons: [
            Lesson(title: 'Lesson 1: Shopping Conversations', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
            Lesson(title: 'Lesson 2: Asking for Directions', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4'),
            Lesson(title: 'Lesson 3: Ordering Food', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4'),
          ],
          onLessonSelected: widget.onLessonSelected,
          lessonEnabled: _lessonEnabled,
          onLessonWatched: _enableNextLesson,
          chapterIndex: 1,
        ),
        ChapterTile(
          chapterTitle: 'Chapter 3: Asking Questions',
          lessons: [
            Lesson(title: 'Lesson 1: Open-ended Questions', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4'),
            Lesson(title: 'Lesson 2: Closed Questions', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4'),
            Lesson(title: 'Lesson 3: Follow-up Questions', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4'),
          ],
          onLessonSelected: widget.onLessonSelected,
          lessonEnabled: _lessonEnabled,
          onLessonWatched: _enableNextLesson,
          chapterIndex: 2,
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: widget.CompletionStatus ? () {
            Navigator.pushNamed(context, '/certificate',arguments: {
              "userName": "Jack",
              "courseName": widget.courseName,
          });}: null,
          child: const Text('GENERATE CERTIFICATE'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
      ],
    );
  }

  void _enableNextLesson(int chapterIndex, int lessonIndex) {
    setState(() {
      // Enable the next lesson within the same chapter
      if (lessonIndex < 2) {  // Assuming 3 lessons per chapter
        _lessonEnabled[chapterIndex * 3 + lessonIndex + 1] = true;
      }
    });
  }
}

class ChapterTile extends StatelessWidget {
  final String chapterTitle;
  final List<Lesson> lessons;
  final Function(String) onLessonSelected;
  final List<bool> lessonEnabled;
  final Function(int chapterIndex, int lessonIndex) onLessonWatched;
  final int chapterIndex;

  ChapterTile({
    required this.chapterTitle,
    required this.lessons,
    required this.onLessonSelected,
    required this.lessonEnabled,
    required this.onLessonWatched,
    required this.chapterIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(chapterTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: lessons.asMap().entries.map((entry) {
        int lessonIndex = entry.key;
        Lesson lesson = entry.value;
        return ListTile(
          title: Text(lesson.title),
          onTap: lessonEnabled[chapterIndex * 3 + lessonIndex]
              ? () {
            onLessonSelected(lesson.videoUrl);
            // When the first lesson is watched 80%, the next lesson will be enabled
            onLessonWatched(chapterIndex, lessonIndex);
          }
              : null,
          enabled: lessonEnabled[chapterIndex * 3 + lessonIndex],
        );
      }).toList(),
    );
  }
}

class Lesson {
  final String title;
  final String videoUrl;

  Lesson({required this.title, required this.videoUrl});
}

class AIAssistantTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('AI Assistant Content Here'),
    );
  }
}
