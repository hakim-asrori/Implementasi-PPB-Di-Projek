// To parse this JSON data, do
//
//     final userAfterLogin = userAfterLoginFromJson(jsonString);

import 'dart:convert';

UserAfterLogin userAfterLoginFromJson(String str) => UserAfterLogin.fromJson(json.decode(str));

String userAfterLoginToJson(UserAfterLogin data) => json.encode(data.toJson());

class UserAfterLogin {
    UserAfterLogin({
        this.nama,
        this.email,
        this.alamat,
        this.gambar,
        this.tempatLahir,
        this.tanggalLahir,
        this.hakAkses,
        this.token,
    });

    String? nama;
    String? email;
    String? alamat;
    String? gambar;
    String? tempatLahir;
    DateTime? tanggalLahir;
    String? hakAkses;
    String? token;

    factory UserAfterLogin.fromJson(Map<String, dynamic> json) => UserAfterLogin(
        nama: json["nama"],
        email: json["email"],
        alamat: json["alamat"],
        gambar: json["gambar"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        hakAkses: json["hak_akses"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "gambar": gambar,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "hak_akses": hakAkses,
        "token": token,
    };
}
