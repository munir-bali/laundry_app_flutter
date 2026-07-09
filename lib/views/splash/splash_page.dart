import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/constants/app_colors.dart';
import 'package:laundry_app_flutter/storage/shared_pref_service.dart';
import 'package:laundry_app_flutter/views/get_started/get_started_page.dart';
import 'package:laundry_app_flutter/views/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState
    extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    final isLogin =
        await SharedPrefService.getLoginStatus();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => isLogin
            ? const HomePage()
            : const GetStartedPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [

              // Gambar Splash
              SizedBox(
                width: 320,
                child: Image.asset(
                  'lib/assets/images/delivery.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                'DRIVER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const Text(
                'LAUNDRY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
