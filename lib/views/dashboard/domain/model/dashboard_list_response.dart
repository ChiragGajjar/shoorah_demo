
class CompanyDataListResponse {
  final String id;
  final String email;
  final String name;
  final String role;
  final String avatar;

  CompanyDataListResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.avatar,
  });

  factory CompanyDataListResponse.fromJson(Map<String, dynamic> map) {
    return CompanyDataListResponse(
      id: map['id'] != null ? map['id'].toString() : '',
      email: map['email'] != null ? map['email'].toString() : '',
      name: map['name'] != null ? map['name'].toString() : '',
      role: map['role'] != null ? map['role'].toString() : '',
      avatar: map['avatar'] != null ? map['avatar'].toString() : '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['role'] = role;
    data['avatar'] = avatar;

    return data;
  }
}
