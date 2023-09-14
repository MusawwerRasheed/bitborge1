import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Data/DataSource/Static/utils.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Application/NavigationServices/Navigation.dart';



class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  late ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<String> headings = Utils.introheadings;
  final List<String> paragraphs = Utils.introparagraphs;

  void _updateIndex(int index) {
    setState(() {
      _currentIndexNotifier.value = index;
    });
  }

  void _goBack() {
    if (_currentIndexNotifier.value > 0) {
      _pageController.animateToPage(
        _currentIndexNotifier.value - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _goforward() {
    if (_currentIndexNotifier.value < 2) {
      _pageController.animateToPage(
        _currentIndexNotifier.value + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
    

      Navigate.to(context, LoginScreen());

    }
  }

  double? circularProgressValue() {
    if (_currentIndexNotifier.value == 0) {
      return 0.4;
    } else if (_currentIndexNotifier.value == 1) {
      return 0.7;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: 300,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: _updateIndex,
                    children: <Widget>[
                      SvgPicture.asset(Assets.slider1),
                      SvgPicture.asset(Assets.slider2),
                      SvgPicture.asset(Assets.slider3),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Visibility(
                      visible: _currentIndexNotifier.value != 2,
                      child: TextButton(
                        onPressed: () {
                          // _updateIndex(2);

                          _pageController.animateToPage(
                            2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: AppText(
                          Strings.skip,
                          style: Styles.montSerratRegular(context,
                              color: AppColors.yellowcolor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  width: 20.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: index == _currentIndexNotifier.value
                      ? BoxDecoration(
                          color: AppColors.yellowcolor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10))
                      : const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                );
              }),
            ),
          ),
          Container(
            height: 275,
            decoration: const BoxDecoration(
                color: AppColors.secondarycolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                AppText(
                  headings[_currentIndexNotifier.value],
                  style: Styles.montSerratRegular(context,
                      color: AppColors.whitecolor, fontSize: 23),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 50,
                  child: Text(paragraphs[_currentIndexNotifier.value],
                      style: Styles.montSerratRegular(context,
                          color: AppColors.whitecolor, fontSize: 14),
                      overflow:
                          // TextOverflow.ellipsis,
                          TextOverflow.fade),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Visibility(
                          visible: _currentIndexNotifier.value != 0,
                          child: TextButton(
                            onPressed: _goBack,
                            child: AppText(
                              Strings.back,
                              style: Styles.montSerratRegular(context,
                                  color: AppColors.yellowcolor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _goforward,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.yellowcolor,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.whitecolor,
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0.0,
                                    0.0), // Adjust the Y-offset to control the space
                                child: Container(
                                  width:
                                      40.0, // Increase the width to increase the area inside
                                  height:
                                      40.0, // Increase the height to increase the area inside
                                  child: CircularProgressIndicator(
                                    value: circularProgressValue(),
                                    // value: 10, // Set a value between 0.0 and 1.0 to represent progress
                                    strokeWidth:
                                        2.0, // Customize the stroke width
                                    color: AppColors
                                        .yellowcolor, // Customize the color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
