import 'dart:io';
import '../modules/product.dart';
import 'do_everything.dart';
import 'show_products.dart';

void addProduct() {
  String productName = '';
  String productNumber = '';
  int quantity = 0;
  double price = 0.0;

  //start input product name
  loopPName:
  for (;;) {
    print('-------\nEnter the product name: ');
    productName = stdin.readLineSync()!.toLowerCase();
    if (productName == '-1') {
      print('--------\nExiting the program...');
      exit(0);
    }

    if (productName.isNotEmpty) {
      if (char.hasMatch(productName)) {
        break loopPName;
      } else {
        print('ERROR: Enter a valid name..!');
        continue loopPName;
      }
    } else {
      print('ERROR: Name cannot be empty.!');
      continue loopPName;
    }
  }
  // end input product name

  // start input product number
  loopPNumber:
  for (;;) {
    print('-------\nEnter the product number: ');
    productNumber = stdin.readLineSync()!.toLowerCase().trim();
    if (productNumber == '-1') {
      print('--------\nExiting the program...');
      exit(0);
    }

    if (productNumber.isEmpty) {
      print('ERROR: Product number cannot be empty!');
      continue loopPNumber;
    } else {
      if (charAndNO.hasMatch(productNumber)) {
        bool p = products.any(
            (element) => element.productNumber == productNumber ? true : false);
        if (p == true) {
          print('ERROR: Product number must be unique');
          continue loopPNumber;
        } else {
          break loopPNumber;
        }
      } else {
        print('ERROR: Invalid value.!');
        continue loopPNumber;
      }
    }
  }
  // end input product number

  // start input quantity
  loopQ:
  for (;;) {
    print('-------\nEnter the quantity of product: ');
    quantity = int.tryParse(stdin.readLineSync()!.trim()) ?? 0;
    if (quantity == -1) {
      print('--------\nExiting the program...');
      exit(0);
    }

    if (quantity.isNaN || quantity.isNegative || quantity == 0) {
      print(
          'ERROR: Quantity cannot be empty, letters, zero, decimals and negative value');
      continue loopQ;
    } else {
      break loopQ;
    }
  }
  // end input quantity

  // start input price
  loopP:
  for (;;) {
    print('-------\nEnter the price: ');
    price = double.tryParse(stdin.readLineSync()!.trim()) ?? 0.0;
    if (price == -1) {
      print('--------\nExiting the program...');
      exit(0);
    }

    if (price.isNegative || price.isNaN || price == 0.0) {
      print('ERROR: Price cannot be empty, letters, zero and negative value');
      continue loopP;
    } else {
      break loopP;
    }
  }

  products.add(Product(
      productName: productName,
      productNumber: productNumber,
      quantity: quantity,
      price: price));

  loopYesOrNo:
  for (;;) {
    print('--------------\nThe product added, Do you want add more? Y/N');
    var yesOrNo = stdin.readLineSync()!.toLowerCase().trim();

    if (yesOrNo == 'y') {
      print('---------\nGreat!');
      addProduct();
      break loopYesOrNo;
    } else if (yesOrNo == 'n') {
      print('-------------\nreturning to products list...\n--------------');
      showProducts();
      break loopYesOrNo;
    } else if (yesOrNo == '-1') {
      print('-----------\nExiting the program...');
      exit(0);
    } else {
      print(
          'ERROR: Invalid value, cannot be empty or more than letter or numbers\n\t\tJust answer (Y) for Yes and (N) for No');
      continue loopYesOrNo;
    }
  }
}
