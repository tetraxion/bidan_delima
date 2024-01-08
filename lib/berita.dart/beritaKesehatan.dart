// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'News App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NewsPage(),
//     );
//   }
// }

// class NewsPage extends StatefulWidget {
//   @override
//   _NewsPageState createState() => _NewsPageState();
// }

// class _NewsPageState extends State<NewsPage> {
//   late List<Article> articles = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }

//   Future<void> fetchNews() async {
//     final response = await http.get(Uri.parse(
//         'https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=6c22e5dd212946a9921eec16ffc3f9ef'));

//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = jsonDecode(response.body);
//       setState(() {
//         articles = (jsonData['articles'] as List)
//             .map((articleJson) => Article.fromJson(articleJson))
//             .toList();
//       });
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }

//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   String getDomainFromUrl(String url) {
//     Uri uri = Uri.parse(url);
//     return uri.host;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Berita Kesehatan'),
//       ),
//       body: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.all(8),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     articles[index].title ?? '',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(articles[index].description ?? ''),
//                   SizedBox(height: 8),
//                   Text(articles[index].author ?? ''),
//                   SizedBox(height: 8),
//                   Text(articles[index].publishedAt ?? ''),
//                   SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       String domain = getDomainFromUrl(articles[index].url ?? '');
//                       String baseUrl = 'https://$domain';
//                       _launchURL(baseUrl);
//                     },
//                     child: Text('Baca Selengkapnya'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Article {
//   final String? author;
//   final String? title;
//   final String? description;
//   final String? url;
//   final String? urlToImage;
//   final String? publishedAt;

//   Article({
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) {
//     return Article(
//       author: json['author'],
//       title: json['title'],
//       description: json['description'],
//       url: json['url'],
//       urlToImage: json['urlToImage'],
//       publishedAt: json['publishedAt'],
//     );
//   }
// }
