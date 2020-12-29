import 'package:meta/meta.dart' show required;

class LoginPaciente {
  String nombre;
  String apaterno;
  String amaterno;
  String email;
  String telefono;
  String nacimiento;
  String acceso;

  LoginPaciente(
    {
      @required this.nombre,
      @required this.apaterno,
      @required this.amaterno,
      @required this.email,
      @required this.telefono,
      @required this.nacimiento,
      @required this.acceso
    }
  );

  LoginPaciente.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apaterno = json['apaterno'];
    amaterno = json['amaterno'];
    email = json['email'];
    telefono = json['telefono'];
    nacimiento = json['nacimiento'];
    acceso = json['acceso'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['nombre'] = this.nombre;
  //   data['apaterno'] = this.apaterno;
  //   data['amaterno'] = this.amaterno;
  //   data['email'] = this.email;
  //   data['telefono'] = this.telefono;
  //   data['nacimiento'] = this.nacimiento;
  //   data['acceso'] = this.acceso;
  //   return data;
  // }
}