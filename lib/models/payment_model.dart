
class Payment {
  String code;
  String response;

  Payment({this.code, this.response});

  Payment.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['response'] = this.response;
    return data;
  }
}