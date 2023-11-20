class User {
  String day;
  //String age;
  int waterMeter;
  

  User.fromJson(Map<String, dynamic> json)
      : day = json['name'],
        //age = json['age'],
        waterMeter = json['location'];

  Map<String, dynamic> toJson() => {
    'name': day,
    //'age': age,
    'location': waterMeter,
  };
}