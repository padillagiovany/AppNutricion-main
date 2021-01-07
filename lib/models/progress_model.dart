class PacienteProgreso {
  String peso;
  String cintura;
  String cadera;
  String brazo;
  String imc;
  String grasa;
  String musculo;
  String fechaProgreso;

  PacienteProgreso(
      {this.peso,
      this.cintura,
      this.cadera,
      this.brazo,
      this.imc,
      this.grasa,
      this.musculo,
      this.fechaProgreso}
  );

  static PacienteProgreso fromJson(Map<String, dynamic> json) {
    return PacienteProgreso(
      peso : json['peso'],
      cintura : json['cintura'],
      cadera : json['cadera'],
      brazo : json['brazo'],
      imc : json['imc'],
      grasa : json['grasa'],
      musculo : json['musculo'],
      fechaProgreso : json['fechaProgreso']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['peso'] = this.peso;
    data['cintura'] = this.cintura;
    data['cadera'] = this.cadera;
    data['brazo'] = this.brazo;
    data['imc'] = this.imc;
    data['grasa'] = this.grasa;
    data['musculo'] = this.musculo;
    data['fechaProgreso'] = this.fechaProgreso;
    return data;
  }
}
