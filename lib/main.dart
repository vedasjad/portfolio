import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

String datetime = DateTime.now().toString();

void playClick() async {
  AudioPlayer player = AudioPlayer();
  String audioasset = "assets/typewriter.wav";
  ByteData bytes = await rootBundle.load(audioasset);
  Uint8List soundbytes =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  int result = await player.playBytes(soundbytes);
  if (result == 1) {}
}

void playRoboClick() async {
  AudioPlayer player = AudioPlayer();
  String audioasset = "assets/inerfaceclick.wav";
  ByteData bytes = await rootBundle.load(audioasset);
  Uint8List soundbytes =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  int result = await player.playBytes(soundbytes);
  if (result == 1) {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const FittedBox(
                    child: Text(
                      'Hey There!',
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                        // fontSize: 50.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(10.0, 10.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(100, 0, 255, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Container(
                  child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: MediaQuery.of(context).size.height * 0.085,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.08,
                        backgroundImage:
                            AssetImage('images/profilepicture.jpg'),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: const FittedBox(
                    child: Text(
                      "I'm Asjad",
                      style: TextStyle(
                        fontFamily: 'GemunuLibre',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: const FittedBox(
                    child: Text(
                      'B.Tech Student\nComputer Science Department\nAjay Kumar Garg Engineering College\nGhaziabad',
                      style: TextStyle(
                        fontFamily: 'GemunuLibre',
                        color: Colors.green,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutMeScreen()));
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MapScreen()));
                      },
                      child: const Icon(
                        Icons.explore,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ConnectScreen()));
                      },
                      child: const Icon(
                        Icons.adb,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.45,
                child: const FittedBox(
                  child: Text(
                    'An App \nDeveloper \nWith A\nGreat Zeal \nTo Learn',
                    style: TextStyle(
                      fontFamily: 'GemunuLibre',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.385,
                child: const FittedBox(
                  child: Text(
                    "Currently I am exploring Mobile App \nDevelopment with the help of Flutter and \nreally enjoying it.\n\nI also have been doing Competitive \nProgramming since last 8 months and also \nknow a thing or two about Web \nDevelopment.\n\nI can for sure say that I can work in a time\n-pressured environment to complete projects \non schedule and within budget.\n",
                    style: TextStyle(
                      fontFamily: 'GemunuLibre',
                      fontStyle: FontStyle.italic,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      playRoboClick();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen()));
                    },
                    child: const Icon(
                      Icons.home,
                      color: Colors.greenAccent,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      playRoboClick();
                    },
                    child: const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.greenAccent,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      playClick();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const MapScreen()));
                    },
                    child: const Icon(
                      Icons.explore,
                      color: Colors.greenAccent,
                      size: 40.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      playRoboClick();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ConnectScreen()));
                    },
                    child: const Icon(
                      Icons.adb,
                      color: Colors.greenAccent,
                      size: 40.0,
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Explore\n',
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.green),
                      )),
                  onPressed: () {
                    playClick();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DomainsScreen()));
                  },
                  child: const Text(
                    'DOMAINS',
                    style: TextStyle(
                      fontFamily: 'GemunuLibre',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35.0,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.green),
                      )),
                  onPressed: () {
                    playClick();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LanguagesScreen()));
                  },
                  child: const Text(
                    'LANGUAGES',
                    style: TextStyle(
                      fontFamily: 'GemunuLibre',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35.0,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.green),
                      )),
                  onPressed: () {
                    playClick();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ShowroomScreen()));
                  },
                  child: const Text(
                    'SHOWROOM',
                    style: TextStyle(
                      fontFamily: 'GemunuLibre',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35.0,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                      child: const Icon(
                        Icons.home,
                        // Icons.home_outlined,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutMeScreen()));
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playClick();
                      },
                      child: const Icon(
                        Icons.explore,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ConnectScreen()));
                      },
                      child: const Icon(
                        Icons.adb,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DomainsScreen extends StatefulWidget {
  const DomainsScreen({Key? key}) : super(key: key);

  @override
  State<DomainsScreen> createState() => _DomainsScreenState();
}

class _DomainsScreenState extends State<DomainsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Domains',
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const Text(
                  '\nMobile App Development',
                  style: TextStyle(
                    fontFamily: 'SilkScreen',
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '\nAlthough my experience with mobile app development haven\'t been much but from whatever time I have spent till now has been great.\n\nAnd I would like to continue my journey in the mentioned field of development.\n\n',
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 20.0,
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Competitive Programming',
                  style: TextStyle(
                    fontFamily: 'SilkScreen',
                    fontWeight: FontWeight.bold,
                    fontSize: 43.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '\nHabit of solving logical problems has been a great time-killer for me since childhood and Competitive Programming allows me to use and enhance those skills of logical thinking for my own benefits.\n\nSo there\'s no question of not doing what I love.',
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 20.0,
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutMeScreen()));
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playClick();
                      },
                      child: const Icon(
                        Icons.explore,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ConnectScreen()));
                      },
                      child: const Icon(
                        Icons.adb,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Languages',
                    style: TextStyle(
                      fontFamily: 'GemunuLibre',
                      fontWeight: FontWeight.bold,
                      fontSize: 70.0,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const Text(
                  '\nC',
                  style: TextStyle(
                    fontFamily: 'BungeeSpice',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "printf(\"Hello World!);",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 15.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  "\nWell-versed with topics like Strings, Dynamic Memory Allocation, Pointers and Linked Lists.\n",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 20.0,
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  'C++',
                  style: TextStyle(
                    fontFamily: 'BungeeSpice',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "cout<<\"Hello World!\";",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 15.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  "\nHave touched topics like OOPs, Trees, Maps, Graphs and Sets.\n",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 20.0,
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  'Dart',
                  style: TextStyle(
                    fontFamily: 'BungeeSpice',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "print(\"Hello World!\");",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 15.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  "\nLearning this language these days as I am working with Flutter.\n",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 20.0,
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  'Python',
                  style: TextStyle(
                    fontFamily: 'BungeeSpice',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "print(Hello World!)",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 15.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  "\nHave knowledge about Lists, Tuples and Numpy.\nAlso tried hands on Pygame.\n",
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontSize: 20.0,
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutMeScreen()));
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MapScreen()));
                      },
                      child: const Icon(
                        Icons.explore,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ConnectScreen()));
                      },
                      child: const Icon(
                        Icons.adb,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowroomScreen extends StatefulWidget {
  const ShowroomScreen({Key? key}) : super(key: key);

  @override
  State<ShowroomScreen> createState() => _ShowroomScreenState();
}

class _ShowroomScreenState extends State<ShowroomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side: const BorderSide(color: Colors.black),
                      )),
                  onPressed: () async {
                    var url = Uri.parse("https://github.com/vedasjad/pygame");
                    await launchUrl(url);
                  },
                  child: const Text(
                    '<Space Battle>',
                    style: TextStyle(
                      fontFamily: 'SilkScreen',
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(100, 0, 255, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset("images/spacebattle.png"),
                Image.asset("images/spacebattle3.png"),
                Image.asset("images/spacebattle2.png"),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                      child: const Icon(
                        Icons.home,
                        // Icons.home_outlined,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutMeScreen()));
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MapScreen()));
                      },
                      child: const Icon(
                        Icons.explore,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ConnectScreen()));
                      },
                      child: const Icon(
                        Icons.adb,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({Key? key}) : super(key: key);

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const <Widget>[],
          ),
        ),
      ),
    );
  }
}

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '\n<--CONNECT WITH ME-->',
                  style: TextStyle(
                    fontFamily: 'SilkScreen',
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(100, 0, 255, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 70.0,
                      width: 70.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(color: Colors.black),
                            )),
                        onPressed: () async {
                          var url = Uri.parse(
                              "https://instagram.com/vedasjad?igshid=YmMyMTA2M2Y=");
                          await launchUrl(url);
                        },
                        child: Image.asset('images/instagram.png'),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                      width: 70.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(color: Colors.black),
                            )),
                        onPressed: () async {
                          var url = Uri.parse("mailto: vedasjad@gmail.com");
                          await launchUrl(url);
                        },
                        child: Image.asset('images/gmail.png'),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                      width: 70.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(color: Colors.black),
                            )),
                        onPressed: () async {
                          var url = Uri.parse("https://github.com/vedasjad");
                          await launchUrl(url);
                        },
                        child: Image.asset('images/github.png'),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                      width: 70.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(color: Colors.black),
                            )),
                        onPressed: () async {
                          var url = Uri.parse(
                              "https://www.linkedin.com/in/ved-asjad-9a2772229");
                          await launchUrl(url);
                        },
                        child: Image.asset('images/linkedin.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 250.0,
                ),
                const Text(
                  'Built From Scratch With 💚 © Copyright 2022,Mohd Asjad All Rights Reserved.',
                  style: TextStyle(
                    fontFamily: 'GemunuLibre',
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutMeScreen()));
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        // Icons.home_outlined,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playClick();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MapScreen()));
                      },
                      child: const Icon(
                        Icons.explore,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        playRoboClick();
                      },
                      child: const Icon(
                        Icons.adb,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
