import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/constants/app_colors.dart';
import 'package:laundry_app_flutter/views/order/order_page.dart';
import 'package:laundry_app_flutter/widgets/custom_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFEAEAEA),

      bottomNavigationBar:
            const CustomBottomNavbar(
        currentIndex: 0,
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
                    child: Column(
                      children: [

                        // Welcome
                        Row(
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

                        const SizedBox(
                            height: 20),

                        // Card Saldo
                        Container(
                          padding:
                              const EdgeInsets
                                  .all(15),
                          decoration:
                              BoxDecoration(
                            color:
                                Colors.white,
                            borderRadius:
                                BorderRadius.circular(
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
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [

                              // Saldo
                              const Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    'SALDO',
                                    style:
                                        TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Rp100.000',
                                    style:
                                        TextStyle(
                                      fontSize:
                                          18,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '100 Point',
                                    style:
                                        TextStyle(
                                      color:
                                          Colors.green,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  actionButton(
                                      Icons
                                          .wallet,
                                      'ADD\nSALDO'),
                                  const SizedBox(
                                      width:
                                          10),
                                  actionButton(
                                      Icons
                                          .stars,
                                      'GET\nPOINT'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Layanan Kami
              const Padding(
                padding:
                    EdgeInsets.symmetric(
                        horizontal: 20),
                child: Align(
                  alignment:
                      Alignment
                          .centerLeft,
                  child: Text(
                    'LAYANAN KAMI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 20,
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  mainAxisSpacing:
                      15,
                  crossAxisSpacing:
                      15,
                  children: [
                    serviceCard(
                      context,
                      'lib/assets/images/laundry-machine.png',
                      'Kiloan',
                    ),
                    serviceCard(
                      context,
                      'lib/assets/images/clean-clothes.png',
                      'Satuan',
                    ),
                    serviceCard(
                      context,
                      'lib/assets/images/front-desk.png',
                      'Express',
                    ),
                    serviceCard(
                      context,
                      'lib/assets/images/clothes-rack.png',
                      'Karpet',
                    ),
                    serviceCard(
                      context,
                      'lib/assets/images/iron.png',
                      'Setrika',
                    ),
                    serviceCard(
                      context,
                      'lib/assets/images/delivery.png',
                      'Express',
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

  Widget actionButton(
    IconData icon,
    String text,
  ) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color:
            Colors.green.withValues(
          alpha: 0.2,
        ),
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            text,
            textAlign:
                TextAlign.center,
            style:
                const TextStyle(
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(
    BuildContext context,
    String image,
    String title,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const OrderPage(),
          ),
        );
      },
      child: Container(
        decoration:
            BoxDecoration(
          color:
              AppColors.secondary,
          borderRadius:
              BorderRadius.circular(
                  15),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment
                  .center,
          children: [
            Image.asset(
              image,
              height: 50,
            ),
            const SizedBox(
                height: 8),
            Text(
              title,
              style:
                  const TextStyle(
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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
