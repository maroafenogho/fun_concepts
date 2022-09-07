import 'package:bootcamp101/app/modules/house/models/location.dart';

class House {
  String title;
  String description;
  String duration;
  int price;
  String image;
  Location location;

  House({
    required this.title,
    required this.description,
    required this.price,
    required this.duration,
    required this.image,
    required this.location,
  });
  factory House.fromJson(Map map) {
    return House(
        title: map['title'],
        description: map['description'],
        price: map['price'],
        duration: map['duration'],
        image: map['img'],
        location: Location.fromMap(map['location']));
  }
}
/* {
        "_id": "6318d470b0bdcc1831ad22e2",
        "title": "Self Contain Apartment",
        "description": "A well furnished and spacious self contain in the heeart of Lagos available for short term lease",
        "img": "https://i.ibb.co/tq7Z0Ck/self-contain.jpg",
        "location": {
            "houseNum": "Suite 12",
            "street": "Admiralty Way",
            "area": "Lekki Phase 1",
            "city": "Lekki",
            "state": "Lagos"
        },
        "duration": "6 months",
        "price": 80000,
        "createdAt": "2022-09-07T17:27:12.346Z",
        "updatedAt": "2022-09-07T17:27:12.346Z",
        "__v": 0
    }*/