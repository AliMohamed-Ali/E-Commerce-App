import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/services/firestore_services.dart';

abstract  class DatabaseController {
 Stream<List<Product>> productStream();
}

class DatabaseControllerImpl extends DatabaseController {
  final _services = FirestoreServices.instance;
  @override
  Stream<List<Product>> productStream() {
   return _services.collectionStream(
      path: 'products/',
      builder: (data, documentId) => Product.fromMap(data, documentId),
   );
    
   
  }
 
}