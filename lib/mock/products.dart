import 'package:ecommerce/models/entities/product.dart';

ProductCategory categoryRoom = ProductCategory(id: 'room', name: 'Room');
ProductCategory categoryLivingRoom =
    ProductCategory(id: 'living-room', name: 'Living room');
ProductCategory categoryKitchen =
    ProductCategory(id: 'kitchen', name: 'Kitchen');

Product product1 = Product(
    id: 'p1',
    name: 'King bed',
    description: '',
    image: "https://i.ibb.co/3TWPtRj/King-Size-Bed-Headboard.jpg",
    price: 24999,
    category: categoryRoom);

Product product2 = Product(
    id: 'p2',
    name: 'Wood nightstand',
    description: '',
    image: "https://i.ibb.co/QDMtNhH/Nightstand-Photo.jpg",
    price: 14900,
    category: categoryRoom);

Product product3 = Product(
    id: 'p3',
    name: 'Platinum mirror',
    description: '',
    image: "https://i.ibb.co/k3xRjn9/Mirror-Photo.jpg",
    price: 12900,
    category: categoryRoom);

Product product4 = Product(
    id: 'p4',
    name: 'Simple dresser',
    description: '',
    image: "https://i.ibb.co/bg7MhDS/Squared-Dresser-Photo-1.jpg",
    price: 19999,
    category: categoryRoom);

Product product5 = Product(
    id: 'p5',
    name: 'Wood nightstand',
    description: '',
    image: "https://i.ibb.co/QDMtNhH/Nightstand-Photo.jpg",
    price: 14900,
    category: categoryLivingRoom);

Product product6 = Product(
    id: 'p6',
    name: 'Platinum mirror',
    description: '',
    image: "https://i.ibb.co/k3xRjn9/Mirror-Photo.jpg",
    price: 12900,
    category: categoryLivingRoom);
