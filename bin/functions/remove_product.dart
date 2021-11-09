import 'dart:io';
import 'do_everything.dart';
import 'show_products.dart';

void removeProduct() {
  loopPNumber:
  for (;;) {
    print(
        '------------------\nEnter the number of product you want to delete it or cancel to cancel the delete operation');
    var productNumber = stdin.readLineSync()!.toLowerCase().trim();

    if (productNumber.isEmpty || !productNumber.contains(charAndNO)) {
      print(
          'ERROR: Invalid value, cannot be empty or any special characters');
      continue loopPNumber;
    }else if(productNumber == 'cancel'){
      print('-----------\nCanceling...\n-------------');
      showProducts();
      break loopPNumber;
    }else if(productNumber == '-1'){
      print('----------\nExiting the program...');
      exit(0);
    } else {
      if (products.any((element) => element.productNumber == productNumber)) {
        products.removeWhere((element) => element.productNumber == productNumber);
        print('--------------\nRemoving done! Returning to Products List...\n----------------');
        showProducts();
        break loopPNumber;
      } else {
        print('---------------\nERROR: Product not found, Returning to Product List...\n--------------');
        showProducts();
        break loopPNumber;
      }
    }
  }
}
