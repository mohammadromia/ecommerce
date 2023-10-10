// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel{
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserModel(this.name,this.email,this.token,this.phone,this.image);

  UserModel.fromJson({required Map<String,dynamic> data}){
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'token' : token,
      'image' : image,
    };
  }

}


