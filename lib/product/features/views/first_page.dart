import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:kartal/kartal.dart';
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
  int count = 0;
  late AnimationController animationController;
  late Animation alignAnimation;
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
                    child: isPressed
                        ? Center(
                            child: AnimatedCrossFade(
                              duration: const Duration(seconds: 1),
                              crossFadeState: CrossFadeState.showFirst,
                              firstChild: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "I'm Tunahan, you can call me Tuna",
                                      style: context.textTheme.headline1
                                          ?.copyWith(fontSize: 75, color: Colors.green.shade900.withOpacity(0.1)),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "DEVELOPER",
                                      style: context.textTheme.bodyText2?.copyWith(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                              secondChild: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "FLUTTER",
                                      style: context.textTheme.headline1
                                          ?.copyWith(fontSize: 75, color: Colors.green.shade900.withOpacity(0.1)),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "I'm Tunahan, you can call me Tuna",
                                      style: context.textTheme.bodyText2?.copyWith(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: AnimatedCrossFade(
                              duration: const Duration(seconds: 1),
                              crossFadeState: CrossFadeState.showSecond,
                              firstChild: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "I'm Tunahan, you can call me Tuna",
                                      style: context.textTheme.headline1
                                          ?.copyWith(fontSize: 75, color: Colors.green.shade900.withOpacity(0.1)),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "DEVELOPER",
                                      style: context.textTheme.bodyText2?.copyWith(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                              secondChild: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "FLUTTER",
                                      style: context.textTheme.headline1
                                          ?.copyWith(fontSize: 75, color: Colors.green.shade900.withOpacity(0.1)),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "I'm Tunahan, you can call me Tuna",
                                      style: context.textTheme.bodyText2?.copyWith(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
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
                    child: isPressed
                        ? Stack(
                            children: [
                              Center(
                                child: AnimatedScale(
                                  duration: const Duration(seconds: 3),
                                  scale: 0.5,
                                  curve: Curves.bounceInOut,
                                  child: Text(
                                    "I'm Tunahan, you can call me Tuna",
                                    style: context.textTheme.headline1
                                        ?.copyWith(fontSize: 75, color: Colors.green.shade900.withOpacity(0.1)),
                                  ),
                                ),
                              ),
                              Center(
                                child: AnimatedScale(
                                  duration: const Duration(seconds: 3),
                                  scale: 3,
                                  curve: Curves.bounceInOut,
                                  child: Text(
                                    "DEVELOPER",
                                    style: context.textTheme.bodyText2?.copyWith(fontSize: 30),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Center(
                                child: Text(
                                  "DEVELOPER",
                                  style: context.textTheme.headline1
                                      ?.copyWith(fontSize: 75, color: Colors.green.shade900.withOpacity(0.1)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "I'm Tunahan, you can call me Tuna",
                                  style: context.textTheme.bodyText2?.copyWith(fontSize: 30),
                                ),
                              ),
                            ],
                          )),
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
