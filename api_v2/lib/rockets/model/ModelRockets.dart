class ModelRockets{
  String _name;
  String _type;
  String _company;
  String _description;
  bool _active;
  String _country;
  ModelRockets.fromAPI(dynamic json){
   _name= json["name"];
   _type= json["type"];
   _company= json["company"];
   _description= json["description"];
   _active= json["active"];
   _country= json["country"];
  }

  String get country => _country;

  bool get active => _active;

  String get description => _description;

  String get company => _company;

  String get type => _type;

  String get name => _name;
}