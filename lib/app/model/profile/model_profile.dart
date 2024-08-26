class Profile {
  int? id;
  String nama;
  String tanggalLahir;
  String gender;
  String email;
  String number;
  String pendidikan;
  String status;
  String pathImage;
  String namaUsaha;
  String alamatUsaha;
  String jabatan;
  String lamaBekerja;
  String sumberPendapatan;
  String pendapatanKotorPerTahun;
  String namaBank;
  String cabangBank;
  String nomorRekening;
  String namaPemilikRekening;
  String nik;
  String alamatKTP;
  String provinsi;
  String kotaKabupaten;
  String kecamatan;
  String kelurahan;
  String kodePos;

  Profile({
    this.id,
    required this.nama,
    required this.tanggalLahir,
    required this.gender,
    required this.email,
    required this.number,
    required this.pendidikan,
    required this.status,
    required this.pathImage,
    required this.namaUsaha,
    required this.alamatUsaha,
    required this.jabatan,
    required this.lamaBekerja,
    required this.sumberPendapatan,
    required this.pendapatanKotorPerTahun,
    required this.namaBank,
    required this.cabangBank,
    required this.nomorRekening,
    required this.namaPemilikRekening,
    required this.nik,
    required this.alamatKTP,
    required this.provinsi,
    required this.kotaKabupaten,
    required this.kecamatan,
    required this.kelurahan,
    required this.kodePos,
  });

  // Convert a Profile into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'tanggalLahir': tanggalLahir,
      'gender': gender,
      'email': email,
      'number': number,
      'pendidikan': pendidikan,
      'status': status,
      'pathImage': pathImage,
      'namaUsaha': namaUsaha,
      'alamatUsaha': alamatUsaha,
      'jabatan': jabatan,
      'lamaBekerja': lamaBekerja,
      'sumberPendapatan': sumberPendapatan,
      'pendapatanKotorPerTahun': pendapatanKotorPerTahun,
      'namaBank': namaBank,
      'cabangBank': cabangBank,
      'nomorRekening': nomorRekening,
      'namaPemilikRekening': namaPemilikRekening,
      'nik': nik,
      'alamatKTP': alamatKTP,
      'provinsi': provinsi,
      'kotaKabupaten': kotaKabupaten,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'kodePos': kodePos,
    };
  }

  // Convert a Map into a Profile.
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      nama: map['nama'],
      tanggalLahir: map['tanggalLahir'],
      gender: map['gender'],
      email: map['email'],
      number: map['number'],
      pendidikan: map['pendidikan'],
      status: map['status'],
      pathImage: map['pathImage'],
      namaUsaha: map['namaUsaha'],
      alamatUsaha: map['alamatUsaha'],
      jabatan: map['jabatan'],
      lamaBekerja: map['lamaBekerja'],
      sumberPendapatan: map['sumberPendapatan'],
      pendapatanKotorPerTahun: map['pendapatanKotorPerTahun'],
      namaBank: map['namaBank'],
      cabangBank: map['cabangBank'],
      nomorRekening: map['nomorRekening'],
      namaPemilikRekening: map['namaPemilikRekening'],
      nik: map['nik'],
      alamatKTP: map['alamatKTP'],
      provinsi: map['provinsi'],
      kotaKabupaten: map['kotaKabupaten'],
      kecamatan: map['kecamatan'],
      kelurahan: map['kelurahan'],
      kodePos: map['kodePos'],
    );
  }
}
