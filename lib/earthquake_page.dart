import 'package:flutter/material.dart';
import 'api_service.dart';
import 'earthquake_model.dart';

class EarthquakePage extends StatefulWidget {
  @override
  _EarthquakePageState createState() => _EarthquakePageState();
}

class _EarthquakePageState extends State<EarthquakePage> {
  late Future<Earthquake> _earthquake;

  @override
  void initState() {
    super.initState();
    _earthquake = ApiService().fetchEarthquake();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Earthquake>(
        future: _earthquake,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date: ${data.date}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("Time: ${data.time}", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Text("Magnitude: ${data.magnitude}", style: TextStyle(fontSize: 18, color: Colors.red)),
                      SizedBox(height: 8),
                      Text("Depth: ${data.depth}", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Text("Region: ${data.region}", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Text("Coordinates: ${data.coordinates}", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
