import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexi/features/personalization/models/user_model.dart';
import 'package:flexi/features/shop/models/banner_model.dart';
import 'package:flexi/features/shop/models/brand_category_model.dart';
import 'package:flexi/features/shop/models/brand_model.dart';
import 'package:flexi/features/shop/models/category_model.dart';
import 'package:flexi/features/shop/models/product_attribute_model.dart';
import 'package:flexi/features/shop/models/product_category_model.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/features/shop/models/product_variation_model.dart';
import 'package:flexi/routes/routes.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/image_strings.dart';

class DummyData {
  // Banners
  static final List<BannerModel> banners = [
    BannerModel(
        number: '1',
        image: CImages.promoBannerTwo,
        isActive: true,
        targetScreen: RRoutes.store),
    BannerModel(
        number: '2',
        image: CImages.promoBannerThree,
        isActive: true,
        targetScreen: RRoutes.store),
    BannerModel(
        number: '3',
        image: CImages.promoBannerFour,
        isActive: false,
        targetScreen: RRoutes.store),
    BannerModel(
        number: '4',
        image: CImages.promoBannerFive,
        isActive: true,
        targetScreen: RRoutes.store),
    BannerModel(
        number: '5',
        image: CImages.promoBannerSix,
        isActive: true,
        targetScreen: RRoutes.store),
  ];

  // User
  static final UserModel user = UserModel(
      id: '1',
      username: '',
      email: 'mustafanedeer1@gmail.com',
      firstName: 'Mustafa',
      lastName: 'Nedeer',
      phoneNumber: '01003051290',
      profilePicture: '');

  // Cart

  // List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: CImages.sportsIcon, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Furniture',
        image: CImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: 'Electronics',
        image: CImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '4', name: 'Clothes', image: CImages.clothesIcon, isFeatured: true),
    CategoryModel(
        id: '5', name: 'Animals', image: CImages.animalsIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: CImages.shoesIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: CImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '8',
        name: 'Jewelery',
        image: CImages.jewelryIcon,
        isFeatured: true),

    // Subcategories
    // Sports
    CategoryModel(
        id: '9',
        parentId: '1',
        name: 'Sport Shoes',
        image: CImages.sportsIcon,
        isFeatured: false),
    CategoryModel(
        id: '10',
        parentId: '1',
        name: 'Track Suits',
        image: CImages.sportsIcon,
        isFeatured: false),
    CategoryModel(
        id: '11',
        parentId: '1',
        name: 'Sports Equipments',
        image: CImages.sportsIcon,
        isFeatured: false),

    // furniture
    CategoryModel(
        id: '12',
        parentId: '2',
        name: 'Bedroom Furniture',
        image: CImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '13',
        parentId: '2',
        name: 'Kitchen Furniture',
        image: CImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '14',
        parentId: '2',
        name: 'Office Furniture',
        image: CImages.furnitureIcon,
        isFeatured: false),

    // electronics
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: CImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: '16',
        name: 'Laptops',
        image: CImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: '17',
        name: 'Apple',
        image: CImages.electronicsIcon,
        isFeatured: false),

    // Clothes
    CategoryModel(
        id: '18',
        parentId: '4',
        name: 'Casual',
        image: CImages.clothesIcon,
        isFeatured: false),
    CategoryModel(
        id: '19',
        parentId: '4',
        name: 'Formal',
        image: CImages.clothesIcon,
        isFeatured: false),
    CategoryModel(
        id: '20',
        parentId: '4',
        name: 'Kids',
        image: CImages.clothesIcon,
        isFeatured: false),

    // Animals
    CategoryModel(
        id: '21',
        parentId: '5',
        name: 'Animal Food',
        image: CImages.animalsIcon,
        isFeatured: false),

    CategoryModel(
        id: '22',
        parentId: '5',
        name: 'Animal Toys',
        image: CImages.animalsIcon,
        isFeatured: false),

    CategoryModel(
        id: '23',
        parentId: '5',
        name: 'Animal Accesories',
        image: CImages.animalsIcon,
        isFeatured: false),

    // Shoes
    CategoryModel(
        id: '24',
        parentId: '6',
        name: 'Athletic Shoes',
        image: CImages.shoesIcon,
        isFeatured: false),

    CategoryModel(
        id: '25',
        parentId: '6',
        name: 'Casual Shoes',
        image: CImages.shoesIcon,
        isFeatured: false),

    CategoryModel(
        id: '26',
        parentId: '6',
        name: 'Dress Shoes',
        image: CImages.shoesIcon,
        isFeatured: false),

    // Cosmetics
    CategoryModel(
        id: '27',
        parentId: '7',
        name: 'Skincare',
        image: CImages.cosmeticsIcon,
        isFeatured: false),

    CategoryModel(
        id: '28',
        parentId: '7',
        name: 'Makeup',
        image: CImages.cosmeticsIcon,
        isFeatured: false),

    CategoryModel(
        id: '29',
        parentId: '7',
        name: 'Fragrances',
        image: CImages.cosmeticsIcon,
        isFeatured: false),

    // Jewelery
    CategoryModel(
        id: '30',
        parentId: '8',
        name: 'Necklaces',
        image: CImages.jewelryIcon,
        isFeatured: false),

    CategoryModel(
        id: '31',
        parentId: '8',
        name: 'Rings',
        image: CImages.jewelryIcon,
        isFeatured: false),

    CategoryModel(
        id: '32',
        parentId: '8',
        name: 'Bracelets',
        image: CImages.jewelryIcon,
        isFeatured: false),

    // Toys
    CategoryModel(
        id: '33', name: 'Toys', image: CImages.toysIcon, isFeatured: false),
  ];

  // Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: CImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: CImages.adidasLogo,
        name: 'Adidas',
        productsCount: 301,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: CImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 78,
        isFeatured: false),
    BrandModel(
        id: '4',
        image: CImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 90,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: CImages.appleLogo,
        name: 'Apple',
        productsCount: 270,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: CImages.acerLogo,
        name: 'Acer',
        productsCount: 28,
        isFeatured: false),
    BrandModel(
        id: '7',
        image: CImages.jordanLogo,
        name: 'Jordan',
        productsCount: 13,
        isFeatured: false),
    BrandModel(
        id: '8',
        image: CImages.pumaLogo,
        name: 'Puma',
        productsCount: 125,
        isFeatured: true),
    BrandModel(
        id: '9',
        image: CImages.zaraLogo,
        name: 'ZARA',
        productsCount: 90,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: CImages.samsungLogo,
        name: 'Samsung',
        productsCount: 67,
        isFeatured: true),
  ];

  // Products
  static final List<ProductModel> products = [
    // 001
    ProductModel(
        id: '1',
        title:
            'SAMSUNG 16" Galaxy Book4 Pro Laptop PC Computer, Intel Core 7 Ultra Processor 1TB',
        stock: 5,
        price: 1740,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.samsungLaptop_1,
        description: '''
              POWER FOR YOUR MOST PRODUCTIVE DAYS: Breeze through every task 
              with a powerful Intel processor; Intel Core Ultra 7 processor 155H; 
              Enhanced with AI Intel ARC Graphics
            ''',
        brand: BrandModel(
            id: '10',
            image: CImages.samsungLogo,
            name: 'Samsung',
            productsCount: 10,
            isFeatured: true), // Samsung
        images: [
          CImages.samsungLaptop_1,
          CImages.samsungLaptop_2,
          CImages.samsungLaptop_3,
        ],
        salePrice: 1700,
        sku: 'AAR5523',
        categoryId: '16',
        productType: ProductType.single.toString()),

    // 002
    ProductModel(
        id: '2',
        title: "4 color women's boot",
        stock: 15,
        price: 221,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.productImage1_2,
        description:
            'An amazing boot for women that can be helpful for winter and aslo good for summer sometimes.',
        brand: BrandModel(
            id: '1',
            image: CImages.nikeLogo,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true), // Nike
        images: [
          CImages.productImage1_1,
          CImages.productImage1_2,
          CImages.productImage1_3,
          CImages.productImage1_4,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '18',
        productAttributes: [
          // Color and Size
          ProductAttributeModel(
              name: 'Color', values: ['Pink', 'Blue', 'Brown', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          // Each Combination
          // Pink
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 99,
              image: CImages.productImage1_1,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '2',
              stock: 34,
              price: 134,
              salePrice: 130,
              image: CImages.productImage1_1,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 34,
              price: 134,
              salePrice: 122,
              image: CImages.productImage1_1,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),

          // Color: Blue
          ProductVariationModel(
              id: '4',
              stock: 12,
              price: 134,
              salePrice: 99,
              image: CImages.productImage1_2,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '5',
              stock: 12,
              price: 134,
              salePrice: 130,
              image: CImages.productImage1_2,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '6',
              stock: 12,
              price: 134,
              salePrice: 122,
              image: CImages.productImage1_2,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),

          // Brown
          ProductVariationModel(
              id: '7',
              stock: 30,
              price: 134,
              salePrice: 100,
              image: CImages.productImage1_3,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Brown', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '8',
              stock: 34,
              price: 134,
              salePrice: 130,
              image: CImages.productImage1_3,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '9',
              stock: 0,
              price: 134,
              salePrice: 122,
              image: CImages.productImage1_3,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),

          // Red
          ProductVariationModel(
              id: '10',
              stock: 0,
              price: 134,
              salePrice: 134,
              image: CImages.productImage1_4,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '11',
              stock: 0,
              price: 134,
              salePrice: 132,
              image: CImages.productImage1_4,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '12',
              stock: 4,
              price: 134,
              salePrice: 120,
              image: CImages.productImage1_4,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ],
        productType: ProductType.variable.toString()),

    // 003
    ProductModel(
        id: '3',
        title:
            "Adidas Launches Predator Mania 19.1 'White/Core Black/Predator Red'",
        stock: 3,
        price: 112,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.adidasBootsThumbail,
        description:
            "There's no doubt that the Predator Mania is one of the most iconic boots of all time, the seamless blending of two materials reflect Predator's historic transition from K-leather to adidas Primeknit; Heritage details include the Predator Mania's distinctive curved forefoot pads and debossing on the sides",
        brand: BrandModel(
            id: '2',
            image: CImages.adidasLogo,
            name: 'Adidas',
            productsCount: 34,
            isFeatured: true), // Nike
        images: [CImages.adidasBootsThumbail, CImages.adidasBootsImage],
        salePrice: 90,
        sku: 'ABR4500',
        categoryId: '9',
        productType: ProductType.single.toString()),

    // 004
    ProductModel(
        id: '4',
        title: "Gaming Headset for PS5, PS4, PC, Mac, Switch, and Xbox Series",
        description: '''
          Gaming headset with mic wired feature a 50mm dynamic 
          driver and a PET material large diaphragm. They effectively 
          reproduce game audio, providing an immersive gaming experience 
          where every footstep and gunshot can be captured from all directions. 
          The gaming headphones with mic include a scroll volume adjuster and 
          a one-click mute function for easy volume control. With 6.9-foot braided cables, 
          ensuring a stable power supply and preventing cable tangling.
        ''',
        stock: 3,
        price: 22,
        salePrice: 19,
        isFeatured: true,
        categoryId: '3',
        date: Timestamp.now(),
        thumbnail: CImages.samsungHeadphones,
        brand: BrandModel(
            id: '10',
            image: CImages.samsungLogo,
            name: 'Samsung',
            productsCount: 30,
            isFeatured: true), // Samsung

        images: [
          CImages.samsungHeadphones,
        ],
        productType: ProductType.single.toString()),

    // 005
    ProductModel(
        id: '5',
        title:
            "Galaxy A15 5G A Series Cell Phone, 128GB Unlocked Android Smartphone",
        stock: 13,
        price: 165,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.samsungGalaxy_1,
        description: '''
              YOUR CONTENT, SUPERSMOOTH: Whether watching shows, 
              playing games or reading online, the ultra-clear, 
              superfluid display of Galaxy A25 5G brings your content to life; Plus, Vision Booster 
              lets you to enjoy the bright 800-nits screen experience
            ''',
        brand: BrandModel(
            id: '10',
            image: CImages.samsungLogo,
            name: 'Samsung',
            productsCount: 3,
            isFeatured: true), // Samsung
        images: [
          CImages.samsungGalaxy_1,
          CImages.samsungGalaxy_2,
          CImages.samsungGalaxy_3
        ],
        salePrice: 160,
        sku: 'ABR4510',
        categoryId: '15',
        productType: ProductType.single.toString()),

    // 006
    ProductModel(
        id: '6',
        title: "Galaxy Tab A9+ Plus 11” 64GB Android Tablet",
        stock: 7,
        price: 155,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.samsungTab_1,
        description: '''
              BIG SCREEN. FAMILY-SIZED FUN: Bring fun home to everyone with a bright, 
              engaging 11" screen¹ ; A refresh rate of up to 90Hz makes every experience feel smooth — 
              great for videos, games or fun time for the kids
            ''',
        brand: BrandModel(
            id: '10',
            image: CImages.samsungLogo,
            name: 'Samsung',
            productsCount: 7,
            isFeatured: true), // Samsung
        images: [
          CImages.samsungTab_1,
          CImages.samsungTab_2,
          CImages.samsungTab_3
        ],
        salePrice: 150,
        sku: 'ABR5510',
        categoryId: '15',
        productType: ProductType.single.toString()),

    // 007
    ProductModel(
        id: '7',
        title: 'SAMSUNG 34" ViewFinity S50GC Series Ultra-WQHD Monitor',
        stock: 9,
        price: 940,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.samsungViewInfinity_1,
        description: '''
              5K RESOLUTION: 5K provides more pixels than 4K, with 218 PPI for incredible detail; 
              99% DCI-P3 delivers color saturation to bring your ideas to vibrant life, and 
              factory-calibrated color accuracy (ΔE < 2) delivers true color representation.
            ''',
        brand: BrandModel(
            id: '10',
            image: CImages.samsungLogo,
            name: 'Samsung',
            productsCount: 10,
            isFeatured: true), // Samsung
        images: [
          CImages.samsungViewInfinity_1,
          CImages.samsungViewInfinity_2,
          CImages.samsungViewInfinity_3,
        ],
        salePrice: 900,
        sku: 'ABR5523',
        categoryId: '3',
        productType: ProductType.single.toString()),

    //008
    ProductModel(
        id: '8',
        title: 'Apple AirPods 2 with Charging Case - White',
        stock: 12,
        price: 62,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.appleAirPods_1,
        description: '''
              Automatically on, automatically connected
              Easy setup for all your Apple devices
              Quick access to Siri by saying “Hey Siri”
              Double-tap to play or skip forward
              New Apple H1 headphone chip delivers faster wireless connection to your devices
            ''',
        brand: BrandModel(
            id: '5',
            image: CImages.appleLogo,
            name: 'Apple',
            productsCount: 1,
            isFeatured: true), // Apple
        images: [
          CImages.appleAirPods_1,
          CImages.appleAirPods_2,
          CImages.appleAirPods_3,
        ],
        salePrice: 60,
        sku: 'DBR5623',
        categoryId: '17',
        productType: ProductType.single.toString()),

    //009
    ProductModel(
        id: '9',
        title:
            'Watch SE (2nd Gen) [GPS 40mm] Smartwatch with Starlight Aluminum Case with Starlight Sport Band S/M',
        stock: 2,
        price: 173,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.appleWatch_1,
        description: '''
              WHY APPLE WATCH SE — All the essentials to help 
              you be motivated and active, keep connected, 
              track your health, and stay safe. The Smart Stack 
              and redesigned apps in watchOS 10 help you see more 
              information at a glance. With features like Crash 
              Detection and enhanced workout metrics, 
              Apple Watch SE is a better value than ever.
            ''',
        brand: BrandModel(
            id: '5',
            image: CImages.appleLogo,
            name: 'Apple',
            productsCount: 1,
            isFeatured: true), // Apple
        images: [
          CImages.appleWatch_1,
          CImages.appleWatch_2,
        ],
        salePrice: 171,
        sku: 'DBD5623',
        categoryId: '17',
        productType: ProductType.single.toString()),

    //010
    ProductModel(
        id: '10',
        title: 'Apple iPhone 13 Pro, 128GB, Gold - GSM Carriers',
        stock: 6,
        price: 1440,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.iphone_1,
        description: '''
              This pre-owned product is not Apple certified, but has been professionally inspected, 
              tested and cleaned by Amazon-qualified suppliers.
              There will be no visible cosmetic imperfections when held at an arm’s length. 
              There will be no visible cosmetic imperfections when held at an arm’s length.
            ''',
        brand: BrandModel(
            id: '5',
            image: CImages.appleLogo,
            name: 'Apple',
            productsCount: 1,
            isFeatured: true), // Apple
        images: [
          CImages.iphone_1,
          CImages.iphone_2,
          CImages.iphone_3,
          CImages.iphone_4,
        ],
        salePrice: 1400,
        sku: 'DBD5622',
        categoryId: '15',
        productType: ProductType.single.toString()),
  ];

  static final List<ProductModel> productsVersionTwo = [
    // 002
    ProductModel(
        id: '2',
        title: "4 color women's boot",
        stock: 15,
        price: 221,
        isFeatured: true,
        date: Timestamp.now(),
        thumbnail: CImages.productImage1_2,
        description:
            'An amazing boot for women that can be helpful for winter and aslo good for summer sometimes.',
        brand: BrandModel(
            id: '9',
            image: CImages.zaraLogo,
            name: 'Zara',
            productsCount: 265,
            isFeatured: true), // Zara
        images: [
          CImages.productImage1_1,
          CImages.productImage1_2,
          CImages.productImage1_3,
          CImages.productImage1_4,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '18',
        productAttributes: [
          // Color and Size
          ProductAttributeModel(
              name: 'Color', values: ['Pink', 'Blue', 'Brown', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          // Each Combination
          // Pink
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 99,
              image: CImages.productImage1_1,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '2',
              stock: 34,
              price: 134,
              salePrice: 130,
              image: CImages.productImage1_1,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 34,
              price: 134,
              salePrice: 122,
              image: CImages.productImage1_1,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),

          // Color: Blue
          ProductVariationModel(
              id: '4',
              stock: 12,
              price: 134,
              salePrice: 99,
              image: CImages.productImage1_2,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '5',
              stock: 12,
              price: 134,
              salePrice: 130,
              image: CImages.productImage1_2,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '6',
              stock: 12,
              price: 134,
              salePrice: 122,
              image: CImages.productImage1_2,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),

          // Brown
          ProductVariationModel(
              id: '7',
              stock: 30,
              price: 134,
              salePrice: 100,
              image: CImages.productImage1_3,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Brown', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '8',
              stock: 34,
              price: 134,
              salePrice: 130,
              image: CImages.productImage1_3,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '9',
              stock: 0,
              price: 134,
              salePrice: 122,
              image: CImages.productImage1_3,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),

          // Red
          ProductVariationModel(
              id: '10',
              stock: 0,
              price: 134,
              salePrice: 134,
              image: CImages.productImage1_4,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Pink', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '11',
              stock: 0,
              price: 134,
              salePrice: 132,
              image: CImages.productImage1_4,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '12',
              stock: 4,
              price: 134,
              salePrice: 120,
              image: CImages.productImage1_4,
              description:
                  'This is the description for different product variations.',
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ],
        productType: ProductType.variable.toString()),
  ];

  // ProductCategory
  static final List<ProductCategoryModel> productCat = [
    // Clothes
    ProductCategoryModel(productId: '1', categoryId: '4'),
    ProductCategoryModel(productId: '2', categoryId: '4'),
    ProductCategoryModel(productId: '3', categoryId: '4'),
    ProductCategoryModel(productId: '4', categoryId: '4'),
    ProductCategoryModel(productId: '5', categoryId: '4'),
    ProductCategoryModel(productId: '6', categoryId: '4'),

    // Casual
    ProductCategoryModel(productId: '1', categoryId: '18'),
    ProductCategoryModel(productId: '2', categoryId: '18'),
    ProductCategoryModel(productId: '3', categoryId: '18'),
    ProductCategoryModel(productId: '4', categoryId: '18'),
    ProductCategoryModel(productId: '5', categoryId: '18'),
    ProductCategoryModel(productId: '6', categoryId: '18'),

    // Formal
    ProductCategoryModel(productId: '1', categoryId: '19'),
    ProductCategoryModel(productId: '2', categoryId: '19'),
    ProductCategoryModel(productId: '3', categoryId: '19'),
    ProductCategoryModel(productId: '4', categoryId: '19'),
    ProductCategoryModel(productId: '5', categoryId: '19'),
    ProductCategoryModel(productId: '6', categoryId: '19'),
  ];

  // BrandCategory
  static final List<BrandCategoryModel> brandCat = [
    // Nike Brand
    BrandCategoryModel(categoryId: '1', brandId: '1'),
    BrandCategoryModel(categoryId: '9', brandId: '1'),
    BrandCategoryModel(categoryId: '10', brandId: '1'),
    BrandCategoryModel(categoryId: '11', brandId: '1'),

    // Adidas brand
    BrandCategoryModel(categoryId: '1', brandId: '2'),
    BrandCategoryModel(categoryId: '9', brandId: '2'),
    BrandCategoryModel(categoryId: '10', brandId: '2'),
    BrandCategoryModel(categoryId: '11', brandId: '2'),

    // Jordan
    BrandCategoryModel(categoryId: '1', brandId: '7'),
    BrandCategoryModel(categoryId: '9', brandId: '7'),
    BrandCategoryModel(categoryId: '10', brandId: '7'),
    BrandCategoryModel(categoryId: '11', brandId: '7'),

    // Puma
    BrandCategoryModel(categoryId: '1', brandId: '8'),
    BrandCategoryModel(categoryId: '4', brandId: '8'),
    BrandCategoryModel(categoryId: '9', brandId: '8'),
    BrandCategoryModel(categoryId: '10', brandId: '8'),
    BrandCategoryModel(categoryId: '11', brandId: '8'),

    // ZARA
    BrandCategoryModel(categoryId: '7', brandId: '9'),
    BrandCategoryModel(categoryId: '4', brandId: '9'),
    BrandCategoryModel(categoryId: '8', brandId: '9'),
    BrandCategoryModel(categoryId: '18', brandId: '9'),
    BrandCategoryModel(categoryId: '19', brandId: '9'),

    // Kenwood
    BrandCategoryModel(categoryId: '2', brandId: '3'),
    BrandCategoryModel(categoryId: '12', brandId: '3'),
    BrandCategoryModel(categoryId: '13', brandId: '3'),
    BrandCategoryModel(categoryId: '14', brandId: '3'),

    // Ikea
    BrandCategoryModel(categoryId: '2', brandId: '4'),
    BrandCategoryModel(categoryId: '12', brandId: '4'),
    BrandCategoryModel(categoryId: '13', brandId: '4'),
    BrandCategoryModel(categoryId: '14', brandId: '4'),

    // Apple
    BrandCategoryModel(categoryId: '3', brandId: '5'),
    BrandCategoryModel(categoryId: '15', brandId: '5'),
    BrandCategoryModel(categoryId: '16', brandId: '5'),
    BrandCategoryModel(categoryId: '17', brandId: '5'),

    // Acer
    BrandCategoryModel(categoryId: '3', brandId: '6'),
    BrandCategoryModel(categoryId: '15', brandId: '6'),
    BrandCategoryModel(categoryId: '16', brandId: '6'),
    BrandCategoryModel(categoryId: '17', brandId: '6'),

    // Samsung
    BrandCategoryModel(categoryId: '3', brandId: '10'),
    BrandCategoryModel(categoryId: '15', brandId: '10'),
    BrandCategoryModel(categoryId: '16', brandId: '10'),
    BrandCategoryModel(categoryId: '17', brandId: '10'),
  ];
}
