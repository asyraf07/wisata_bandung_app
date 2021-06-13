import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisata_bandung_app/model/tourism_place.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth >800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  DetailMobilePage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Title Container
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),

            // Information Container
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Description Container
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),

            // Galery Container
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;

  DetailWebPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64
        ),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(place.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: 16),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: place.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  place.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today),
                                      SizedBox(width: 8.0),
                                      Text(
                                        place.openDays,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.access_time),
                                  SizedBox(width: 8.0),
                                  Text(
                                    place.openTime,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.monetization_on),
                                  SizedBox(width: 8.0),
                                  Text(
                                    place.ticketPrice,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  place.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Oxygen',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}
