import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/bloc/weather_bloc_bloc.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget getWeatherIcon(int code) {
      switch (code) {
        case >= 200 && < 300:
          return Image.asset('assets/1.png');
        case >= 300 && < 400:
          return Image.asset('assets/2.png');
        case >= 500 && < 600:
          return Image.asset('assets/3.png');
        case >= 600 && < 700:
          return Image.asset('assets/4.png');
        case >= 700 && < 800:
          return Image.asset('assets/5.png');
        case == 800:
          return Image.asset('assets/6.png');
        case > 800 && <= 804:
          return Image.asset('assets/7.png');
        default:
          return Image.asset('assets/7.png');
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.4 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff673ab7),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    color: Color(0xffffab40),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              // BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              //   builder: (context, state) {
              //     if (state is WeatherBlocLoaded) {
              //       return SizedBox(
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.height,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "📍 ${state.weather.areaName}",
              //               style: const TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400,
              //                 fontFamily: 'metropolis',
              //               ),
              //             ),
              //             const Text(
              //               "Good Morning 😊",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.w400,
              //                 fontFamily: 'metropolis',
              //               ),
              //             ),
              //             getWeatherIcon(state.weather.weatherConditionCode!),
              //             Center(
              //               child: Text(
              //                 "${state.weather.temperature!.celsius!.round()} °C",
              //                 style: const TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 45,
              //                   fontWeight: FontWeight.w600,
              //                   fontFamily: 'metropolis',
              //                 ),
              //               ),
              //             ),
              //             Center(
              //               child: Text(
              //                 "${state.weather.weatherMain!.toUpperCase()}",
              //                 style: const TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 25,
              //                   fontWeight: FontWeight.w500,
              //                   fontFamily: 'metropolis',
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             Center(
              //               child: Text(
              //                 DateFormat('EEEE dd .')
              //                     .add_jm()
              //                     .format(state.weather.date!),
              //                 //"Friday 16 . 09:41 am",
              //                 style: const TextStyle(
              //                   color: Colors.grey,
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w300,
              //                   fontFamily: 'metropolis',
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             Row(
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       'assets/img/11.png',
              //                       scale: 8.0,
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           'Sunnrise',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w300,
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           height: 3,
              //                         ),
              //                         Text(
              //                           DateFormat()
              //                               .add_jm()
              //                               .format(state.weather.sunrise!),
              //                           //'5:35 am',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w700,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 const Spacer(),
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       'assets/img/12.png',
              //                       scale: 8.0,
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           'Sunset',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w300,
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 3,
              //                         ),
              //                         Text(
              //                           DateFormat()
              //                               .add_jm()
              //                               .format(state.weather.sunset!),
              //                           //'5:35 am',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w700,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             const Padding(
              //               padding: EdgeInsets.symmetric(vertical: 5.0),
              //               child: Divider(
              //                 color: Colors.grey,
              //               ),
              //             ),
              //             Row(
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       'assets/img/13.png',
              //                       scale: 8.0,
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           'Temp Max',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w300,
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           height: 3,
              //                         ),
              //                         Text(
              //                           state.weather.tempMax!.celsius!
              //                               .round()
              //                               .toString(),
              //                           //'12°C',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w700,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 const Spacer(),
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       'assets/img/14.png',
              //                       scale: 8.0,
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           'Temp Min',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w300,
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 3,
              //                         ),
              //                         Text(
              //                           state.weather.tempMin!.celsius!
              //                               .round()
              //                               .toString(),
              //                           //'5°C',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w700,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // )
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "📍 Zag",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'metropolis',
                      ),
                    ),
                    const Text(
                      "Good Morning 😊",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'metropolis',
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        "21°C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'metropolis',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        "eeee",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'metropolis',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        "Friday 16 . 09:41 am",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'metropolis',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/11.png',
                              scale: 8.0,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunnrise',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '5:35 am',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/12.png',
                              scale: 8.0,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '5:35 am',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/13.png',
                              scale: 8.0,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temp Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '12°C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/14.png',
                              scale: 8.0,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temp Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '5°C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
