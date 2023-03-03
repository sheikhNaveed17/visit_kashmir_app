import 'package:app2/Authentaction/sign_in/sign_in_screen.dart';
import 'package:app2/Wizard/screen_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home/main_home/main_home.dart';
import 'Network/sharedPreferences/sharedpref.dart';
import 'Recommenditions/days_scroll_area/components/visitbody.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic finalToken;

  @override
  void initState() {
    ValidateBearer().whenComplete(() {
      finalToken == null
          ? Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      )
          : Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainHome()),
      );
    });
    super.initState();
  }

  Future ValidateBearer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('Bearer');
    print(stringValue);
    setState(() {
      finalToken = stringValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: CircularProgressIndicator())),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [ScreenSelection()],
            // CompleteProfileScreen
          ),
        );
      },
    );
  }
}

// return Scaffold(
// body: Stack(
// children: [IntroScreen()],
// ),
// );

// class Homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [DrawerScreen(), HomeScreen()],
//       ),
//     );
//   }
// }
