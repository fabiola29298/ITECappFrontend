import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:itec_app/src/models/activity_model.dart';

class ActivitiesProvider{

  String _apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjp7InJvbGUiOiJBRE1JTl9ST0xFIiwic3RhdHVzIjp0cnVlLCJnb29nbGUiOmZhbHNlLCJfaWQiOiI1ZDU3ODg4ZjE1Zjg2YzAwMTYyNjI4ZjkiLCJuYW1lIjoiYWRtaW4xMCIsImxhc3RfbmFtZSI6Imxhc3RfYWRtaW4iLCJlbWFpbCI6ImFkbWluMTBAZ21haWwuY29tIiwiX192IjowfSwiaWF0IjoxNTY3MjIyMzc5LCJleHAiOjE1NjcyMjQ5NzF9.vEBXpIsN3UnpaGTMEumSA-IlMqOl62VR8Cs4xv8Sbjg';
  String _url    = 'itec-ucb.herokuapp.com';

  //GET / Movie/now_playing
  Future <List<Activity>> getActivities() async{
    final url = Uri.https(_url, 'activity',{
      'token' : _apikey
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final activitiesData = new Activities.fromJsonList(decodedData['activity']);
    final dt = activitiesData.items;
    print('decode:{$decodedData}');
    return activitiesData.items;
  }
}