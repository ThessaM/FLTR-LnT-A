import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    ImageStylingPage(),
    VideoStylingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Video",
          ),
        ],
      ),
    );
  }
}

//HOME PAGE --------------------------------------------------------------------------------------

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            
          ],
        ),
      ),
    );
  }
}

//IMAGE PAGE --------------------------------------------------------------------------------------
class ImageStylingPage extends StatefulWidget {
  const ImageStylingPage({super.key});

  @override
  State<ImageStylingPage> createState() => _ImageStylingPageState();
}

class _ImageStylingPageState extends State<ImageStylingPage> {
  String selectedStyle = "Circle";

  final styles = ["Circle", "Color Filter", "Rounded", "Border", "Shadow"];

  Widget buildStyledImage(String style) {
    const path = 'assets/image/image.jpg';

    switch (style) {
      case "Circle":
        return Container();

      case "Color Filter":
        return Container();

      case "Rounded":
        return Container();

      case "Border":
        return Container();

      case "Shadow":
        return Container();

      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Styling")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildStyledImage(selectedStyle),
            SizedBox(height: 20),
            DropdownButton(
              value: selectedStyle,
              items: styles
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedStyle = value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//VIDEO PAGE --------------------------------------------------------------------------------------
class VideoStylingPage extends StatefulWidget {
  const VideoStylingPage({super.key});

  @override
  State<VideoStylingPage> createState() => _VideoStylingPageState();
}

class _VideoStylingPageState extends State<VideoStylingPage> {
  // late VideoPlayerController controller;
  String selectedStyle = "Circle";

  final styles = ["Circle", "Color Filter", "Rounded", "Border", "Shadow"];

  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.asset('assets/videos/video.mp4')
    //   ..initialize().then((_) {
    //     setState(() {});
    //     controller.setLooping(true);
    //     controller.play();
    //   });
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  Widget buildStyledVideo(String style) {
    // if (!controller.value.isInitialized) {
    //   return CircularProgressIndicator();
    // }

    var video = SizedBox(
      width: 120,
      height: 120,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 150,
          width: 150,
          // child: VideoPlayer(controller),
        ),
      ),
    );

    switch (style) {
      case "Circle":
        return Container();

      case "Color Filter":
        return Container();

      case "Rounded":
        return Container();

      case "Border":
        return Container();

      case "Shadow":
        return Container();

      default:
        return video;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Styling")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildStyledVideo(selectedStyle),
            SizedBox(height: 20),
            DropdownButton(
              value: selectedStyle,
              items: styles
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedStyle = value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
