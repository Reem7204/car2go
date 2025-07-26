import 'dart:convert';
import 'package:car2go/model/carModel.dart';
import 'package:http/http.dart';
import 'api_client.dart';

class CarRepository {
  ApiClient apiClient = ApiClient();
    var body = {};
  Future<MapModel> getCarDetails() async {
    String url = 'https://booking-com-api5.p.rapidapi.com/car/avaliable-car?pickup_latitude=-6.237034797668457&pickup_longtitude=106.74897003173828&pickup_date=2025-08-10&pickup_time=10%3A00%3A00&dropoff_latitude=-6.249514102935791&dropoff_longtitude=107.02458190917969&drop_date=2025-08-20&drop_time=12%3A00%3A00&languagecode=id&driver_age=30&currency_code=USD';
    Response response = await apiClient.invokeAPI(url, 'GET',body);
    return MapModel.fromJson(jsonDecode(response.body));
  }
}