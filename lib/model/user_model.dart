class UserModel{
  String? name;
  String? nickname;
  String? phone;
  String? address;

  UserModel({
    required this.name,
    required this.nickname,
    required this.phone,
    required this.address
});

  factory UserModel.fromJson(Map data){
    return UserModel(name: data['name'], nickname: data['nickname'], phone: data['phone'], address: data['address']);
  }

  Map<String, String> toJson(){
    return {
      "name" : name ?? "",
      "nickname" : nickname ?? "",
      "phone" : phone ?? "",
      "address" : address ?? ""
    };
  }
}