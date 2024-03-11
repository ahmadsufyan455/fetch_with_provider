class Fox {
  final String image;
  Fox({required this.image});

  factory Fox.fromJson(Map<String, dynamic> json) => Fox(image: json['image']);
}
