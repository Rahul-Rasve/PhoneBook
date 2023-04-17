class Contact {
  final String id;
  final String photoUrl; //the path of image source
  final String name;
  final String mobile;
  final String email;

  Contact({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.mobile,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'photo': photoUrl,
      'name': name,
      'mobile': mobile,
      'email': email,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      photoUrl: map['photo'],
      name: map['name'],
      mobile: map['mobile'],
      email: map['email'],
    );
  }
}
