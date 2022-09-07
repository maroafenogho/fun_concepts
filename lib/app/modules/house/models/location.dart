class Location {
  String houseNumber;
  String street;
  String area;
  String city;
  String state;
  Location({
    required this.houseNumber,
    required this.street,
    required this.area,
    required this.city,
    required this.state,
  });

  factory Location.fromMap(Map map) {
    return Location(
      houseNumber: map['houseNum'],
      street: map['street'],
      area: map['area'],
      city: map['city'],
      state: map['state'],
    );
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