import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:samble_registrasi/data/models/request/register_request_model.dart';
import 'package:samble_registrasi/data/models/response/register_response_model.dart';

class AuthDatasource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
      Uri.parse('localhost:8000/api/access/register'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      return const Left("gagal terbentuk!");
    }
  }
}
