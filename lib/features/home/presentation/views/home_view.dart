import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      bottomNavigationBar: const HomeBottomNavigationBar(),
      extendBody: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: AppColors.purple,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.access_time),
              onPressed: () {},
            ),
            title: const Column(
              children: [
                Text('Template'),
                Text('Template'),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              )
            ],
          ),
        ],
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.03,
                  right: MediaQuery.sizeOf(context).width * 0.05,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Goal of the week'),
                              Text('50km'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.run_circle),
                    ),
                    const Column(
                      children: [
                        Text('Some text'),
                        Text('Some text'),
                      ],
                    ),
                    const Column(
                      children: [
                        Text('19'),
                        Text('km'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('History'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('All'),
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.map),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Some Text'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Some Text'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Some Text'),
                            Text('Some Text'),
                          ],
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ],
        ),
        // NestedScrollView(
        //   headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
        //     SliverAppBar(
        //       backgroundColor: AppColors.purple,
        //       elevation: 0,
        //       leading: IconButton(
        //         icon: const Icon(Icons.access_time),
        //         onPressed: () {},
        //       ),
        //       title: const Column(
        //         children: [
        //           Text('Template'),
        //           Text('Template'),
        //         ],
        //       ),
        //       actions: [
        //         IconButton(
        //           icon: const Icon(Icons.settings),
        //           onPressed: () {},
        //         )
        //       ],
        //     ),
        //   ],
        //   body: ListView(
        //     children: [
        //       Stack(
        //         children: [
        //           Container(
        //             height: MediaQuery.sizeOf(context).height * 0.2,
        //             width: MediaQuery.sizeOf(context).width,
        //             decoration: const BoxDecoration(
        //               color: AppColors.purple,
        //               borderRadius: BorderRadius.only(
        //                 bottomLeft: Radius.circular(20),
        //                 bottomRight: Radius.circular(20),
        //               ),
        //             ),
        //           ),
        //           Positioned(
        //             top: MediaQuery.sizeOf(context).height * 0.03,
        //             right: MediaQuery.sizeOf(context).width * 0.05,
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(20),
        //                 color: AppColors.white,
        //               ),
        //               height: MediaQuery.sizeOf(context).height * 0.15,
        //               width: MediaQuery.sizeOf(context).width * 0.9,
        //               child: const Padding(
        //                 padding:
        //                     EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //                 child: Column(
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text('Goal of the week'),
        //                         Text('50km'),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: AppColors.white,
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(Icons.run_circle),
        //               ),
        //               const Column(
        //                 children: [
        //                   Text('Some text'),
        //                   Text('Some text'),
        //                 ],
        //               ),
        //               const Column(
        //                 children: [
        //                   Text('19'),
        //                   Text('km'),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        //       Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             const Text('History'),
        //             TextButton(
        //               onPressed: () {},
        //               child: const Text('All'),
        //             ),
        //           ],
        //         ),
        //       ),
        //       ListView.separated(
        //         padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        //         physics: const NeverScrollableScrollPhysics(),
        //         shrinkWrap: true,
        //         itemCount: 5,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Container(
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(20),
        //               color: AppColors.white,
        //             ),
        //             child: const ListTile(
        //               leading: Icon(Icons.map),
        //               title: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text('Some Text'),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Text('Some Text'),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text('Some Text'),
        //                       Text('Some Text'),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //               trailing: Icon(Icons.arrow_right_alt),
        //             ),
        //           );
        //         },
        //         separatorBuilder: (BuildContext context, int index) {
        //           return const SizedBox(height: 10);
        //         },
        //       ),
        //     ],
        //   ),
      ),
    );
  }
}

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          backgroundColor: const Color(0x00ffffff),
          unselectedItemColor: AppColors.lightGrey,
          selectedItemColor: AppColors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.area_chart_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded), label: 'Home'),
          ],
        ),
      ),
    );
  }
}
