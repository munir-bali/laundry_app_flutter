import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/constants/app_colors.dart';
import 'package:laundry_app_flutter/providers/order_provider.dart';
import 'package:laundry_app_flutter/views/status/status_page.dart';
import 'package:laundry_app_flutter/widgets/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() =>
      _OrderPageState();
}

class _OrderPageState
    extends State<OrderPage> {
  @override
  void initState() {
    super.initState();

    final orderProvider =
        context.read<OrderProvider>();

    Future.microtask(
      orderProvider.fetchOrders,
    );
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
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                ],
              ),

              // List Order Card
              Transform.translate(
                offset: const Offset(
                    0, -40),
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
                        'LIST ORDER',
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

                      Consumer<OrderProvider>(
                        builder:
                            (context,
                                orderProvider,
                                child) {
                          return Container(
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
                            ),
                            child: Column(
                              children: [
                                if (orderProvider
                                    .loading)
                                  const Padding(
                                    padding:
                                        EdgeInsets
                                            .symmetric(
                                      vertical:
                                          100,
                                    ),
                                    child:
                                        CircularProgressIndicator(),
                                  )
                                else if (orderProvider
                                        .error !=
                                    null)
                                  const Padding(
                                    padding:
                                        EdgeInsets
                                            .symmetric(
                                      vertical:
                                          100,
                                    ),
                                    child: Text(
                                      'Gagal mengambil data.',
                                    ),
                                  )
                                else
                                  ...orderProvider
                                      .orders
                                      .take(3)
                                      .map(
                                        (order) =>
                                            Column(
                                          children: [
                                            orderRow(
                                              order.title,
                                              'X1',
                                              'Rp ${order.price}',
                                            ),
                                            const SizedBox(
                                              height:
                                                  25,
                                            ),
                                          ],
                                        ),
                                      ),

                                const SizedBox(
                                    height:
                                        180),

                                const Text(
                                  '15.00\n1 JUNI 2026',
                                  textAlign:
                                      TextAlign
                                          .center,
                                  style:
                                      TextStyle(
                                    fontSize:
                                        15,
                                    fontStyle:
                                        FontStyle
                                            .italic,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                          height: 20),

                      SizedBox(
                        width:
                            double.infinity,
                        height: 55,
                        child:
                            ElevatedButton(
                          onPressed:
                              () {
                            Navigator
                                .push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) =>
                                        const StatusPage(),
                              ),
                            );
                          },
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.primary,
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                      15),
                            ),
                          ),
                          child:
                              const Text(
                            'LIHAT STATUS',
                            style:
                                TextStyle(
                              color: Colors
                                  .black,
                              fontWeight:
                                  FontWeight.bold,
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

  Widget orderRow(
    String title,
    String qty,
    String price,
  ) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style:
                const TextStyle(
              fontSize: 16,
              fontStyle:
                  FontStyle.italic,
            ),
          ),
        ),
        Text(qty),
        Text(price),
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
