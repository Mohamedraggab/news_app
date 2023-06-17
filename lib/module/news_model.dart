class NewsModel
{
  var source ;
  late String author ;
  late String title ;
  late String description ;
  late String url ;
  late String urlToImage ;
  late String publishedAt ;
  late String content ;


  NewsModel({
    required this.source ,
    required this.author ,
    required this.title ,
    required this.description ,
    required this.url ,
    required this.urlToImage ,
    required this.publishedAt ,
    required this.content ,
});


  NewsModel.fromJson(Map<String , dynamic> json)
  {
    source = json['source'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];

  }

  Map<String , dynamic> toMap ()
  {
    return {
      'source': source ,
      'author': author ,
      'title': title ,
      'description': description ,
      'url': url ,
      'urlToImage': urlToImage ,
      'publishedAt': publishedAt ,
      'content': content ,

    } ;
  }



}