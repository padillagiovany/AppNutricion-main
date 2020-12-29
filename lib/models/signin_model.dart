import 'package:meta/meta.dart' show required;

class SigninPaciente {
  String code;
  String response;

  SigninPaciente({
    @required this.code, 
    @required this.response
    });

  SigninPaciente.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    response = json['response'];
  }
  

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['code'] = this.code;
  //   data['response'] = this.response;
  //   return data;
  // }
}