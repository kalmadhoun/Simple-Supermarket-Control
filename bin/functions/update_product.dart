import 'dart:io';
import '../modules/product.dart';
import 'do_everything.dart';
import 'show_products.dart';

void updateProduct() {
  var productNumber = '';

  loopPNumber:
  for (;;) {
    print('-------------\nEnter the number of product you want to update it or enter cancel to cancel the operation:');
    productNumber = stdin.readLineSync()!.toLowerCase().trim();

    if (productNumber == '-1') {
      print('------------\nExiting...');
      exit(0);
    } else if (productNumber.isEmpty || !productNumber.contains(charAndNO)) {
      print(
          'ERROR: Invalid value, cannot be empty or any special characters');
      continue loopPNumber;
    }else if(productNumber == 'cancel'){
      print('------------\nCanceling...\n-------------');
      showProducts();
      break loopPNumber;
    } else {
      break loopPNumber;
    }
  }

  Product p1;
  try {
    p1 = products
        .firstWhere((element) => element.productNumber == productNumber);
    print(
        '-------------\nHere the product you want to change it:\nProduct Name: ${p1.productName} || Product Number: ${p1.productNumber} || Quantity: ${p1.quantity} || Price: ${p1.price}');

    var newProductName = '';
    var newProductNumber = '';
    var newQuantity = 0;
    var newPrice = 0.0;

    // start input new product name
    loopNewProductName:
    for (;;) {
      print('----------\nEnter the new product name:');
      newProductName = stdin.readLineSync()!.toLowerCase().trim();

      if (newProductName.isEmpty || !char.hasMatch(newProductName)) {
        print(
            'ERROR: Invalid value, cannot be empty, numbers or special characters!');
        continue loopNewProductName;
      } else if (newProductName == '-1') {
        print('-------------\nExiting...');
        exit(0);
      } else {
        break loopNewProductName;
      }
    }
    // end input new product name

    // start input new product number
    loopNewProductNumber:
    for (;;) {
      print('----------\nEnter the new product number:');
      newProductNumber = stdin.readLineSync()!.toLowerCase().trim();

      if (newProductNumber.isEmpty || !newProductNumber.contains(charAndNO)) {
        print(
            'ERROR: Invalid value, cannot be empty or any special characters\n-----------------');
        continue loopNewProductNumber;
      } else if (newProductNumber == '-1') {
        print('----------------\nExiting...');
        exit(0);
      } else {
        break loopNewProductNumber;
      }
    }
    // end input new product number

    // start input new quantity
    loopNewQuantity:
    for (;;) {
      print('----------\nEnter the quantity:');
      newQuantity = int.tryParse(stdin.readLineSync()!.trim()) ?? 0;

      if (newQuantity == -1) {
        print('-------------\nExiting...');
        exit(0);
      }else if(newQuantity.isNaN || newQuantity.isNegative || newQuantity == 0){
        print(
            'ERROR: Quantity cannot be empty, letters, zero, decimals and negative value');
        continue loopNewQuantity;
      }else{
        break loopNewQuantity;
      }
    }
    // end input new quantity

    //start input new price
    loopNewPrice:
    for(;;){
      print('----------\nEnter the price:');
      newPrice = double.tryParse(stdin.readLineSync()!.trim()) ?? 0.0;

      if(newPrice == -1){
        print('-------------\nExiting...');
        exit(0);
      }else if(newPrice.isNaN || newPrice.isNegative || newPrice == 0.0){
        print('ERROR: Price cannot be empty, letters, zero and negative value');
        continue loopNewPrice;
      }else{
        break loopNewPrice;
      }
    }
    // end input new price

    p1.productName = newProductName;
    p1.productNumber = newProductNumber;
    p1.quantity = newQuantity;
    p1.price = newPrice;

    showProducts();
  } catch (_) {
    print('-----------\nproduct not found! returning to product list');
    showProducts();
  }
}
