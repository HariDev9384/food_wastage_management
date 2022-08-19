class Current_User{
  var role,dob,fullname,mobileno,username,userpass,gmail;
  Current_User(
    {
      required this.dob,
      required this.fullname,
      required this.mobileno,
      required this.username,
      required this.userpass,
      required this.gmail,
      required this.role
      });
  Current_User.fromMap(Map<String,dynamic> data){
    dob=data['Date of Birth'];
    fullname=data['Full name'];
    username=data['User Name'];
    userpass=data['User Password'];
    mobileno=data['Mobile Number'];
    gmail=data['gmail'];
    role=data['role'];
  }

  
  Map<String,dynamic> toMap(){
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['Date of Birth']=this.dob;
    data['Full name']=this.fullname;
    data['Mobile Number']=this.mobileno;
    data['User Name']=this.username;
    data['User Password']=this.userpass;
    data['gmail']=this.gmail;
    data['role']=this.role;
   return data;
  }
}