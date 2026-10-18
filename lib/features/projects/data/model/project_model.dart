
class ProjectModel {
  final int id;
  final String slug;
  final String title;
  final String? category;
  final String? location;
  final int? year;
  final String? thumbnailImageUrl;
  final String? heroImageUrl;

  ProjectModel({
    required this.id,
    required this.slug,
    required this.title,
    this.category,
    this.location,
    this.year,
    this.thumbnailImageUrl,
    this.heroImageUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      category: json['category'],
      location: json['location'],
      year: json['year'],
      thumbnailImageUrl: json['thumbnail_image_url'],
      heroImageUrl: json['hero_image_url'],
    );
  }
}
