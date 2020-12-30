import 'package:meta/meta.dart' show required;

class NotificationModel {
  final String fechaCita;
  final String notas;

  NotificationModel({
    @required this.fechaCita, 
    @required this.notas}
  );

  static NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      fechaCita: json['FechaCita'],
      notas: json['Notas']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FechaCita'] = this.fechaCita;
    data['Notas'] = this.notas;
    return data;
  }
}