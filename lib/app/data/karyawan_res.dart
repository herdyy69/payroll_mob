class KaryawanRes {
  String? success;
  String? message;
  List<Data>? data;

  KaryawanRes({this.success, this.message, this.data});

  KaryawanRes.fromJson(Map<String, dynamic> json) {
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
  String? pegawai;
  String? namaPegawai;
  String? nik;
  String? foto;
  String? jabatanId;
  String? statusId;

  Data(
      {this.pegawai,
      this.namaPegawai,
      this.nik,
      this.foto,
      this.jabatanId,
      this.statusId});

  Data.fromJson(Map<String, dynamic> json) {
    pegawai = json['pegawai'];
    namaPegawai = json['nama_pegawai'];
    nik = json['nik'];
    foto = json['foto'];
    jabatanId = json['jabatan_id'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pegawai'] = this.pegawai;
    data['nama_pegawai'] = this.namaPegawai;
    data['nik'] = this.nik;
    data['foto'] = this.foto;
    data['jabatan_id'] = this.jabatanId;
    data['status_id'] = this.statusId;
    return data;
  }
}
