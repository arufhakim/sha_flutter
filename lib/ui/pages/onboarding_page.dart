import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];

  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 83,
              ),
              CarouselSlider(
                items: [
                  Image.asset(
                    'assets/img_onboarding1.png',
                    height: 331,
                  ),
                  Image.asset(
                    'assets/img_onboarding2.png',
                    height: 331,
                  ),
                  Image.asset(
                    'assets/img_onboarding3.png',
                    height: 331,
                  ),
                ],
                options: CarouselOptions(
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 24,
                  left: 24,
                  bottom: 24,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      titles[currentIndex],
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      subtitles[currentIndex],
                      textAlign: TextAlign.center,
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: currentIndex == 2 ? 38 : 50,
                    ),
                    currentIndex == 2
                        ? Column(
                            children: [
                              CustomFilledButton(
                                title: 'Get Started',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sign-up');
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextButton(
                                title: 'Sign In',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sign-in');
                                },
                              )
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: currentIndex == 0
                                      ? blueColor
                                      : lightBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: currentIndex == 1
                                      ? blueColor
                                      : lightBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: currentIndex == 2
                                      ? blueColor
                                      : lightBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Spacer(),
                              CustomFilledButton(
                                title: 'Continue',
                                width: 150,
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
