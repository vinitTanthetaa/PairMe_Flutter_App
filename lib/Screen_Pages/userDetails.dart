import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/image_page.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/select.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:video_player/video_player.dart';

class UsersDetails extends StatefulWidget {
  List list;
  UsersDetails({super.key,required this.list});

  @override
  State<UsersDetails> createState() => _UsersDetailsState();
}

class _UsersDetailsState extends State<UsersDetails>
    with TickerProviderStateMixin{
  int pageViewIndex = 0;
  final TextEditingController _bio = TextEditingController();
  List _type =[];

  List lookingFor = [
    'Investor',
    'Startup founder',
    'Corporate executive',
  ];
List list = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT1VsnxGw7Phf_Giwuc126WClsqRK5hEVzGF8-8b4fWtE-CTqwBkTf1cBfxbXepxe8aug&usqp=CAU'
  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLWxpa2VkfDE3fHx8ZW58MHx8fHx8&w=1000&q=80',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92eisuWOx3tEjeW14mT9ACVgXDwIRBGtnww&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX029ohIUSygq9zirl9fSNBwSLqEOaKEYuw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ0mv_NlCWaAPKCTefbXTZtdh3-d3CuK9GXA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeHt2GDofV5sNOaTrLarqU3XmMpTNXxaw9dg&usqp=CAU',
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth(context, dividedBy: 15)),
                      height: screenHeight(context,dividedBy: 30),
                      width: screenWidth(context,dividedBy: 4),
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/Images/pairme.png'))
                      ),
                    ),
                    CarouselSlider(
                        items: widget.list.map((e) => InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Image_Screen(image: widget.list[pageViewIndex],);
                            },));
                          },
                          child: widget.list[pageViewIndex].toString().endsWith('.mp4')  ?
                          Container(
                            margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 65)),
                            height: screenHeight(context,dividedBy:2.5),
                            width: screenWidth(context ),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              //  image: DecorationImage(image: NetworkImage(list[pageViewIndex]),fit: BoxFit.fill)
                            ),
                            child: Stack(
                              children: [
                                VideoPlayer(VideoPlayerController.networkUrl(Uri.parse(widget.list[pageViewIndex]))
                                  // VideoPlayerController.networkUrl(Uri.parse(list[pageViewIndex]))..initialize().then((_) {
                                  //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                                  //   setState(() {});
                                  // })
                                ),
                                const Align(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white30,
                                    child: Icon(Icons.play_arrow_rounded),
                                  ),
                                )
                              ],
                            ),
                          ): Container(
                            margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 65)),
                            height: screenHeight(context,dividedBy:2.5),
                            width: screenWidth(context ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(image: NetworkImage(widget.list[pageViewIndex]),fit: BoxFit.fill)
                            ),
                          ),
                        )).toList(),
                        options: CarouselOptions(
                          height: screenHeight(context,dividedBy:2),
                          aspectRatio: 16/9,
                          viewportFraction: 1.0,
                          autoPlayCurve: Curves.linear,
                          onPageChanged: (index, re) {
                               pageViewIndex = index;
                              setState(() {});
                             },
                        )),
                    Center(
                      child: TabPageSelector(
                        controller: TabController(
                            vsync: this,
                            length: widget.list.length,
                            animationDuration: const Duration(milliseconds: 300),
                            initialIndex: pageViewIndex),
                        color: AppColor.gray,
                        borderStyle: BorderStyle.none,
                        indicatorSize: 5,
                        selectedColor: AppColor.skyBlue,
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 65),),
                    Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth(context, dividedBy: 15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Jane Koblenz',style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff1E1E1E),fontSize: 15,fontFamily: 'Roboto'),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 70)),
                              height: screenHeight(context,dividedBy: 35),
                              width: screenWidth(context,dividedBy: 20),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/Images/verified.png'))
                              ),
                            )
                          ],
                        ),
                        const Text('Entrepreneur',style: TextStyle(fontWeight: FontWeight.w400,color: AppColor.fontdarkgray,fontSize: 13,fontFamily: 'Roboto'),),
                        SizedBox(height: screenHeight(context,dividedBy: 500),),
                        const Row(
                          children: [
                            Text('City/Country: ',style: TextStyle(fontWeight: FontWeight.w500,color: AppColor.skyBlue,fontSize: 12,fontFamily: 'Roboto'),),
                            Text('Yorktown',style: TextStyle(fontWeight: FontWeight.w400,color: AppColor.dropdownfont,fontSize: 12,fontFamily: 'Roboto'),),

                          ],
                        ),
                        SizedBox(height: screenHeight(context,dividedBy: 500),),
                        const Row(
                          children: [
                            Text('Role: ',style: TextStyle(fontWeight: FontWeight.w500,color: AppColor.skyBlue,fontSize: 12,fontFamily: 'Roboto'),),
                            Text('CEO',style: TextStyle(fontWeight: FontWeight.w400,color: AppColor.dropdownfont,fontSize: 12,fontFamily: 'Roboto'),),

                          ],
                        ),
                        SizedBox(height: screenHeight(context,dividedBy: 500),),
                        const Row(
                          children: [
                            Text('Company: ',style: TextStyle(fontWeight: FontWeight.w500,color: AppColor.skyBlue,fontSize: 12,fontFamily: 'Roboto'),),
                            Text('Infosys',style: TextStyle(fontWeight: FontWeight.w400,color: AppColor.dropdownfont,fontSize: 12,fontFamily: 'Roboto'),),

                          ],
                        ),
                        SizedBox(height: screenHeight(context,dividedBy: 70),),
                        custom_textfield_header(text: 'Looking for'),
                        SizedBox(
                         // margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 100)),
                          height: screenHeight(context,dividedBy: 11),
                          width: screenWidth(context),
                          child: ListView.builder(
                            itemCount: lookingFor.length,
                            padding:  EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 300)),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                            return Padding(
                              padding:  EdgeInsets.only(bottom:screenHeight(context,dividedBy: 500) ,top:  0),
                              child: Row(
                                children: [
                                  Container(
                                    height: screenHeight(context,dividedBy: 50),
                                    width: screenHeight(context,dividedBy: 50),
                                    color: const Color(0xffD4E2FF),
                                    child: Center(
                                      child: Container(
                                        height: screenHeight(context,dividedBy: 70),
                                        width: screenHeight(context,dividedBy: 70),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(image: AssetImage('assets/Images/check.png'),fit: BoxFit.fill)
                                        ),
                                      ) ,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth(context,dividedBy: 50),),
                                  Text(lookingFor[index],style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto',color:  AppColor.dropdownfont),)
                                ],
                              ),
                            );
                          },),
                        ),
                        custom_textfield_header(text: 'Bio'),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight(context, dividedBy: 90),bottom: screenHeight(context, dividedBy: 50)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColor.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  0,
                                  0,
                                ),
                                blurRadius: 8,
                                // spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth(context, dividedBy: 25),
                                vertical: screenHeight(context, dividedBy: 150)),
                            child: TextField(
                              maxLength: 250,
                              readOnly: true,
                              minLines: 1,
                              maxLines: 7,
                              controller: _bio,
                              cursorColor: AppColor.fontdarkgray,
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: AppColor.dropdownfont),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  // hintText: 'Enter some words of your Profile',
                                  // hintStyle: TextStyle(
                                  //     fontFamily: 'Roboto',
                                  //     fontWeight: FontWeight.w400,
                                  //     fontSize: 15)
                              ),
                            ),
                          ),
                        ),
                        custom_textfield_header(text: 'Documents'),
                        Container(
                          height: screenHeight(context,dividedBy: 4.3),
                           width: screenWidth(context),
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            //padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 100)),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                            return  Container(
                              margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 200)),
                              height: screenHeight(context,dividedBy: 15),
                              width: screenWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColor.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      0,
                                      0,
                                    ),
                                    blurRadius: 8,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 150),horizontal:screenWidth(context,dividedBy: 70)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: screenWidth(context,dividedBy: 13),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage('assets/Images/uploadedfile.png'))
                                      ),
                                    ),
                                    SizedBox(width: screenWidth(context,dividedBy: 50),),
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('image_03.pdf ',style: TextStyle(fontFamily: 'Roboto',fontSize: 12,fontWeight: FontWeight.w500),),
                                        Text('96.47 KB ',style: TextStyle(fontFamily: 'Roboto',fontSize: 10,fontWeight: FontWeight.w500),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                            },),
                        ),
                      ],
                    ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
