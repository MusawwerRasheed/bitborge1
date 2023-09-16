import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/dialog.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/Components/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 


 class NewsScreen extends StatefulWidget {
  var scaffoldkey;
  NewsScreen({super.key, this.scaffoldkey});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ValueNotifier<int> selectedindex = ValueNotifier<int>(0);
  List<String> titles = ['Positive', 'Negative', 'Neutral'];
  List<String> newscats = ['All', 'Favorite Coins', 'Popular Events', 'News'];
  List<bool> isSelected = [true, false, false, false]; // Track selected items

  @override
  void dispose() {
    selectedindex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < newscats.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      selectedindex.value = i; // Update selected index
                      setState(() {
                        // Update the isSelected list to track selected items
                        for (int j = 0; j < isSelected.length; j++) {
                          isSelected[j] = (j == i);
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          newscats[i],
                          style: TextStyle(
                            color: isSelected[i] ? Colors.orange : Colors.white,
                          ),
                        ),
                        if (isSelected[i])
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            width: 6,
                            height: 6,
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: selectedindex,
              builder: (BuildContext context, int value, Widget? child) {
                return screens(
                  screencount: value,
                  titles: titles,
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primarycolor, // Update this to your desired background color
      appBar: CustomAppBar(
        leading: SvgPicture.asset(Assets.dropdown),
        shownotificationicon: true,
        leadingfunction: () {
          widget.scaffoldkey.currentState!.openDrawer();
        },
        texttitle: 'News',
      ),
    );
  }
}

class screens extends StatefulWidget {
  final List<String>? titles;
  final int? screencount;
  const screens({super.key, this.titles, this.screencount});

  @override
  State<screens> createState() => _screensState();
}

class _screensState extends State<screens> {
  @override
  Widget build(BuildContext context) {
    if (widget.screencount == 0) {
      return Column(

        // color: const Color.fromARGB(255, 151, 167, 238),
        // width: MediaQuery.of(context).size.width * 0.9,
        // height: 200,
        children:[ 
          
          
          Row( children: [  
                 Padding(
                   padding: const EdgeInsets.only(left:14.0),
                   child: AppText('100 News found', fontSize: 14, style: Styles.montSerratRegular(context, color: AppColors.grettext),),
                 )                            
          ],),
          
           Expanded(
          
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.titles!.length, // Use the length of the titles list
            itemBuilder: (BuildContext context, index) {
              // Access each item from the titles list using index
              String title = widget.titles![index];
              return NewsTile(
                tag: title,
              );
            },
          ),
        ),
        ], 

      );
    } else if (widget.screencount == 1 ) {
      return  
      Column(

        // color: const Color.fromARGB(255, 151, 167, 238),
        // width: MediaQuery.of(context).size.width * 0.9,
        // height: 200,
        children:[ 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [  
                             SizedBox(child: Row(children: [
                               SvgPicture.asset(Assets.heartwhite), 
                               SizedBox(width: 10,), 
                    
                     AppText('Favorite coins', fontSize: 16, style: Styles.montSerratRegular(context, color: AppColors.whitecolor),),
                                              
                             ],),), 
                              
                              GestureDetector(  
                                onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return customdialog( dialogbuttontext: 'Add Coin' , dialoginput: "Separate coin with, ',' (BTC, ETH)",  dialogtitle: 'Add your Favorite coins', dialogpara: 'E.g BTC, ETH, BNB etc',  mainsvg: SvgPicture.asset(Assets.bitcoingroup),);
                              });
                        },
                                child: AppText('+ Add Coin ', style: Styles.montSerratRegular(context, color: AppColors.yellowcolor, fontSize:16 ),)),
            ],),
          ),
          
          Row( children: [  
                 Padding(
                   padding: const EdgeInsets.only(left:14.0),
                   child: AppText('100 News found', fontSize: 14, style: Styles.montSerratRegular(context, color: AppColors.grettext),),
                 )                            
          ],),
          
           Expanded(
          
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.titles!.length, // Use the length of the titles list
            itemBuilder: (BuildContext context, index) {
              // Access each item from the titles list using index
              String title = widget.titles![index];
              return NewsTile(
                tag: title,
              );
            },
          ),
        ),
        ], 
      );
    } else if (widget.screencount == 2) {
      return Container(color: Colors.indigo, width: MediaQuery.of(context).size.width*0.9, height: 200);
    } else {
      return Container(color: Colors.pink, width: MediaQuery.of(context).size.width*0.9, height: 200);
    }
  }
}





















 




















 
 



//version 1 



// class NewsScreen extends StatefulWidget {
//   var scaffoldkey;
//   NewsScreen({super.key, this.scaffoldkey});

//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }

// class _NewsScreenState extends State<NewsScreen> {
//   final ValueNotifier<int> selectedindex = ValueNotifier<int>(0);
//   List<String> titles = ['Positive', 'Negative', 'Neutral'];
//   List<String> newscats = ['All', 'Favorite Coins', 'Popular Events', 'News'];

// //  _onItemTap(int index) {
// //     selectedindex.value = index;
// //     ValueListenableBuilder(
// //           valueListenable: selectedindex,
// //           builder: (context, value, child) {
// //             return Dialog(
// //               child: Container(child: const Column(children: [ 
                  
                  
// //               ],),),
// //             );
// //           },
// //         );
// //   }

//   @override
//   void dispose() {
//     selectedindex.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         for (int i = 0; i < newscats.length; i++)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
//             child: GestureDetector(

              

//                 onTap: (){ 
//                   print(i);                    
//                     ValueListenableBuilder(
//                       valueListenable:  selectedindex,
//                       builder: (BuildContext context, dynamic value, Widget? child) {
//                         return  Stack(

//                           children: [ 
//                             Positioned ( bottom: 20, left: 3,
//                               child:   Container( 
//                              child: screens(screencount: value), 
//                           ),)
//                           ]
//                         );
//                       },
//                     );
//                  } ,
                     
//                 child: Text(
//                     style: const TextStyle(color: Colors.white), 
//                     newscats[i]
//                     ),
//                     ),


//           ),

//         Container(
//           color: Colors.orange,
//           width: 6,
//           height: 6,
//         ),
//         // NewsCategoryWidget(category: newscats[i]),
//       ],
//     ),




//           Padding(
//             padding: const EdgeInsets.only(left: 15.0),
//             child: Align(
//                 alignment: Alignment.topLeft,
//                 child: AppText(
//                   '100 News Found',
//                   style: Styles.montSerratRegular(context,
//                       color: AppColors.grettext),
//                 )),
//           ),
          // Expanded(
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: titles.length, // Use the length of the titles list
          //     itemBuilder: (BuildContext context, index) {
          //       // Access each item from the titles list using index
          //       String title = titles[index];
          //       return NewsTile(
          //         tag: title,
          //       );
          //     },
          //   ),
          // ),
//         ],
//       ),
//       backgroundColor: AppColors.primarycolor,
//       appBar: CustomAppBar(
//         leading: SvgPicture.asset(Assets.dropdown),
//         shownotificationicon: true,
//         leadingfunction: () {
//           widget.scaffoldkey.currentState!.openDrawer();
//         },
//         texttitle: 'News',
//       ),



//     );
//   }


 



// }


// class screens extends StatefulWidget {
//   final int? screencount ;
//   const screens({super.key , this.screencount});

//   @override
//   State<screens> createState() => _screensState();
// }

// class _screensState extends State<screens> {
//   @override
//   Widget build(BuildContext context) {

//     if(widget.screencount == 0){
      
//       return Container(color: Colors.green, width: 200, height: 200,) ;
       
//     }else if (widget.screencount == 1){
//       return Container(color: Colors.red, width: 200, height: 200,);
//     }
//     else if ( widget.screencount ==2){
//        return Container(color: Colors.indigo, width: 200, height: 200,);
//     }
//     else{ return Container(color: Colors.pink,width: 200, height: 200,);}

    
//   }
// }
 

 
 
















// class NewsScreen extends StatefulWidget {
// final dynamic scaffoldKey;
//    NewsScreen({super.key, required this.scaffoldKey});
//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }


// class _NewsScreenState extends State<NewsScreen> {

 

  

//   @override
//   Widget build(BuildContext context) {
   
     
//     // var scaffoldKey;
//     //  print('global scaffold key is $scaffoldKey');
//     return Scaffold(
//       backgroundColor: AppColors.primarycolor,
//       // key: scaffoldKey,
       
//     appBar: CustomAppBar(texttitle: 'News', leading: SvgPicture.asset(Assets.dropdown),
//     leadingfunction: (){
//       // printi();
//       // scaffoldKey.currentState.openDrawer();
//       // print('scaffoldKey is $scaffoldKey');
//     },),

// drawer: CustomDrawer(),

// body:    
//  Container(
//       child: ListView.builder(
//         physics: BouncingScrollPhysics() ,
//         itemCount: 4,
//         itemBuilder: (context,index){
//         return NewsTile();
//       }),
//     ),
//     );
//   }
// }



