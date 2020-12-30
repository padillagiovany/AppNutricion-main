class NotificationModel {
  String fechaCita;
  String notas;

  NotificationModel({
    this.fechaCita, 
    this.notas}
  );

  NotificationModel.fromJson(Map<String, dynamic> json) {
    fechaCita = json['FechaCita'];
    notas = json['Notas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FechaCita'] = this.fechaCita;
    data['Notas'] = this.notas;
    return data;
  }
}