import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Common/dialog.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/custom_drawer.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Controller/bottom_navigation_notifier.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Gems/gems_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/news_detail_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Signals/signals_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/home/homescreen.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:bitborge/Presentation/Widgets/Notification/Components/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(3);

  PageController pageController = PageController(initialPage: 1);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double containerWidth = 35.0;
  bool isCollapsed = false;
  bool iconvisibility = false;
  bool textvisibility = false;

  void toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
      if (isCollapsed) {
        containerWidth = 30.0;
        textvisibility = false;
        iconvisibility = false; // Adjust this width as needed
      } else {
        containerWidth = 155.0;
        iconvisibility = true;
        textvisibility = true;
        // Original width
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    pageIndexNotifier.dispose(); // Don't forget to dispose the ValueNotifier.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var collapse;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primarycolor,
      drawer: const CustomDrawer(),
      body: Stack(children: [
        Column(children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (int page) {
                pageIndexNotifier.value = page;
              },
              children: <Widget>[
                Container(
                  color: AppColors.primarycolor,
                  child: Center(
                    child: HomeScreen(scaffoldKey: scaffoldKey),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: NewsScreen(
                      scaffoldkey: scaffoldKey,
                    ),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: signalsScreen(scaffoldKey: scaffoldKey),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: GemsScreen(scaffoldKey: scaffoldKey),
                  ),
                ),
              ],
            ),
          ),
        ]),


        Positioned(
          bottom: 52,
          child: GestureDetector(
            onTap: toggleCollapse,
            child: AnimatedContainer(
              width: containerWidth,
              height: 30,
              duration:
                  const Duration(milliseconds: 300), // Adjust animation speed
              curve: Curves.decelerate, // Adjust animation curve
              decoration: BoxDecoration(
                color: AppColors.yellowcolor,
                borderRadius: BorderRadius.circular(2),
                
              ),
            ),
          ),

          // Container(key: collapse,
          //   width: 155,
          //   height: 30,
          //   decoration: BoxDecoration(
          //       color: AppColors.yellowcolor,
          //       borderRadius: BorderRadius.circular(2)),
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 2.0),
          //         child: SvgPicture.asset(Assets.diamondgrey),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 3.0),
          //         child: AppText(
          //           'Buy a premium',
          //           style: Styles.montSerratRegular(context,
          //               color: AppColors.whitecolor, fontSize: 16),
          //         ),
          //       ),
          //       SizedBox(width: 3,),
          //       GestureDetector(
          //          child: GestureDetector(
          //           onTap: (){ },
          //           child: SvgPicture.asset(Assets.check))),
          //     ],
          //   ),
          // ),
        ),
        Positioned(
          bottom: 55,
          child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: GestureDetector(
                      onTap: toggleCollapse,
                      child: SvgPicture.asset(
                        Assets.diamondgrey,
                        color: AppColors.whitecolor,
                      )), // Replace with your asset path
                ),
                if (!isCollapsed)
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Visibility(
                      visible: textvisibility,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return customdialog();
                              });
                        },
                        child: const Text(
                          'Buy a premium',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  width: 13,
                ),
                Visibility(
                  visible: iconvisibility,
                  child: GestureDetector(
                    onTap: toggleCollapse,
                    child: SvgPicture.asset(
                      Assets.crosscircle, // Replace with your asset path
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        )
      ]),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: pageIndexNotifier,
        builder: (BuildContext context, int currentIndex, Widget? child) {
          return BottomNavigationBar(
            showSelectedLabels: true,
            unselectedItemColor: Colors.white,
            selectedItemColor: AppColors.yellowcolor,
            backgroundColor: Colors.blue, // Set the background color to blue
            items: [
              _buildBottomNavigationBarItem(
                icon: Assets.homegrey,
                label: 'Home',
                index: 0,
              ),
              _buildBottomNavigationBarItem(
                icon: Assets.form,
                label: 'News',
                index: 1,
              ),
              _buildBottomNavigationBarItem(
                icon: Assets.signals,
                label: 'Signals',
                index: 2,
              ),
              _buildBottomNavigationBarItem(
                icon: Assets.gems,
                label: 'Gems',
                index: 3,
              ),
            ],
            currentIndex:
                currentIndex, // Use the currentIndex from the ValueListenable
            onTap: (int index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              );
              pageIndexNotifier.value = index; // Update the ValueNotifier
            },
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        color: pageIndexNotifier.value == index
            ? AppColors.yellowcolor
            : const Color.fromARGB(255, 187, 176, 176),
      ),
      label: label,
      backgroundColor: AppColors.primarycolor,
    );
  }
}

