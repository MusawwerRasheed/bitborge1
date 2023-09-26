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

 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(1);

  PageController pageController = PageController(initialPage: 1);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double containerWidth = 40.0.w; // Use responsive width
  bool isCollapsed = false;
  bool iconvisibility = false;
  bool textvisibility = false;



  void toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
      if (isCollapsed) {
        containerWidth = 40.0.w; // Use responsive width
        textvisibility = false;
        iconvisibility = false;
      } else {
        containerWidth = 170.0.w; // Use responsive width
        iconvisibility = true;
        textvisibility = true;
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
    // Initialize flutter_screenutil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 640), );

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primarycolor,
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
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
            ],
          ),
          Positioned(
            bottom: 52.h, // Use responsive height
            child: GestureDetector(
              onTap: toggleCollapse,
              child: AnimatedContainer(
                width: containerWidth,
                height: 30.h, // Use responsive height
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                decoration: BoxDecoration(
                  color: AppColors.yellowcolor,
                  borderRadius: BorderRadius.circular(2.w), // Use responsive radius
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 55.h, // Use responsive height
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w), // Use responsive padding
                      child: GestureDetector(
                        onTap: toggleCollapse,
                        child: Container( 
                                 height: 25.h,
                          child: SvgPicture.asset(
                            Assets.diamondgrey,
                            color: AppColors.whitecolor,
                          ),
                        ),
                      ),
                    ),
                    if (!isCollapsed)
                      Padding(
                        padding: EdgeInsets.only(left: 4.w), // Use responsive padding
                        child: Visibility(
                          visible: textvisibility,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return customdialog();
                                },
                              );
                            },
                            child: Text(textScaleFactor:1.0, 
                              'Buy a premium',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp, // Use responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                     SizedBox(
                      width: 13.w, // Use responsive width
                    ),
                    Visibility(
                      visible: iconvisibility,
                      child: GestureDetector(
                        onTap: toggleCollapse,
                        child: SvgPicture.asset(
                          Assets.crosscircle,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: pageIndexNotifier,
        builder: (BuildContext context, int currentIndex, Widget? child) {
          return BottomNavigationBar(
            showSelectedLabels: true,
            unselectedItemColor: Colors.white,
            selectedItemColor: AppColors.yellowcolor,
            backgroundColor: Colors.blue, // Set the background color to blue
            items: [
              buildBottomNavigationBarItem(
                icon: Assets.homegrey,
                label: 'Home',
                index: 0,
              ),
              buildBottomNavigationBarItem(
                icon: Assets.form,
                label: 'News',
                index: 1,
              ),
              buildBottomNavigationBarItem(
                icon: Assets.signals,
                label: 'Signals',
                index: 2,
              ),
              buildBottomNavigationBarItem(
                icon: Assets.gems,
                label: 'Gems',
                index: 3,
              ),
            ],
            currentIndex: currentIndex,
            onTap: (int index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              );
              pageIndexNotifier.value = index;
            },
          );
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
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
