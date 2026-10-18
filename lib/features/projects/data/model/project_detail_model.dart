
class ProjectDetailModel {
  final int id;
  final String slug;
  final String title;
  final String? category;
  final String? location;
  final int? year;
  final String? thumbnailImageUrl;
  final String? heroImageUrl;
  final String? conceptImageUrl;
  final String? brief;
  final String? conceptTitle;
  final String? concept;
  final List<ProjectImageModel> gallery;

  ProjectDetailModel({
    required this.id,
    required this.slug,
    required this.title,
    this.category,
    this.location,
    this.year,
    this.thumbnailImageUrl,
    this.heroImageUrl,
    this.conceptImageUrl,
    this.brief,
    this.conceptTitle,
    this.concept,
    required this.gallery,
  });

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailModel(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      category: json['category'],
      location: json['location'],
      year: json['year'],
      thumbnailImageUrl: json['thumbnail_image_url'],
      heroImageUrl: json['hero_image_url'],
      conceptImageUrl: json['concept_image_url'],
      brief: json['brief'],
      conceptTitle: json['concept_title'],
      concept: json['concept'],
      gallery: (json['gallery'] as List<dynamic>? ?? [])
          .map(
            (image) => ProjectImageModel.fromJson(
              image as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

class ProjectImageModel {
  final int id;
  final String imageUrl;
  final String? imageType;
  final int? sortOrder;

  ProjectImageModel({
    required this.id,
    required this.imageUrl,
    this.imageType,
    this.sortOrder,
  });

  factory ProjectImageModel.fromJson(Map<String, dynamic> json) {
    return ProjectImageModel(
      id: json['id'],
      imageUrl: json['image_url'],
      imageType: json['image_type'],
      sortOrder: json['sort_order'],
    );
  }
}
