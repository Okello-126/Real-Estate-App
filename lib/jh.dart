import 'package:cloud_firestore/cloud_firestore.dart';

import 'filter.dart';

Stream<QuerySnapshot> filteredcollection(Filter filter, Query collection) {

  if (filter.type != null) {
    collection = collection.where('type', isEqualTo: filter.type);
  }
  if (filter.location != null) {
    collection = collection.where('district', isEqualTo: filter.location);
  }

  if (filter.bedrooms != null) {
    collection = collection.where('bedrooms', isEqualTo: filter.bedrooms);
  }
  if (filter.bathrooms != null) {
    collection = collection.where('bathrooms', isEqualTo: filter.bathrooms);
  }

  if (filter.startprice != null) {
    collection = collection.where('doubleprice',
        isGreaterThanOrEqualTo: filter.startprice);
  }
   if (filter.endprice != null) {
    collection = collection.where('doubleprice',
        isLessThanOrEqualTo: filter.endprice);
  }
  return collection.orderBy('doubleprice').snapshots();
}
