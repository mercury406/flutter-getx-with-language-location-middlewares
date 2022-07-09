class TimeModelRemote {
  TimeModelRemote({
    required this.id,
    required this.cityId,
    required this.date,
    required this.qamarDate,
    required this.tong,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom,
    required this.hufton,
  });
  late final int id;
  late final int cityId;
  late final String date;
  late final String qamarDate;
  late final String tong;
  late final String quyosh;
  late final String peshin;
  late final String asr;
  late final String shom;
  late final String hufton;

  TimeModelRemote.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cityId = json['city_id'];
    date = json['date'];
    qamarDate = json['qamar_date'];
    tong = json['tong'];
    quyosh = json['quyosh'];
    peshin = json['peshin'];
    asr = json['asr'];
    shom = json['shom'];
    hufton = json['hufton'];
  }

}