import 'dart:io';
import '../modules/product.dart';
import 'show_products.dart';

List<Product> products = [];

RegExp char = RegExp(r"[a-z]");
RegExp charAndNO = RegExp(r"[a-z0-9]");
RegExp numbers = RegExp(r"[0-9]");

void doWholeThing() {
  stdout.writeln(
      'Please choose what do you want to do?\n1) Show All Products\nif you want to exit this program anytime, Enter -1');

  int? choose;
  try {
    choose = int.parse(stdin.readLineSync()!);
  } on FormatException {
    print("-----------------\nEnter only numbers!,\nreturning to main...\n---------------");
    doWholeThing();
  }

  if (choose == -1) {
    print('-----------\nExiting...');
    exit(0);
  }

  switch (choose) {
    case 1:
      print('-----------\nShowing all products...\n---------------');
      return showProducts();
    default:
      print('--------------\nInvalid number!\nreturning to main menu...\n------------');
      doWholeThing();
  }
}
