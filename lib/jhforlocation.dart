import 'package:cloud_firestore/cloud_firestore.dart';
import 'filterforlocation.dart';

Stream<QuerySnapshot> filteredcollectionforlocation(
    FilterForLocation filter, Query collection) {
  if (filter.type != null) {
    collection = collection.where('type', isEqualTo: filter.type);
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
    collection =
        collection.where('doubleprice', isLessThanOrEqualTo: filter.endprice);
  }
  return filter.sortby == null
      ? collection.orderBy('doubleprice').snapshots()
      : filter.sortby == 'ascending'
          ? collection.orderBy('doubleprice', descending : false).snapshots()
          : collection.orderBy('doubleprice', descending : true).snapshots();
}


Stream<QuerySnapshot> filteredcollectionforlocation2(
    FilterForLocation filter2, Query collection) {
  if (filter2.type != null) {
    collection = collection.where('type', isEqualTo: filter2.type);
  }

  if (filter2.bedrooms != null) {
    collection = collection.where('bedrooms', isEqualTo: filter2.bedrooms);
  }
  if (filter2.bathrooms != null) {
    collection = collection.where('bathrooms', isEqualTo: filter2.bathrooms);
  }

  if (filter2.startprice != null) {
    collection = collection.where('doubleprice',
        isGreaterThanOrEqualTo: filter2.startprice);
  }
  if (filter2.endprice != null) {
    collection =
        collection.where('doubleprice', isLessThanOrEqualTo: filter2.endprice);
  }
  return filter2.sortby == null
      ? collection.orderBy('doubleprice').snapshots()
      : filter2.sortby == 'ascending'
          ? collection.orderBy('doubleprice', descending : false).snapshots()
          : collection.orderBy('doubleprice', descending : true).snapshots();
}
