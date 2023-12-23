// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello!`
  String get hello {
    return Intl.message(
      'Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get signIn {
    return Intl.message(
      'Sign in to your account',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search ...`
  String get search {
    return Intl.message(
      'Search ...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Antibiotic`
  String get Antibiotic {
    return Intl.message(
      'Antibiotic',
      name: 'Antibiotic',
      desc: '',
      args: [],
    );
  }

  /// `Pain Reliever`
  String get painReliever {
    return Intl.message(
      'Pain Reliever',
      name: 'painReliever',
      desc: '',
      args: [],
    );
  }

  /// `Stimulant`
  String get stimulant {
    return Intl.message(
      'Stimulant',
      name: 'stimulant',
      desc: '',
      args: [],
    );
  }

  /// `Sedative`
  String get sedative {
    return Intl.message(
      'Sedative',
      name: 'sedative',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get LogOut {
    return Intl.message(
      'Log out',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get MyOrders {
    return Intl.message(
      'My orders',
      name: 'MyOrders',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get enterValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'enterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters`
  String get atLeastEight {
    return Intl.message(
      'Password must contain at least 8 characters',
      name: 'atLeastEight',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords donot match`
  String get PasswordsDoesnotMatch {
    return Intl.message(
      'Passwords donot match',
      name: 'PasswordsDoesnotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Details`
  String get medicineDetails {
    return Intl.message(
      'Medicine Details',
      name: 'medicineDetails',
      desc: '',
      args: [],
    );
  }

  /// `Scientific Name: `
  String get scientificName {
    return Intl.message(
      'Scientific Name: ',
      name: 'scientificName',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Name: `
  String get commercialName {
    return Intl.message(
      'Commercial Name: ',
      name: 'commercialName',
      desc: '',
      args: [],
    );
  }

  /// `Category: `
  String get category {
    return Intl.message(
      'Category: ',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Company: `
  String get company {
    return Intl.message(
      'Company: ',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Quantity: `
  String get quantity {
    return Intl.message(
      'Quantity: ',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date: `
  String get expirationDate {
    return Intl.message(
      'Expiration Date: ',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get price {
    return Intl.message(
      'Price: ',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `S.P`
  String get SP {
    return Intl.message(
      'S.P',
      name: 'SP',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get AddtoCart {
    return Intl.message(
      'Add to Cart',
      name: 'AddtoCart',
      desc: '',
      args: [],
    );
  }

  /// `Wrong phone number or password`
  String get WrongPhoneOrPass {
    return Intl.message(
      'Wrong phone number or password',
      name: 'WrongPhoneOrPass',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get InvalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'InvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `This list is empty!`
  String get ListIsEmpty {
    return Intl.message(
      'This list is empty!',
      name: 'ListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter Amount`
  String get EnterAmount {
    return Intl.message(
      'Enter Amount',
      name: 'EnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid amount!`
  String get InvalidAmount {
    return Intl.message(
      'Invalid amount!',
      name: 'InvalidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Amount exceeded available quantity`
  String get AmountExceededAvailableQuantity {
    return Intl.message(
      'Amount exceeded available quantity',
      name: 'AmountExceededAvailableQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't submit because wanted amount exceeded available quantity`
  String get CouldnotSubmit {
    return Intl.message(
      'Couldn\'t submit because wanted amount exceeded available quantity',
      name: 'CouldnotSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Removed order from the list`
  String get RemovedOrderFromList {
    return Intl.message(
      'Removed order from the list',
      name: 'RemovedOrderFromList',
      desc: '',
      args: [],
    );
  }

  /// `undo`
  String get undo {
    return Intl.message(
      'undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// ` Are you sure you want to clear order list?`
  String get sureToClear {
    return Intl.message(
      ' Are you sure you want to clear order list?',
      name: 'sureToClear',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get Clear {
    return Intl.message(
      'Clear',
      name: 'Clear',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Submitted order successfully`
  String get SubmitSuccess {
    return Intl.message(
      'Submitted order successfully',
      name: 'SubmitSuccess',
      desc: '',
      args: [],
    );
  }

  /// `http error when tried to submit order`
  String get httpSubmitError {
    return Intl.message(
      'http error when tried to submit order',
      name: 'httpSubmitError',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Submit order list?`
  String get sureToSubmitOrder {
    return Intl.message(
      'Are you sure you want to Submit order list?',
      name: 'sureToSubmitOrder',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Medicine was removed from favorites`
  String get MedicineRemovedFromFavorites {
    return Intl.message(
      'Medicine was removed from favorites',
      name: 'MedicineRemovedFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Medicine was Added to favorites`
  String get MedicineAddedToFavorites {
    return Intl.message(
      'Medicine was Added to favorites',
      name: 'MedicineAddedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Add an order`
  String get AddAnOrder {
    return Intl.message(
      'Add an order',
      name: 'AddAnOrder',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite Medicines`
  String get MyFavoriteMedicines {
    return Intl.message(
      'My Favorite Medicines',
      name: 'MyFavoriteMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get Order {
    return Intl.message(
      'Order',
      name: 'Order',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get Status {
    return Intl.message(
      'Status:',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Total Cost:`
  String get TotalCost {
    return Intl.message(
      'Total Cost:',
      name: 'TotalCost',
      desc: '',
      args: [],
    );
  }

  /// `You haven't placed an order yet!`
  String get havenotPlacedAnOrder {
    return Intl.message(
      'You haven\'t placed an order yet!',
      name: 'havenotPlacedAnOrder',
      desc: '',
      args: [],
    );
  }

  /// `No requested orders yet!`
  String get NoRequestedOrdersYet {
    return Intl.message(
      'No requested orders yet!',
      name: 'NoRequestedOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get MyPreviousOrders {
    return Intl.message(
      'My Orders',
      name: 'MyPreviousOrders',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get Preparing {
    return Intl.message(
      'Preparing',
      name: 'Preparing',
      desc: '',
      args: [],
    );
  }

  /// `Delivering`
  String get Delivering {
    return Intl.message(
      'Delivering',
      name: 'Delivering',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get Received {
    return Intl.message(
      'Received',
      name: 'Received',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any favorite medicines!`
  String get DontHaveFavoriteMedicines {
    return Intl.message(
      'You don\'t have any favorite medicines!',
      name: 'DontHaveFavoriteMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Enter Medicine Name`
  String get EnterMedicineName {
    return Intl.message(
      'Enter Medicine Name',
      name: 'EnterMedicineName',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find medicine, make sure to enter the scientific name correctly!`
  String get WrongSciName {
    return Intl.message(
      'Couldn\'t find medicine, make sure to enter the scientific name correctly!',
      name: 'WrongSciName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Amount`
  String get enterAmount {
    return Intl.message(
      'Enter Amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid amount`
  String get PleaseEnterValidAmount {
    return Intl.message(
      'Please enter a valid amount',
      name: 'PleaseEnterValidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter medicine name first`
  String get EnterMedicineNameFirst {
    return Intl.message(
      'Enter medicine name first',
      name: 'EnterMedicineNameFirst',
      desc: '',
      args: [],
    );
  }

  /// `Order-`
  String get OrderID {
    return Intl.message(
      'Order-',
      name: 'OrderID',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
