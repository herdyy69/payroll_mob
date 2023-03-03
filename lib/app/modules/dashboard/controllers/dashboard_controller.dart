import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payroll_mob/app/data/karyawan_res.dart';
import 'package:payroll_mob/app/data/laporan_res.dart';

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

  // var dataEmployee = ''.obs;
  // var isLoading = true.obs;
  // var lengthEmployee = 0.obs;

  // Future getEmployee() async {
  //   final response =
  //       await http.get(Uri.parse('http://127.0.0.1:8000/api/employee-flutter'));
  //   final jsonResponse = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     dataEmployee.value = jsonResponse.toString();
  //     lengthEmployee.value = jsonResponse['data'].length;
  //     isLoading.value = false;
  //     print(lengthEmployee.value);
  //     // unpack data from array
  //     for (var i = 0; i < lengthEmployee.value; i++) {
  //       print(jsonResponse['data'][i]['nama_pegawai']);
  //     }

  //     print(jsonResponse);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future<KaryawanRes> getKaryawan() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/employee-flutter'));
    // print(response.body);
    return KaryawanRes.fromJson(jsonDecode(response.body));
  }

  Future<LaporanRes> getLaporan() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/laporan-flutter'));
    // print(response.body);
    return LaporanRes.fromJson(jsonDecode(response.body));
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
