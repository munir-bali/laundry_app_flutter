import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/views/account/account_page.dart';
import 'package:laundry_app_flutter/views/home/home_page.dart';
import 'package:laundry_app_flutter/views/order/order_page.dart';

class CustomBottomNavbar
    extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [
          navItem(
            context,
            image:
                'lib/assets/images/house.png',
            title: 'Home',
            index: 0,
          ),
          navItem(
            context,
            image:
                'lib/assets/images/front-desk.png',
            title: 'Pesanan',
            index: 1,
          ),
          navItem(
            context,
            image:
                'lib/assets/images/income.png',
            title: 'Akun',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget navItem(
    BuildContext context, {
    required String image,
    required String title,
    required int index,
  }) {
    bool isSelected =
        currentIndex == index;

    return GestureDetector(
      onTap: () {

        if (index == 0 &&
            currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const HomePage(),
            ),
          );
        }

        if (index == 1 &&
            currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const OrderPage(),
            ),
          );
        }

        if (index == 2 &&
         currentIndex != 2) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (_) =>
                const AccountPage(),
            ),
        );
        }
            },
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 30,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight:
                  FontWeight.bold,
              color: isSelected
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
