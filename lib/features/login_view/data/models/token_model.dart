class TokenModel{
 final  String token;
 final String userId;

  TokenModel({required this.token, required this.userId});

 Map<String, dynamic> toJson() {
   return {
     'token': token,
     'user-id': userId,
   };
 }
}