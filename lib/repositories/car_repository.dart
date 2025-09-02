import 'dart:convert';
import 'package:car2go/model/carModel.dart';
import 'package:car2go/model/loginModel.dart';
import 'package:car2go/model/rentOrder.dart';
import 'package:car2go/model/signUpModel.dart';
import 'package:http/http.dart';
import 'api_client.dart';

class CarRepository {
  ApiClient apiClient = ApiClient();
  var body = {};
  Future<List<MapModel>> getCarDetails() async {
    String url = 'http://45.159.221.50:8868/api/get-vehicles';
    Response response = await apiClient.invokeAPI(url, 'GET', body);
    return MapModel.listFromJson(jsonDecode(response.body));
  }

  Future<List<MapModel>> getBuyCarDetails() async {
    String url = 'http://45.159.221.50:8868/api/get-buyvehicles';
    Response response = await apiClient.invokeAPI(url, 'GET', body);
    return MapModel.listFromJson(jsonDecode(response.body));
  }

  Future<LoginModel> signIn(String email, String password) async {
    String url = "http://45.159.221.50:8868/api/signin";
    var body = {
      "email": email,
      "password": password,
      "fcmToken":
          "efL99FWpQxSyYuxFsnYea5:APA91bHG1IJGLwA5YasYZKy9x8JMJl1bY9e8lne_8dHUbDc40tVoUIej8VJ3e2a2uJzLnQGTbVdbo4dnT575FAo5ESAkr4sPXDDrTd42-7pwRq7l0niQi69AYm2Mn26pahLDXk1nZNfo",
    };
    Response response = await apiClient.invokeAPI(
      url,
      "POST",
      jsonEncode(body),
    );
    return LoginModel.fromJson(jsonDecode(response.body));
  }

  Future<SignUpModel> signUp(
    String fullName,
    String email,
    String phone,
    String password,
  ) async {
    String url = "http://45.159.221.50:8868/api/signup";
    var body = {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "password": password,
    };
    Response response = await apiClient.invokeAPI(
      url,
      "POST",
      jsonEncode(body),
    );
    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignUpModel.fromJson(data);
    } else {
      // throw error message so Bloc can catch it
      throw Exception(data['message'] ?? 'Something went wrong');
    }
  }

  Future<RentOrder> postCreateRentOrder(
    String vehicle,
    String user,
    String pickupDate,
    String returnDate,
    String pickupLocation,
    String returnLocation,
    int amount
  ) async {
    String url = 'http://45.159.221.50:8868/api/create-rent-order';
    var body = {
      "vehicle": vehicle,
      "user": user,
      "pickupDate": pickupDate,
      "returnDate": returnDate,
      "pickupLocation": pickupLocation,
      "returnLocation": returnLocation,
      "amount": amount,
    };
    Response response = await apiClient.invokeAPI(url, 'POST', jsonEncode(body));
    print(response.body);
    return RentOrder.fromJson(jsonDecode(response.body));
  }
}
