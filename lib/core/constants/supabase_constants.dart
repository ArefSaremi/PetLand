class SupabaseConstants {
  // tables name
  static const String productsTable = 'products';
  static const String animalsTable = 'animals';
  static const String productTypesTable = 'product_types';
  static const String orders = 'orders';
  static const String orderItems = 'order_items';
  static const String ordersAddress = 'orders_address';

  // Columns of the products table
  static const String productId = 'productid';
  static const String productName = 'productname';
  static const String description = 'description';
  static const String price = 'price';
  static const String stock = 'stock';
  static const String animalId = 'animalid';
  static const String productTypeId = 'producttypeid';
  static const String imageUrl = 'image_url';

  // Columns of the animals table
  static const String animalName = 'animalname';

  // Columns of the product_types table

  static const String productTypeName = 'producttypename';
  // Columns of the order_items table

  static const String orderid = 'orderid';
  static const String quantity = 'quantity';
  static const String total = 'total';
  // Columns of the orders table
  static const String userId = 'userid';
  static const String totalAmount = 'totalamount';
  static const String status = 'status';
  // Columns of the orders_address table
  static const String recipientName = 'recipientname';
  static const String phoneNumber = 'phonenumber';
  static const String addressLine = 'addressline';
  static const String postalCode = 'postalcode';
  static const String additionalNotes = 'additionalnotes';
}
