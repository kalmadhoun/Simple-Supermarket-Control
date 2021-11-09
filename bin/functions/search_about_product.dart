import 'dart:io';
import '../modules/product.dart';
import 'do_everything.dart';
import 'show_products.dart';

void searchByProductNumber() {
  var productNumber = '';

  loopPNumber:
  for (;;) {
    print('---------------\nEnter the number of product you looking for:');
    productNumber = stdin.readLineSync()!.trim();

    if (productNumber.isEmpty || !productNumber.contains(charAndNO)) {
      print('ERROR: Invalid value, cannot be empty or any special characters\n-----------------');
      continue loopPNumber;
    } else if (productNumber == '-1') {
      print('-------------\nExiting...');
      exit(0);
    } else {
      break loopPNumber;
    }
  }

  if (products.any((element) => element.productNumber == productNumber)) {
    Product result = products
        .firstWhere((element) => element.productNumber == productNumber);
    print('-----------\nWe found this:');
    print(''
        'Product Name: ${result.productName} || '
        'Product Number: ${result.productNumber} || '
        'Quantity: ${result.quantity} || '
        'Price: ${result.price}\$');

    print('-----------------\nreturning to main menu...\n------------------');
    doWholeThing();
  } else {
    print('.............\nProduct not found, returning to main menu...\n------------------');
    showProducts();
  }
}
