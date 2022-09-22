import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemeData.light(),
      builder: (_, theme) {
        return MaterialApp(
          theme: theme,
          title: "Flutter Animated Theme",
          debugShowCheckedModeBanner: false,
          home: const AnimatedDarkTheme(),
        );
      },
    );
  }
}

class AnimatedDarkTheme extends StatefulWidget {
  const AnimatedDarkTheme({Key? key}) : super(key: key);

  @override
  State<AnimatedDarkTheme> createState() => _AnimatedDarkThemeState();
}

class _AnimatedDarkThemeState extends State<AnimatedDarkTheme> {
/////////////////////////////////////
//@darealdr808 on Instagram
//
//carrin808 on Github
//darealdr808 on TikTok
/////////////////////////////////////
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text("Animated Theme"),
              Text("@DevCarrin808",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white60,
                      fontWeight: FontWeight.w300,
                      fontSize: 18)),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ThemeSwitcher(
                builder: (context) => DayNightSwitcherIcon(
                  isDarkModeEnabled: isDark,
                  onStateChanged: (val) {
                    setState(() {
                      isDark = val;
                      isDark
                          ? ThemeSwitcher.of(context)
                              .changeTheme(theme: ThemeData.dark())
                          : ThemeSwitcher.of(context)
                              .changeTheme(theme: ThemeData.light());
                    });
                  },
                ),
              ),
            )
          ],
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 80,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DevCarrin808",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text("Dev Carrington",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            color: Colors.grey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
