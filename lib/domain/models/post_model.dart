final class PostList {
  List<PostModel?>? allPosts = <PostModel>[];

  PostList({required this.allPosts});

  PostList.fromJson(List<dynamic> json) {
    allPosts = json.map((post) => PostModel.fromJson(post)).toList();
  }
}

final class PostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? 'Error',
      userId: json['userId'] ?? -1,
      body: json['body'] ?? 'Error',
    );
  }
}
