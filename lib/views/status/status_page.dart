import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/constants/app_colors.dart';
import 'package:laundry_app_flutter/services/notification_service.dart';
import 'package:laundry_app_flutter/widgets/custom_bottom_navbar.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() =>
      _StatusPageState();
}

class _StatusPageState
    extends State<StatusPage> {
  bool _notificationShown = false;

  @override
  void initState() {
    super.initState();
    showStatusNotification();
  }

  Future<void> showStatusNotification() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted || _notificationShown) {
      return;
    }

    _notificationShown = true;
    await NotificationService
        .showLaundryFinishedNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFEAEAEA),

      // Bottom Navigation
        bottomNavigationBar:
    const CustomBottomNavbar(
  currentIndex: 1,
),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Header Biru
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
                              'SELAMAT DATANG,',
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

              // Status Card
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors
                            .grey
                            .shade300,
                        blurRadius:
                            8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      const Text(
                        'STATUS TRANSAKSI',
                        style:
                            TextStyle(
                          fontSize:
                              22,
                          fontStyle:
                              FontStyle
                                  .italic,
                        ),
                      ),

                      const SizedBox(
                          height: 20),

                      Container(
                        width:
                            double.infinity,
                        padding:
                            const EdgeInsets
                                .all(20),
                        decoration:
                            BoxDecoration(
                          color:
                              Colors.white,
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors
                                  .grey
                                  .shade200,
                              blurRadius:
                                  5,
                            )
                          ],
                        ),
                        child: Column(
                          children: [

                            statusRow(
                              'UTURAN',
                              '003',
                            ),

                            const SizedBox(
                                height:
                                    25),

                            statusRow(
                              'WAKTU ORDER',
                              '15.00\n1 JUNI 2026',
                            ),

                            const SizedBox(
                                height:
                                    25),

                            statusRow(
                              'STATUS',
                              'ON PROGRESS',
                            ),

                            const SizedBox(
                                height:
                                    25),

                            statusRow(
                              'ONGKIR',
                              'GRATIS ONGKIR',
                            ),

                            const SizedBox(
                                height:
                                    25),

                            statusRow(
                              'TOTAL',
                              'RP36.000',
                            ),
                          ],
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

  Widget statusRow(
    String title,
    String value,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontStyle:
                FontStyle.italic,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign:
                TextAlign.end,
            style:
                const TextStyle(
              fontSize: 15,
              fontStyle:
                  FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem(
    String image,
    String title,
  ) {
    return Column(
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
          style:
              const TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
