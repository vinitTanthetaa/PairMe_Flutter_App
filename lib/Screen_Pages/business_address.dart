import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pair_me/Screen_Pages/business_profile.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/stepper.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:table_calendar/table_calendar.dart';

class Business_Address extends StatefulWidget {
  Business_Address({super.key});

  @override
  State<Business_Address> createState() => _Business_AddressState();
}

class _Business_AddressState extends State<Business_Address> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  bool _contry = false;
  bool _state = false;
  bool _city = false;
  bool calendar = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  final TextEditingController _Address = TextEditingController();
  final TextEditingController _Address2 = TextEditingController();
  final TextEditingController _Zipcode = TextEditingController();
  final TextEditingController _Contry = TextEditingController();
  final TextEditingController _State = TextEditingController();
  final TextEditingController _City = TextEditingController();
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth(context,dividedBy: 20)),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )),
                title: custom_header(text: "Business or Professional Address"),
              ),
              body: SingleChildScrollView(
                physics:ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_discription(text: "Your new password cannot be the same as a previous password."),
                      SizedBox(height: screenHeight(context,dividedBy: 50),),
                      custom_textfield_header(text: 'Address'),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Address line 1",mxline: 2, hidetext: false, controller: _Address),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Address line 2",mxline: 2, hidetext: false, controller: _Address2),
                      custom_textfield_header(text: 'Country'),
                      Custom_textfield(context, onTap: () {
                        setState(() {
                          _contry = !_contry;
                        });
                      },show_icon: true,image: _contry ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                        setState(() {
                          _contry = !_contry;
                        });
                      }, hint: "Select", hidetext: false, controller: _Contry),
                      _contry ?Container(
                        height: screenHeight(context,dividedBy: 7),
                        width: screenWidth(context),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custom_text(text: 'Armenia', color: const Color(0xff303030)),
                              custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                              custom_text(text: 'Denmark', color: const Color(0xff303030)),
                              custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                            ],
                          ),
                        ),
                      ) : const SizedBox(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'State'),
                                Custom_textfield(context, show_icon: true,onTap: () {
                                  setState(() {
                                    _state = !_state;
                                  });
                                },image: _state ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                                  setState(() {
                                    _state = !_state;
                                  });
                                }, hint: "Select", hidetext: false, controller: _State),
                                _state ? Container(
                                  height: screenHeight(context,dividedBy: 7),
                                  width: screenWidth(context),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            1,
                                            1,
                                          ),
                                          blurRadius: 4,
                                          // spreadRadius: 1.0,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                        custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                        custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                        custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                                      ],
                                    ),
                                  ),
                                ) : SizedBox(height: _city ?screenHeight(context,dividedBy: 6.35) : 0,)
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth(context,dividedBy: 50),),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'City'),
                                Custom_textfield(context, show_icon: true,onTap: () {
                                  setState(() {
                                    _city = !_city;
                                  });
                                },image: _city ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                                  setState(() {
                                    _city = !_city;
                                  });
                                }, hint: "Select", hidetext: false, controller: _City),
                                _city? Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: screenHeight(context,dividedBy: 7),
                                  width: screenWidth(context),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            1,
                                            1,
                                          ),
                                          blurRadius: 4,
                                          // spreadRadius: 1.0,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                        custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                        custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                        custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                                      ],
                                    ),
                                  ),
                                ):SizedBox(height:_state ? screenHeight(context,dividedBy: 6.35) : 0,)
                              ],
                            ),
                          )
                        ],),
                      custom_textfield_header(text: 'Post code / Zip code'),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Post code / Zip code",number: true, hidetext: false, controller: _Zipcode),
                      custom_textfield_header(text: 'Start Date'),
                      Custom_textfield(context,onTap: () {
                        setState(() {
                          calendar = !calendar;
                        });
                      }, show_icon: true, image: 'assets/Images/calendar.png',onPress: () {
                        setState(() {
                          calendar = !calendar;
                        });
                      }, hint: 'Select ', controller: _date, hidetext: false,readOnly: true),
                      calendar ? Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                spreadRadius: 0.0,
                              ),
                            ]
                        ),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          headerStyle: const HeaderStyle(
                            titleTextStyle: TextStyle(
                                color: AppColor.skyBlue,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            formatButtonVisible: false,
                            titleCentered: true,
                            leftChevronIcon: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                              color: AppColor.black,
                            ),
                            rightChevronIcon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: AppColor.black,
                            ),
                          ),
                          calendarStyle: const CalendarStyle(
                            defaultTextStyle: TextStyle(fontFamily: 'Roboto',color: AppColor.black),
                            disabledTextStyle: TextStyle(fontFamily: 'Roboto',color: AppColor.skyBlue),

                          ),
                          focusedDay: _focusedDay,
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                          selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDate, selectedDay)){
                              print('selectedDay${DateFormat('dd MMM yy').format(selectedDay)}');
                              _date.text = DateFormat('dd MMM yy').format(selectedDay);
                              setState(() {
                                _selectedDate = selectedDay;
                                _focusedDay = focusedDay;
                                // update `_focusedDay` here as well
                              });
                            }
                          },
                        ),
                      ) :const SizedBox(),
                      Custom_botton(context, text:'SAVE', onTap: () {
                          Navigator.pop(context);
                      }, height: screenHeight(context,dividedBy: 20),)
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
