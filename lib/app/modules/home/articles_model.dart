class Articles {
  String status;
  int totalResults;
  List<Results> results;
  int nextPage;

  Articles({this.status, this.totalResults, this.results, this.nextPage});

  Articles.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Results {
  String title;
  String link;
  List<String> keywords;
  List<String> creator;
  dynamic videoUrl;
  String description;
  String content;
  String pubDate;
  String imageUrl;
  String sourceId;
  List<String> country;
  List<String> category;
  String language;

  Results(
      {this.title,
      this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      this.description,
      this.content,
      this.pubDate,
      this.imageUrl,
      this.sourceId,
      this.country,
      this.category,
      this.language});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'].cast<String>();
    creator = json['creator'].cast<String>();
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    country = json['country'].cast<String>();
    category = json['category'].cast<String>();
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['keywords'] = keywords;
    data['creator'] = creator;
    data['video_url'] = videoUrl;
    data['description'] = description;
    data['content'] = content;
    data['pubDate'] = pubDate;
    data['image_url'] = imageUrl;
    data['source_id'] = sourceId;
    data['country'] = country;
    data['category'] = category;
    data['language'] = language;
    return data;
  }
}
