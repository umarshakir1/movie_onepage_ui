import 'package:flutter/material.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("U-Movie App"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Map<String, dynamic>> movieDataList = [
    {
      "id": 35624,
      "name": "The Flash",
      "permalink": "the-flash",
      "start_date": "2014-10-07",
      "end_date": null,
      "country": "US",
      "network": "The CW",
      "status": "Ended",
      "image_thumbnail_path":
          "https://static.episodate.com/images/tv-show/thumbnail/35624.jpg",
    },

    {
      "id": 23455,
      "name": "Game of Thrones",
      "permalink": "game-of-thrones",
      "start_date": "2011-04-17",
      "end_date": null,
      "country": "US",
      "network": "HBO",
      "status": "Ended",
      "image_thumbnail_path":
          "https://static.episodate.com/images/tv-show/thumbnail/23455.jpg"
    },
    {
      "id": 29560,
      "name": "Arrow",
      "permalink": "arrow",
      "start_date": "2012-10-10",
      "end_date": null,
      "country": "US",
      "network": "The CW",
      "status": "Ended",
      "image_thumbnail_path":
          "https://static.episodate.com/images/tv-show/thumbnail/29560.jpg"
    },
    {
      "id": 43467,
      "name": "Lucifer",
      "permalink": "lucifer",
      "start_date": "2016-01-25",
      "end_date": null,
      "country": "US",
      "network": "Netflix",
      "status": "Ended",
      "image_thumbnail_path":
          "https://static.episodate.com/images/tv-show/thumbnail/43467.com"
    },
    {
      "id": 46692,
      "name": "DC's Legends of Tomorrow",
      "permalink": "dcs-legends-of-tomorrow",
      "start_date": "2016-01-21",
      "end_date": null,
      "country": "US",
      "network": "The CW",
      "status": "Ended",
      "image_thumbnail_path":
          "https://static.episodate.com/images/tv-show/thumbnail/46692.jpg"
    },
    // Add more movie data entries here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieDataList.length,
      itemBuilder: (context, index) {
        final movieData = movieDataList[index];

        return MovieCard(movieData: movieData);
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movieData;

  MovieCard({required this.movieData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Enjoy Your favourite Movie",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movieData["image_thumbnail_path"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  movieData["name"],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start Date: ${movieData["start_date"]}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "End Date: ${movieData["end_date"] ?? "Ongoing"}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "Country: ${movieData["country"]}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "Network: ${movieData["network"]}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "Status: ${movieData["status"]}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
