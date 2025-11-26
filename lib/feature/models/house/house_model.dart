import '../../../utils/constants/images.dart';

class HouseModel {
  final String imageUrl;
  final String title;
  final String price;
  final String address;
  final int beds;
  final int baths;
  final String area;

  HouseModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.address,
    required this.beds,
    required this.baths,
    required this.area,
  });
}

final houseList = [
  HouseModel(
    imageUrl: Images.duplex,
    title: "Lakeshore Blvd West",
    price: "797,500",
    address: "70 Washington Square South, New York, NY 10012, United States",
    beds: 2,
    baths: 2,
    area: "2000 sqft",
  ),
  HouseModel(
    imageUrl: Images.apartment,
    title: "Brooklyn Heights",
    price: "680,000",
    address: "12 Columbia Heights, Brooklyn, NY",
    beds: 3,
    baths: 2,
    area: "1800 sqft",
  ),
  HouseModel(
    imageUrl: Images.condominium,
    title: "Manhattan View",
    price: "1,200,000",
    address: "5th Avenue, Manhattan, NY",
    beds: 2,
    baths: 1,
    area: "1500 sqft",
  ),
  HouseModel(
    imageUrl: Images.duplex,
    title: "Soho Villa",
    price: "950,000",
    address: "75 Greene Street, Soho, NY",
    beds: 4,
    baths: 3,
    area: "2500 sqft",
  ),
  HouseModel(
    imageUrl: Images.apartment,
    title: "Uptown Condo",
    price: "500,000",
    address: "Central Park West, NY",
    beds: 1,
    baths: 1,
    area: "900 sqft",
  ),
  HouseModel(
    imageUrl: Images.condominium,
    title: "Harlem Duplex",
    price: "450,000",
    address: "Lenox Avenue, Harlem, NY",
    beds: 2,
    baths: 2,
    area: "1300 sqft",
  ),
];
