import 'package:flutter/material.dart';

const Color kWhite = Color(0xffffffff);
const Color kRoyalBlue = Color(0xff5169fe);
const Color kHaiti = Color(0xff0b102c);
const Color kBunting = Color(0xff0e1639);
const Color kGovernorBay = Color(0xff2c349c);
const Color kChambray = Color(0xff2d3b98);
const Color kBigStone = Color(0xff1a2444);
// const Color bayOfMany = Color(0xff2a368c) ;
// const Color portGore =  Color(0xff242659);
// // const Color cloudBurst= Color(0xff1b2252);
const chatLogo = 'assets/images/chat_logo.png';
const kMessagesCollection = 'messages';
const kMessage = 'message'; //firestore API
const kId = 'id'; //firestore API
const kCreatedAt = 'createdAt';
const kLoginScreen= 'LoginScreen';
const kRegisterScreen= 'RegisterScreen';
const kHomeScreen= 'HomeScreen';
const kDetailedScreen= 'DetailedScreen';
const kUpdateScreen= 'kUpdateScreen';
List <PopupMenuEntry<String>> popUpMenuItems = [
  const PopupMenuItem<String>(
    value: 'New group',
    child: Text('New group',
    style:  TextStyle(
      color: kWhite,
    ),),
  ),
  const PopupMenuItem<String>(
    value: 'New broadcast',
    child: Text('New broadcast',
      style:  TextStyle(
        color: kWhite,
      ),),
  ),
  const PopupMenuItem<String>(
    value: 'Linked devices',
    child: Text('Linked devices',
      style:  TextStyle(
        color: kWhite,
      ),),
  ),
  const PopupMenuItem<String>(
    value: 'Stared messages',
    child: Text('Stared messages',
      style:  TextStyle(
        color: kWhite,
      ),),
  ),
  const PopupMenuItem<String>(
    value: 'Settings',
    child: Text('Settings',
      style:  TextStyle(
        color: kWhite,
      ),),
  ),
];