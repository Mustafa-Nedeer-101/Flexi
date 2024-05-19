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
    CategoryModel(id: '6', name: 'Shoes', image: CImages.men, isFeatured: true),
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
        parentId: '3',
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
        name: 'Casual',
        image: CImages.clothesIcon,
        isFeatured: false),
    CategoryModel(
        id: '19',
        name: 'Formal',
        image: CImages.clothesIcon,
        isFeatured: false),
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
        categoryId: '4',
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
        categoryId: '4',
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
        categoryId: '1',
        productType: ProductType.single.toString()),
  ];

  static final List<ProductModel> productsVersionTwo = [
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
            id: '9',
            image: CImages.adidasLogo,
            name: 'Adidas',
            productsCount: 34,
            isFeatured: true), // Nike
        images: [CImages.adidasBootsThumbail, CImages.adidasBootsImage],
        salePrice: 90,
        sku: 'ABR4500',
        categoryId: '1',
        productType: ProductType.single.toString()),
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
    BrandCategoryModel(categoryId: '1', brandId: '1'),
    BrandCategoryModel(categoryId: '4', brandId: '1'),
    BrandCategoryModel(categoryId: '9', brandId: '1'),
    BrandCategoryModel(categoryId: '10', brandId: '1'),
    BrandCategoryModel(categoryId: '11', brandId: '1'),

    // Adidas brand
    BrandCategoryModel(categoryId: '1', brandId: '2'),
    BrandCategoryModel(categoryId: '4', brandId: '2'),
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
