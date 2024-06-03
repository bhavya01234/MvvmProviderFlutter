import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
      return response;
    }catch(e){
      throw e;
    }
  }


  Future<dynamic> signupApiFunction(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}