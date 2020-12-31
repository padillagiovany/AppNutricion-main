import 'package:meta/meta.dart' show required;

class NotificationModel {
  final String fechaCita;
  final String horaNotificacion;
  final String notas;

  NotificationModel({
    @required this.fechaCita,
    @required this.horaNotificacion,
    @required this.notas}
  );

  static NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      fechaCita: json['FechaCita'],
      horaNotificacion: json['horaNotificacion'],
      notas: json['Notas']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FechaCita'] = this.fechaCita;
    data['horaNotificacion'] = this.horaNotificacion;
    data['Notas'] = this.notas;
    return data;
  }
}