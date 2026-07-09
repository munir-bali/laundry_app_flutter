import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/constants/app_colors.dart';
import 'package:laundry_app_flutter/views/login/login_page.dart';
import 'package:laundry_app_flutter/widgets/custom_bottom_navbar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20),
          ),
          title: const Text(
            'Logout',
          ),
          content: const Text(
            'Apakah kamu yakin ingin logout?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Batal',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red,
              ),
              child:
                  const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFEAEAEA),

      bottomNavigationBar:
          const CustomBottomNavbar(
        currentIndex: 2,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Header
              Stack(
                children: [
                  Container(
                    height: 220,
                    decoration:
                        const BoxDecoration(
                      color:
                          AppColors.primary,
                      borderRadius:
                          BorderRadius.only(
                        bottomLeft:
                            Radius.circular(
                                100),
                        bottomRight:
                            Radius.circular(
                                100),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets
                            .all(20),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              'PROFILE',
                              style:
                                  TextStyle(
                                fontSize:
                                    16,
                              ),
                            ),
                            Text(
                              'FEBRI',
                              style:
                                  TextStyle(
                                fontSize:
                                    24,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),

                        Image.asset(
                          'lib/assets/images/delivery.png',
                          width: 90,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Transform.translate(
                offset:
                    const Offset(0, -40),
                child: Container(
                  margin:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 15,
                  ),
                  padding:
                      const EdgeInsets
                          .all(20),
                  decoration:
                      BoxDecoration(
                    color:
                        const Color(
                            0x54D9D9D9),
                    borderRadius:
                        BorderRadius
                            .circular(
                                20),
                  ),
                  child: Column(
                    children: [

                      const CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color:
                              Colors.grey,
                        ),
                      ),

                      const SizedBox(
                          height: 20),

                      const Text(
                        'FEBRI',
                        style:
                            TextStyle(
                          fontSize:
                              22,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),

                      const Text(
                        'admin@gmail.com',
                        style:
                            TextStyle(
                          color:
                              Colors.grey,
                        ),
                      ),

                      const SizedBox(
                          height: 30),

                      profileTile(
                        Icons.phone,
                        '08123456789',
                      ),

                      profileTile(
                        Icons.location_on,
                        'Jakarta, Indonesia',
                      ),

                      profileTile(
                        Icons.local_laundry_service,
                        'Laundry Premium',
                      ),

                      const SizedBox(
                          height: 30),

                      SizedBox(
                        width:
                            double.infinity,
                        height: 55,
                        child:
                            ElevatedButton(
                          onPressed:
                              () => logout(
                                  context),
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red,
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                      15),
                            ),
                          ),
                          child:
                              const Text(
                            'LOGOUT',
                            style:
                                TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Colors.white,
                            ),
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
      ),
    );
  }

  Widget profileTile(
    IconData icon,
    String title,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 15,
      ),
      padding:
          const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Text(title),
        ],
      ),
    );
  }
}
