import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:lottie/lottie.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class FirstPage extends StatefulWidget {
  final PageController pageController;
  const FirstPage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  bool isSayHello = false;
  bool isNameClick = false;
  bool isCounterStart = false;
  final String _text =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.';
  int count = 0;
  late AnimationController animationController;
  late Animation alignAnimation;
  bool textOnTap = true;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    alignAnimation =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter).animate(animationController);

    super.initState();
  }

  void sayHello() {
    setState(() {
      isSayHello = !isSayHello;
      isCounterStart = true;
      if (isCounterStart) return startCount();
    });
  }

  void startCount() {
    count++;
  }

  void nameClik() {
    setState(() {
      isNameClick = !isNameClick;
    });
  }

  bool isPressed = false;

  Offset mousePos = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    Offset distance = const Offset(10, 10);
    double blur = isPressed ? 10 : 5;
    return Container(
      color: const Color(0xffc2f970),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: AnimatedContainer(
                    height: 300,
                    width: 300,
                    curve: Curves.easeInQuint,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffc2f970),
                      boxShadow: [
                        BoxShadow(
                          offset: -distance,
                          blurRadius: blur,
                          color: const Color.fromARGB(255, 219, 254, 166),
                          inset: isPressed,
                        ),
                        BoxShadow(
                          offset: distance,
                          blurRadius: blur,
                          color: Colors.green.shade900,
                          inset: isPressed,
                        ),
                      ],
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            textOnTap = !textOnTap;
                          });
                        },
                        child: AnimatedCrossFade(
                          firstChild: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "FLUTTER",
                              style: TextStyle(fontSize: 80),
                            ),
                          ),
                          secondChild: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              _text,
                              style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          crossFadeState: textOnTap ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: const Duration(seconds: 2),
                          firstCurve: Curves.bounceInOut,
                          secondCurve: Curves.easeInOut,
                          sizeCurve: Curves.elasticInOut,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Lottie.asset("assets/resim.json"),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                child: AnimatedContainer(
                  height: 300,
                  width: 300,
                  curve: Curves.easeInQuint,
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffc2f970),
                    boxShadow: [
                      BoxShadow(
                        offset: -distance,
                        blurRadius: blur,
                        color: const Color.fromARGB(255, 219, 254, 166),
                        inset: isPressed,
                      ),
                      BoxShadow(
                        offset: distance,
                        blurRadius: blur,
                        color: Colors.green.shade900,
                        inset: isPressed,
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          textOnTap = !textOnTap;
                        });
                      },
                      child: AnimatedCrossFade(
                        firstChild: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "DEVELOPER",
                            style: TextStyle(fontSize: 80),
                            maxLines: 1,
                          ),
                        ),
                        secondChild: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            _text,
                            style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        crossFadeState: textOnTap ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: const Duration(seconds: 2),
                        firstCurve: Curves.bounceInOut,
                        secondCurve: Curves.easeInOut,
                        sizeCurve: Curves.elasticInOut,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimeAlign extends StatefulWidget {
  const AnimeAlign({
    Key? key,
    required this.alignAnimation,
  }) : super(key: key);

  final Animation alignAnimation;

  @override
  State<AnimeAlign> createState() => _AnimeAlignState();
}

class _AnimeAlignState extends State<AnimeAlign> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 100,
      top: 500,
      child: Container(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Hi! I'm Tunahan,\nPeoples call me Tuna"),
          ],
        ),
      ),
    );
  }
}

class HandShake extends StatelessWidget {
  /*
   final Animation<double> offsetAnimation =
        Tween(begin: 0.0, end: 24.0).chain(CurveTween(curve: Curves.elasticIn)).animate(animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            }
          });
  */
  const HandShake({
    Key? key,
    required this.animationController,
    required this.offsetAnimation,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation<double> offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: InkWell(
        onTap: () {
          animationController.forward(from: 0.0);
        },
        child: AnimatedBuilder(
          animation: offsetAnimation,
          builder: ((context, child) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                padding: EdgeInsets.only(left: offsetAnimation.value + 24.0, right: 24.0 - offsetAnimation.value),
                child: Lottie.asset("assets/lottie/hand6.json"));
          }),
        ),
      ),
    );
  }
}
