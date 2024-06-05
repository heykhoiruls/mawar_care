import 'package:flutter/material.dart';

import '../controllers/controller_immunization.dart';
import '../controllers/controller_growth.dart';
import '../controllers/controller_user.dart';
import '../controllers/controller_kid.dart';
import '../models/model_controller.dart';
import '../models/model_list.dart';

// default size
const double defaultSize = 16;
const double defaultRadius = 12;

// color palette - light mode
const Color colorPrimary = Color(0xFF628265);
const Color colorSecondary = Color(0xFFA4BE7B);
const Color colorBackground = Color(0xFFE8E8E8);
const Color colorAccent = Color(0xFFD9D9D9);
const Color colorBlack = Color(0xFF3C4048);
const Color colorRed = Color(0xFFD24545);
const Color colorTextAccent = Color(0xFF000000);
const Color colorBar = Color(0xFFE8E8E8);

// model

ModelController user = ModelController();
ModelList list = ModelList();

// controller
ControllerKid controllerKid = ControllerKid();
ControllerUser controllerUser = ControllerUser();
ControllerGrowth controllerGrowth = ControllerGrowth();
ControllerImmunization controllerImmun = ControllerImmunization();

// image default
const String imagePhotoBoy = "https://bit.ly/photo-profile-boy";
const String imagePhotoGirl = "https://bit.ly/photo-profile-girl";
const String imageEmailVerification = "assets/page_email_verification.svg";
const String imageForgotPassword = "assets/page_forgot_password.svg";
const String imagePageChatEmpty = "assets/page_chat_empty.svg";
const String imagePageHomeEmpty = "assets/page_home_empty.svg";
const String imagePageKidsEmpty = "assets/page_kids_empty.svg";
const String imageChooseRole = "assets/page_choose_role.svg";
const String imageDelete = "assets/page_delete.svg";
const String imageLogout = "assets/page_logout.svg";

String imagePhotoProfile(String currentUserId) {
  return 'https://firebasestorage.googleapis.com/v0/b/mawar-care.appspot.com/o/$currentUserId.jpg?alt=media&token=36d3d579-ce2a-426b-a44c-9f5daf1639e4';
}

// message
const String messageAuthinvalid = "Kredensial otentikasi yang diberikan salah.";
const String messageDeleteKids = "Apakah Anda yakin ingin menghapus anak ini ?";
const String messageSignOut = "Apakah Anda yakin ingin keluar dari aplikasi ?";
const String messageAuthError = "Ups, terdapat kesalahan. Coba ulangi lagi.";
const String messagPassAlert = "Kata sandi setidaknya mempunyai enam karakter.";
const String messageEmailInvalid = "Email tidak sesuai dengan format.";
const String messageImageEmpty = "Tidak ada Image yang dipilih.";
const String messageEmailAlreadyUse = "Email sudah digunakan.";
const String messageSignInWithGoogleCancelled =
    "Masuk dengan Google, dibatalkan.";
const String messageDefault = "Tidak ada data";
const String messageMustEntry = "Semua data harus diisi.";
const String messageMinimunChars = "Setidaknya mempunyai tiga karakter.";
const String messageNoInternet = "Koneksi internet anda terputus.";
const String messageEmailAndPasswordEmpty =
    "Email dan kata sandi tidak boleh kosong.";
const String messageEmailVerification =
    "Harap aktifkan akun Anda dengan mengklik tautan di email untuk memulai.";
const String messagePageChatEmpty =
    "Tidak ada percakapan. Silahkan  ketik pesan untuk memulai percakapan baru.";
const String messageForgotPassword =
    "Masukkan email dan kami akan mengirimkan tautan untuk mereset kata sandi Anda.";
const String messageChooseRole =
    "Lengkapi informasi pribadi dengan memilih jenis kelamin dan peran Anda.";
const String messageHomeEmptyForParent =
    "Saat ini, tidak ada data anak. Klik  tambah untuk menambahkan data anak.";
const String messageHomeEmptyForOthers =
    "Saat ini, tidak ada data anak. Silahkan hubungi orang tua untuk menambah data anak mereka.";
const String messageKidsDataEmptyForOthers =
    "Tidak ada catatan. Klik tombol tambah untuk membuat catatan baru.";
const String messageDeleteRecords =
    "Apakah Anda yakin ingin menghapus catatan ini ?";
const String messageKidsEmpty =
    "Maaf, nama anak yang Anda cari tidak ditemukan dalam daftar.";
const String messageChatEmpty =
    "Saat ini, tidak ada data pengguna tersedia. Silahkan  undang orang lain untuk bergabung";
const String messageKidsDataEmptyForParent =
    "Data catatan gizi anak tidak tersedia. Harap hubungi Pengurus atau Bidan Posyandu.";

// function
void Function(BuildContext)? popContext = (context) {
  Navigator.pop(context);
};

class LineDeviderVertical extends StatelessWidget {
  final double lineHeight;
  final Color? colorChoose;
  const LineDeviderVertical({
    required this.lineHeight,
    this.colorChoose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: lineHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: colorChoose ?? colorBackground,
      ),
    );
  }
}

class LineDeviderHorizontal extends StatelessWidget {
  final double lineWidth;
  final Color? colorChoose;
  const LineDeviderHorizontal({
    required this.lineWidth,
    this.colorChoose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: lineWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: colorChoose ?? colorBackground,
      ),
    );
  }
}
