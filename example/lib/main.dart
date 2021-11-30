import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/astro.dart';
import 'package:example/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:planet_widget/widgets/planet_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var firstCircleImagesUrl = [
    'http://clipart-library.com/images_k/transparent-globe/transparent-globe-6.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b2712.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b2707.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b2708.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b2709.png',
  ];

  var secondCircleImagesUrl = [
    'https://assets.stickpng.com/images/580b585b2edbce24c47b2703.png',
    'http://assets.stickpng.com/images/5a00de3d0e8525eec2752ffe.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b270a.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b270d.png',
    'http://assets.stickpng.com/thumbs/5a00de530e8525eec2752fff.png',
  ];

  var thirdCircleImagesUrl = [
    'http://clipart-library.com/images_k/sun-transparent-background/sun-transparent-background-15.png',
    'http://clipart-library.com/newhp/Uranus_PNG_Clip_Art-3007.png',
    'http://assets.stickpng.com/thumbs/5f4e7876481e190004044f88.png',
    'https://www.freepnglogos.com/uploads/mars-png/mars-spacepedia-solar-system-scope-28.png',
    'https://assets.stickpng.com/images/580b585b2edbce24c47b2704.png',
  ];

  late PlanetWidget _planetWidget;

  @override
  void initState() {
    _planetWidget = getPlanetWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                GALAXY_IMAGE,
              ),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: _planetWidget,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    onTap: () {
                      _planetWidget.startCircleAnimation();
                    },
                  ),
                  InkWell(
                    child: const Text(
                      'Stop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    onTap: () {
                      _planetWidget.stopCircleAnimation();
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Astro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Astro()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  PlanetWidget getPlanetWidget(){
    return PlanetWidget(
      allCircleStrokeWidth: 0.5,
      allCircleStrokeColor: Colors.white,
      startAnimation: true,
      repeatAnimation: true,
      firstCircleAnimationDuration: 5000,
      secondCircleAnimationDuration: 5000,
      thirdCircleAnimationDuration: 5000,
      centerWidget: CircleAvatar(
        radius: 25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.asset(
            PROFILE_IMAGE,
          ),
        ),
      ),
      firstCircleWidgets: List.generate(
        5,
            (index) => Column(
          children: [
            CachedNetworkImage(
              width: 36,
              height: 40,
              imageUrl: firstCircleImagesUrl[index],
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
          ],
        ),
      ),
      secondCircleWidgets: List.generate(
        5,
            (index) => Column(
          children: [
            CachedNetworkImage(
              width: 36,
              height: 40,
              imageUrl: secondCircleImagesUrl[index],
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
          ],
        ),
      ),
      thirdCircleWidgets: List.generate(
        5,
            (index) => Column(
          children: [
            CachedNetworkImage(
              width: 36,
              height: 40,
              imageUrl: thirdCircleImagesUrl[index],
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
          ],
        ),
      ),
      curve: Curves.ease,
    );
  }

}