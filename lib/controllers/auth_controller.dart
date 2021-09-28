import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_api/models/user_model.dart';
import 'package:ecommerce_api/screens/mobile_screeens/home_screen_user.dart';
import 'package:ecommerce_api/screens/windows/dashboard_over_view_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../const.dart';

class AuthController extends GetxController {
  UserModel newUser = UserModel();
  String? password;
  String? confirmPassword;
  UserModel currentUser = UserModel();
  List<UserModel> allUser = [];
  File? fileProfilePic;
  String? profileImage;
  bool loading = false;
  String? OTP;

  // signUpUser() async {
  //   loading = true;
  //   update();
  //   await uploadImage();
  //
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json'
  //   };
  //   var url = Uri.parse('http://10.0.0.5:1337/auth/local/register');
  //
  //   var response = await http
  //       .post(url,
  //           headers: headers,
  //           body: json.encode({
  //             "username": "${newUser.username}",
  //             "email": "${newUser.email}",
  //             "password": "${newUser.password}",
  //             "phone": "${newUser.phone}",
  //             "profilePic": "${newUser.profilePic}",
  //             "typeOfUser": "user",
  //             "department": "${newUser.department}",
  //             "profileCompleted": true,
  //           }))
  //       .then(
  //     (value) {
  //       print('done');
  //       Get.offAll(() => HomeStudentScreen());
  //     },
  //   );
  //   loading = false;
  //   update();
  // }

  signInUser() async {
    loading = true;
    update();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$URL/auth/local'));
    request.body =
        json.encode({"identifier": newUser.email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getCurrentUser(newUser.email!);
      // Get.offAll(()=>HomeScreenUser());
      Get.offAll(() => DashboardOverViewScreen());
    } else {
      print(response.reasonPhrase);
    }
    loading = false;
    update();
  }

  // signOutUser(){
  //   currentUser =  UserModel();
  //   Get.offAll(()=>LoginScreen());
  // }

  // sendOTP()async{
  //   EmailAuth.sessionName = "New user";
  //   var res = await EmailAuth.sendOtp(receiverMail: newUser.email!);
  //   if(res){
  //     print("send");
  //   }else{
  //     print("problem");
  //   }
  // }

  // verifyOTP(){
  //   var res = EmailAuth.validate(receiverMail: newUser.email!, userOTP: OTP!);
  //   if(res){
  //     Get.offAll(()=>CompleteProfileScreen());
  //   }else{
  //     Get.snackbar('رسالة', 'الكود خطأ حاول مجددا');
  //   }
  // }

  // uploadImage() async {
  //   var request =
  //   http.MultipartRequest('POST', Uri.parse('$URl/upload'));
  //   request.files
  //       .add(await http.MultipartFile.fromPath('files', profileImage!));
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     var jsonDataForUploadFile =
  //     jsonDecode(await response.stream.bytesToString());
  //     newUser.profilePic = jsonDataForUploadFile[0]["formats"]["large"]["url"];
  //     print(newUser.profilePic);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  //   update();
  // }

  getAllUser() async {
    final response = await http.get(Uri.parse('$URL/users'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      allUser.clear();
      for (var item in jsonData) {
        allUser.add(UserModel.fromJson(item));
      }
    } else {
      print('data');
    }
  }

  getCurrentUser(String email) async {
    await getAllUser();
    print(allUser.length);

    for (var i in allUser) {
      if (i.email == email) {
        currentUser = i;
        break;
      }
    }
    update();
  }

  Future pickedSingleImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fileProfilePic = File(pickedFile.path);
      profileImage = fileProfilePic
          .toString()
          .substring(7, fileProfilePic.toString().length - 1);
      print(profileImage);
    } else {
      print('No image selected.');
    }
    update();
  }
}
