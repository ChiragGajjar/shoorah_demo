

class CategoryListResponse {
  final String id;
  final String name;
  final String image;

  CategoryListResponse({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> map) {
    return CategoryListResponse(
      id: map['id'] != null ? map['id'].toString() : '',
      name: map['name'] != null ? map['name'].toString() : '',
      image: map['image'] != null ? map['image'].toString() : '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;

    return data;
  }
}
