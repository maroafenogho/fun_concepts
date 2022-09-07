import 'package:bootcamp101/app/modules/auth/views/login_screen.dart';
import 'package:bootcamp101/app/modules/auth/views/sign_up.dart';
import 'package:bootcamp101/app/modules/onboarding/notifiers/onboarding_notifier.dart';
import 'package:bootcamp101/app/modules/onboarding/views/widgets/screen_2.dart';
import 'package:bootcamp101/app/modules/onboarding/views/widgets/screen_one.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                itemCount: ref.watch(widgetsProvider).length,
                itemBuilder: (context, index, realIndex) {
                  return SizedBox(
                    // height: 95.sp,
                    child: ref.watch(
                        widgetsProvider)[ref.watch(indexProvider.state).state],
                  );
                },
                options: CarouselOptions(
                    disableCenter: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      ref.read(indexProvider.state).state = index;
                      // controller.currentInvestmentIndex.value = index;
                    }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.4),
                child: ListView.builder(
                  itemCount: ref.watch(widgetsProvider).length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerRight,
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: index == ref.watch(indexProvider.state).state
                          ? MediaQuery.of(context).size.width * 0.08
                          : MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          color: index == ref.watch(indexProvider.state).state
                              ? Colors.black.withAlpha(120)
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.black.withAlpha(120),
                          )),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return RegisterScreen();
                    })));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withAlpha(150),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return LoginScreen();
                        })));
                      },
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
