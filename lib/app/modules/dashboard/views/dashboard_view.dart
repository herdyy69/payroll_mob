import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:payroll_mob/app/data/karyawan_res.dart';
import 'package:payroll_mob/app/data/laporan_res.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/headline_response.dart';
import '../../../data/technology_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/entertainment_response.dart';
import '../../home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

final auth = GetStorage();

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    final ScrollController scrollController = ScrollController();
    // Mendefinisikan sebuah widget bernama build dengan tipe StatelessWidget yang memerlukan BuildContext.
    return SafeArea(
      // Widget SafeArea menempatkan semua konten widget ke dalam area yang aman (safe area) dari layar.
      child: DefaultTabController(
        length: 3,
        // Widget DefaultTabController digunakan untuk mengatur tab di aplikasi.
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await auth.erase();
              Get.offAll(() => const HomeView());
            },
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.logout_rounded),
          ),

          // Widget Scaffold digunakan sebagai struktur dasar aplikasi.
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            // Widget PreferredSize digunakan untuk menyesuaikan tinggi appBar.
            child: Column(
              // Widget Column adalah widget yang menyatukan widget-childnya secara vertikal.
              children: [
                ListTile(
                  // Widget ListTile digunakan untuk menampilkan tampilan list sederhana.
                  title: Text(
                    auth.read('full_name').toString(),

                    textAlign: TextAlign.end,
                    // Properti textAlign digunakan untuk menentukan perataan teks.
                  ),
                  subtitle: Text(
                    auth.read('email').toString(),
                    textAlign: TextAlign.end,
                  ),
                  trailing: Container(
                      // Widget Container digunakan untuk mengatur tampilan konten dalam kotak.
                      margin: const EdgeInsets.only(right: 10),
                      // Properti margin digunakan untuk menentukan jarak dari tepi kontainer ke tepi widget yang di dalamnya.
                      width: 50.0,
                      height: 50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            100), // Set the border radius to a large value to make it fully rounded
                        child: Image.network(
                          'https://i.ibb.co/ccZBJ2y/Klwe0u-AK-400x400.png',
                          // fit: BoxFit.cover,
                        ),
                      )),
                ),
                const Align(
                  // Widget Align digunakan untuk menempatkan widget pada posisi tertentu di dalam widget induk.
                  alignment: Alignment.topLeft,
                  // Properti alignment digunakan untuk menentukan letak widget di dalam widget induk.
                  child: TabBar(
                    // Widget TabBar digunakan untuk menampilkan tab di aplikasi.
                    labelColor: Colors.black,
                    // Properti labelColor digunakan untuk menentukan warna teks tab yang dipilih.
                    indicatorSize: TabBarIndicatorSize.label,
                    // Properti indicatorSize digunakan untuk menentukan ukuran indikator tab yang dipilih.
                    isScrollable: true,
                    // Properti isScrollable digunakan untuk menentukan apakah tab dapat di-scroll atau tidak.
                    indicatorColor: Colors.white,
                    // Properti indicatorColor digunakan untuk menentukan warna indikator tab yang dipilih.
                    tabs: [
                      // Properti tabs digunakan untuk menentukan teks yang akan ditampilkan pada masing-masing tab.
                      Tab(text: "Karyawan"),
                      Tab(text: "Riwayat Laporan"),
                      Tab(text: "Tentang Saya"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            // Widget TabBarView digunakan untuk menampilkan konten yang terkait dengan masing-masing tab.
            children: [
              // Properti children digunakan untuk menentukan konten yang akan ditampilkan pada masing-masing tab.
              karyawan(controller, scrollController),
              laporan(controller, scrollController),
              portfolio(controller, scrollController),
            ],
          ),
        ),
      ),
    );
  }

  portfolio(DashboardController controller, ScrollController scrollController) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 800,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Image.network(
                  'https://i.ibb.co/ZWNtmFV/20221104-154223.jpg',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
                height: 10,
                child: Divider(
                  color: Colors.black,
                )),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Herdyansah, an 18-year-old with a passion for music and IT. He enjoys playing the guitar and has developed a wide range of skills in the field of technology. His expertise includes networking, programming, web development, and multimedia. Despite his young age, Herdyansah shows great potential in both fields and strives to continuously develop his creativity and knowledge.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Social Media',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // ignore: deprecated_member_use
                launch('https://www.facebook.com/herdyy69/');
              },
              child: Row(
                children: const [
                  Icon(Icons.facebook),
                  SizedBox(width: 10),
                  Text(
                    'Herdyansah',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // ignore: deprecated_member_use
                launch('https://www.instagram.com/herdyy69/');
              },
              child: Row(
                children: const [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Text(
                    'herdyansah203@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<KaryawanRes> karyawan(
      DashboardController controller, ScrollController scrollController) {
    return FutureBuilder<KaryawanRes>(
      future: controller.getKaryawan(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
              width: 100,
              height: 100,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error'),
          );
        } else {
          return ListView.builder(
            controller: scrollController,
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    top: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 8,
                  right: 8,
                  bottom: 5,
                ),
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 8,
                  right: 8,
                  bottom: 5,
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          snapshot.data!.data![index].namaPegawai.toString()),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: const EdgeInsets.only(left: 10, top: 3),
                        child: Text(
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            snapshot.data!.data![index].pegawai.toString()),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(snapshot.data!.data![index].nik.toString()),
                          const SizedBox(width: 10),
                        ],
                      ),
                      Text(
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          snapshot.data!.data![index].jabatanId.toString() +
                              ' - ' +
                              snapshot.data!.data![index].statusId.toString()),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('http://localhost:8000/' +
                        snapshot.data!.data![index].foto.toString()),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

FutureBuilder<LaporanRes> laporan(
    DashboardController controller, ScrollController scrollController) {
  return FutureBuilder<LaporanRes>(
    future: controller.getLaporan(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.network(
            'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
            width: 100,
            height: 100,
          ),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error'),
        );
      } else {
        return ListView.builder(
          controller: scrollController,
          itemCount: snapshot.data!.data!.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 5,
              ),
              margin: const EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 5,
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(snapshot.data!.data![index].nama.toString()),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.only(left: 10, top: 3),
                      child: Text(
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          snapshot.data!.data![index].kodeLaporan.toString()),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            snapshot.data!.data![index].nik.toString()),
                        const SizedBox(width: 10),
                      ],
                    ),
                    Text(
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        snapshot.data!.data![index].tanggalLaporan.toString()),
                  ],
                ),
              ),
            );
          },
        );
      }
    },
  );
}
