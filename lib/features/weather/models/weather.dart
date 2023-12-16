import 'dart:convert';

class Weather{
  late String description;
  late String shortDescription;
  late String city;
  late double temperature;

  Weather({ required this.description,
    required this.shortDescription,
    required this.city,
    required this.temperature
  });

  factory Weather.fromJson(String jsonString){
    Map<String, dynamic> data = jsonDecode(jsonString);
    return Weather(description: data["weather"][0]["description"],
        shortDescription: data["weather"][0]["main"],
        city: data["name"],
        temperature: data["main"]["temp"]
    );
  }

  @override
  String toString(){
    return "{ Description: $description, "
        "Short Description: $shortDescription, "
        "Location: $city, "
        "Temperature: $temperature }";
  }
}