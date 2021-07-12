import 'package:api_v2/rockets/model/ModelRockets.dart';
import 'package:dio/dio.dart';

class APIRequests{
  Dio dio;
  BaseOptions options=BaseOptions(baseUrl:"https://api.spacexdata.com/v4/",);
  APIRequests(){
    dio=Dio(options);
  }

  Future<List<ModelRockets>> rocketAPI()async{
    Response response=await  dio.get("rockets");
     List<ModelRockets> rockets=[];
     for(var item in response.data){
       rockets.add(ModelRockets.fromAPI(item));
     }
     return rockets;
  }
}