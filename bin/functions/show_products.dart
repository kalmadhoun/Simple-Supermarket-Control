import 'dart:io';
import 'add_product.dart';
import 'do_everything.dart';
import 'remove_product.dart';
import 'search_about_product.dart';
import 'update_product.dart';

void showProducts() {
  if (products.isNotEmpty) {
    loopChoice:
    for(;;){
      print('Product List:');
      for (int i = 0; i < products.length; i++) {
        print(
            '${i + 1}/ Product Name: ${products[i].productName} || Product Number: ${products[i].productNumber} || Quantity: ${products[i].quantity} || Price: ${products[i].price}\$');
      }

      print(
          '-------------\nWhat do you want to do:\n1) Add Product\n2) Remove Product\n3) Update Product\n4) Search by Product Number\n5) Back to Main menu');

      var choose = int.tryParse(stdin.readLineSync()!.trim()) ?? 0;

      if(choose == 1){
        print('------------\nHere we go...');
        addProduct();
        break loopChoice;
      }else if(choose == 2){
        removeProduct();
        break loopChoice;
      }else if(choose == 3){
        updateProduct();
        break loopChoice;
      }else if(choose == 4){
        searchByProductNumber();
        break loopChoice;
      }else if(choose == 5){
        print('-------------\nreturning to products list...\n--------------');
        doWholeThing();
        break loopChoice;
      }else{
        print('ERROR: Invalid value, cannot be empty, letters, zero or negative numbers\n---------------');
        continue loopChoice;
      }
    }
  } else {
    loopYesOrNo:
    for (;;) {
      print('--------------\nNo Products here, Add some! Y/N');
      var yesOrNo = stdin.readLineSync()!.toLowerCase().trim();

      if (yesOrNo == 'y') {
        print('-----------\nNice! Add some products');
        addProduct();
        break loopYesOrNo;
      } else if (yesOrNo == 'n') {
        print('-------------\nreturning to main menu...\n--------------');
        doWholeThing();
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
}
