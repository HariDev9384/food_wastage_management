class DB{
  
  var email;
  var dob;
  var mobil_no,user_name,user_pass,full_name,role;
  DB({required this.full_name,required this.email,required this.dob,required this.mobil_no, required this.role, required this.user_name, required this.user_pass});
      Map<String, dynamic> toJson(){
                return{
                  'FullName': full_name,
                  'UserName': user_name,
                  'Mobile Number' : mobil_no,
                  'Email': email,
                  'User Password':user_pass,
                  'Role': role,
                  'Date of Birth': dob
                };
      }
    factory DB.fromJson(Map<String,dynamic> json){
      if (json == null) {
      throw AssertionError('data must not be null');
    }
      return(
        DB(
          full_name: json['restaurant name'],
           email: json['gmail'], 
           dob: json['Date of Birth'],
           mobil_no: json['Mobile Number'],
           role: json['role'],
           user_name: json['User Name'],
           user_pass: json['User Password']
          )
      );
    }

    }