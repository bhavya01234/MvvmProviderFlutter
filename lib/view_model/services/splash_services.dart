
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices{
  Future <UserModel> getUserData() => UserViewModel().getUser();



  void checkAuthentication(BuildContext context)async{

  //   SessionController().getUserFromPreference().then((value)async{
  //
  //     if(SessionController().isLogin!){
  //       Timer(const Duration(seconds: 2),
  //             () =>
  //             Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false),
  //       );
  //     }else {
  //       Timer(const Duration(seconds: 2),
  //             () =>
  //             Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
  //       );
  //
  //     }
  //
  //   }).onError((error, stackTrace){
  //
  //     Timer(const Duration(seconds: 2),
  //           () =>
  //           Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
  //     );
  //
  //   });
  //
      getUserData().then((value) async{
        print(value.token);
        if(value.token=='null' || value.token==''){
          await Future.delayed(Duration(seconds: 3));
          Navigator.pushNamed(context, RoutesName.login);
        }
        else{
          await Future.delayed(Duration(seconds: 3));
          Navigator.pushNamed(context, RoutesName.home);
        }
      }).onError((error, stackTrace) {
        if(kDebugMode){
          print(error.toString());
        }
      });

  }
}