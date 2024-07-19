class CTASchema {
  CTASchema({required this.name});

  final String name;

  factory CTASchema.fromJson(Map<String, dynamic> json) {
    return CTASchema(name: json['name']);
  }
}
