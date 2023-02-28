import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../../../data/entertainment_response.dart';
import '../../../data/headline_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/technology_response.dart';
import '../../../utils/api.dart';

class DashboardController extends GetxController {
  final count = 0.obs;
  final _getConnect = GetConnect();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //fungsi untuk mengambil headline dari server
  Future<HeadlineResponse> getHeadline() async {
    //memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
    final response = await _getConnect.get(BaseUrl.headline);
    //mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
    return HeadlineResponse.fromJson(jsonDecode(response.body));
  }

  //fungsi untuk mengambil headline dari server
  Future<EntertainmentResponse> getEntertainment() async {
    //memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
    final response = await _getConnect.get(BaseUrl.headline);
    //mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
    return EntertainmentResponse.fromJson(jsonDecode(response.body));
  }

//fungsi untuk mengambil headline dari server
  Future<SportsResponse> getSports() async {
    //memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
    final response = await _getConnect.get(BaseUrl.headline);
    //mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
    return SportsResponse.fromJson(jsonDecode(response.body));
  }

//fungsi untuk mengambil headline dari server
  Future<TechnologyResponse> getTechnology() async {
    //memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
    final response = await _getConnect.get(BaseUrl.headline);
    //mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
    return TechnologyResponse.fromJson(jsonDecode(response.body));
  }

  void increment() => count.value++;
}
