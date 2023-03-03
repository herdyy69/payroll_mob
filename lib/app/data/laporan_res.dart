class LaporanRes {
  String? success;
  String? message;
  List<Data>? data;

  LaporanRes({this.success, this.message, this.data});

  LaporanRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? nik;
  String? nama;
  String? tanggalLaporan;
  String? kodeLaporan;

  Data({this.nik, this.nama, this.tanggalLaporan, this.kodeLaporan});

  Data.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    tanggalLaporan = json['tanggal_laporan'];
    kodeLaporan = json['kode_laporan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['tanggal_laporan'] = this.tanggalLaporan;
    data['kode_laporan'] = this.kodeLaporan;
    return data;
  }
}
