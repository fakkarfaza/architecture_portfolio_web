class ProfileModel {
  final int id;
  final String name;
  final String? profileImageUrl;
  final String? title;
  final String? bio;
  final String? description;
  final String? email;
  final String? location;
  final String? instagramUrl;
  final String? linkedinUrl;
  final String? behanceUrl;

  ProfileModel({
    required this.id,
    required this.name,
    this.profileImageUrl,
    this.title,
    this.bio,
    this.description,
    this.email,
    this.location,
    this.instagramUrl,
    this.linkedinUrl,
    this.behanceUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profile_image_url'],
      email: json['email'],
      location: json['location'],
      instagramUrl: json['instagram_url'],
      linkedinUrl: json['linkedin_url'],
      title: json['title'],
      bio: json['bio'],
      description: json['description'],
      behanceUrl: json['behance_url'],
    );
  }
}