class UserDetailsModel {
  List<Data>? data;

  UserDetailsModel({this.data});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? age;
  String? designation;

  Data({this.name, this.age, this.designation});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['designation'] = this.designation;
    return data;
  }
}