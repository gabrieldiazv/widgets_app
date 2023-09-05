import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Amet consequat Lorem in tempor velit reprehenderit reprehenderit.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Commodo culpa pariatur irure aute sint ut laboris.',
      'assets/images/2.png'),
  SlideInfo(
      'disfruta la comida',
      'Nisi mollit culpa incididunt consequat deserunt laboris.',
      'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  
  late final PageController pageviewController = PageController();
  bool endReached = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageviewController.addListener(() { 
      final page = pageviewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  // limpia los listener y evita que se ocupe mas memoria y recursos
  @override
  void dispose() {
    pageviewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageviewController ,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList(),
            ),
            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )
            ),
            endReached ? Positioned(
              bottom: 20,
              right: 30,
              child:FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton( 
                  onPressed: ()=>context.pop(), 
                  child: const Text('comenzar')
                ),
              )
            ): const SizedBox()
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 10),
              Text(caption, style: captionStyle),
            ]));
  }
}
