import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
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
  late VideoPlayerController videoAssetController;
  late VideoPlayerController videoNetworkController;

  @override
  void initState() {
    super.initState();
    videoAssetController =
        VideoPlayerController.asset("assets/videos/video.mp4")
          ..initialize().then((_) {
            setState(() {});
          });
    videoNetworkController =
        VideoPlayerController.networkUrl(
            Uri.parse(
              "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            ),
          )
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    videoAssetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(
              "assets/images/image.jpg",
              width: 100,
              height: 100,
              fit: .cover,
            ),
            SizedBox(height: 20),
            Image.network(
              "https://www.vulcantermite.com/wp-content/uploads/2024/01/butterflyvmoth.jpg",
              width: 100,
              height: 100,
              fit: .cover,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                videoAssetController.play();
              },
              child: Container(
                height: 100,
                width: 100,
                child: VideoPlayer(videoAssetController),
              ),
            ),

            SizedBox(height: 20),

            videoNetworkController.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      videoNetworkController.value.isPlaying
                          ? videoNetworkController.pause()
                          : videoNetworkController.play();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: VideoPlayer(videoNetworkController),
                    ),
                  )
                : CircularProgressIndicator(),
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
    const path = 'assets/images/image.jpg';

    switch (style) {
      case "Circle":
        return ClipOval(
          child: Image.asset(path, width: 150, height: 150, fit: .cover),
        );

      case "Color Filter":
        return ClipRect(
          child: ColorFiltered(
            colorFilter: .mode(Colors.black, .color),
            child: Image.asset(path, width: 150, height: 150, fit: .cover),
          ),
        );

      case "Rounded":
        return ClipRRect(
          borderRadius: .circular(16),
          child: Image.asset(path, width: 150, height: 150, fit: .cover),
        );

      case "Border":
        return Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: .all(color: Colors.purple, width: 5),
            image: DecorationImage(
              image: AssetImage(path),
              fit: .cover,
              colorFilter: .mode(Colors.amber, .color),
            ),
          ),
        );

      case "Shadow":
        return Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.deepOrange,
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ],
            image: DecorationImage(image: AssetImage(path), fit: .cover),
          ),
        );

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
  late VideoPlayerController controller;
  String selectedStyle = "Circle";

  final styles = ["Circle", "Color Filter", "Rounded", "Border", "Shadow"];

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videos/video.mp4')
      ..initialize().then((_) {
        setState(() {});
        controller.setLooping(true);
        controller.play();
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildStyledVideo(String style) {
    if (!controller.value.isInitialized) {
      return CircularProgressIndicator();
    }

    var video = SizedBox(
      width: 120,
      height: 120,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 150,
          width: 150,
          child: VideoPlayer(controller),
        ),
      ),
    );

    switch (style) {
      case "Circle":
        return Container(
          width: 150,
          height: 150,
          child: ClipOval(child: VideoPlayer(controller)),
        );

      case "Color Filter":
        return Container(
          height: 150,
          width: 150,
          child: ClipRect(
            child: ColorFiltered(
              colorFilter: .mode(Colors.tealAccent, .darken),
              child: VideoPlayer(controller),
            ),
          ),
        );

      case "Rounded":
        return Container(
          height: 150,
          width: 150,
          child: ClipRRect(
            borderRadius: .circular(16),
            child: VideoPlayer(controller),
          ),
        );

      case "Border":
        return Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: .all(color: Colors.lime, width: 5)
          ),
          child: VideoPlayer(controller),
        );

      case "Shadow":
        return Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.red, blurRadius: 10, spreadRadius: 5)]
          ),
          child: VideoPlayer(controller),
        );

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
