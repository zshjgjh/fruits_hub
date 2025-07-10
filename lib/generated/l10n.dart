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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Welcome to`
  String get welcometo {
    return Intl.message('Welcome to', name: 'welcometo', desc: '', args: []);
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality.`
  String get splash1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality.',
      name: 'splash1',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest carefully selected fruits. Check the details, photos, and reviews to make sure you choose the perfect fruit.`
  String get splash2 {
    return Intl.message(
      'We offer you the finest carefully selected fruits. Check the details, photos, and reviews to make sure you choose the perfect fruit.',
      name: 'splash2',
      desc: '',
      args: [],
    );
  }

  /// `earch and Shop`
  String get searchandShop {
    return Intl.message(
      'earch and Shop',
      name: 'searchandShop',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `New Account`
  String get newAccount {
    return Intl.message('New Account', name: 'newAccount', desc: '', args: []);
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check Code`
  String get checkCode {
    return Intl.message('Check Code', name: 'checkCode', desc: '', args: []);
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message('Enter Code', name: 'enterCode', desc: '', args: []);
  }

  /// `Resend code`
  String get resendcode {
    return Intl.message('Resend code', name: 'resendcode', desc: '', args: []);
  }

  /// `Phone number`
  String get phonenumber {
    return Intl.message(
      'Phone number',
      name: 'phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password`
  String get createpassword {
    return Intl.message(
      'Create a new password',
      name: 'createpassword',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get unaccountably1 {
    return Intl.message(
      'Don\'t have an account?',
      name: 'unaccountably1',
      desc: '',
      args: [],
    );
  }

  /// `create account`
  String get unaccountably2 {
    return Intl.message(
      'create account',
      name: 'unaccountably2',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Signin with Google`
  String get google {
    return Intl.message(
      'Signin with Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Signin with Facebook`
  String get facebook {
    return Intl.message(
      'Signin with Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Signin with Apple`
  String get apple {
    return Intl.message('Signin with Apple', name: 'apple', desc: '', args: []);
  }

  /// `By creating an account, you agree to our`
  String get terms1 {
    return Intl.message(
      'By creating an account, you agree to our',
      name: 'terms1',
      desc: '',
      args: [],
    );
  }

  /// ` terms and conditions.`
  String get terms2 {
    return Intl.message(
      ' terms and conditions.',
      name: 'terms2',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get createnewaccount {
    return Intl.message(
      'Create new account',
      name: 'createnewaccount',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get haveaccount {
    return Intl.message(
      'Have an account?',
      name: 'haveaccount',
      desc: '',
      args: [],
    );
  }

  /// `please agree terms`
  String get agreeterms {
    return Intl.message(
      'please agree terms',
      name: 'agreeterms',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry, just enter your email and we’ll send you a reset link.`
  String get dontworry {
    return Intl.message(
      'Don’t worry, just enter your email and we’ll send you a reset link.',
      name: 'dontworry',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password to log in.`
  String get createnewpasswordtologin {
    return Intl.message(
      'Create a new password to log in.',
      name: 'createnewpasswordtologin',
      desc: '',
      args: [],
    );
  }

  /// `Look for`
  String get lookfor {
    return Intl.message('Look for', name: 'lookfor', desc: '', args: []);
  }

  // skipped getter for the 'goodmorning!' key

  /// `Best seller`
  String get bestseller {
    return Intl.message('Best seller', name: 'bestseller', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Recent search`
  String get recentsearch {
    return Intl.message(
      'Recent search',
      name: 'recentsearch',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortby {
    return Intl.message('Sort by', name: 'sortby', desc: '', args: []);
  }

  /// `Price: `
  String get price {
    return Intl.message('Price: ', name: 'price', desc: '', args: []);
  }

  /// `to`
  String get to {
    return Intl.message('to', name: 'to', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Hi`
  String get hi {
    return Intl.message('Hi', name: 'hi', desc: '', args: []);
  }

  /// `Show more`
  String get showmore {
    return Intl.message('Show more', name: 'showmore', desc: '', args: []);
  }

  /// `Loading....`
  String get loading {
    return Intl.message('Loading....', name: 'loading', desc: '', args: []);
  }

  /// `Fail to fetch products...please try later`
  String get failloading {
    return Intl.message(
      'Fail to fetch products...please try later',
      name: 'failloading',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Success submit review`
  String get successreview {
    return Intl.message(
      'Success submit review',
      name: 'successreview',
      desc: '',
      args: [],
    );
  }

  /// `Fail submit review...please try again later`
  String get failreview {
    return Intl.message(
      'Fail submit review...please try again later',
      name: 'failreview',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submitreview {
    return Intl.message(
      'Submit Review',
      name: 'submitreview',
      desc: '',
      args: [],
    );
  }

  /// `please give rating`
  String get rating {
    return Intl.message(
      'please give rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Write review`
  String get writereview {
    return Intl.message(
      'Write review',
      name: 'writereview',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addtocart {
    return Intl.message('Add to cart', name: 'addtocart', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Delete all`
  String get deleteall {
    return Intl.message('Delete all', name: 'deleteall', desc: '', args: []);
  }

  /// `No search results`
  String get nosearchresult {
    return Intl.message(
      'No search results',
      name: 'nosearchresult',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `You have`
  String get youhave {
    return Intl.message('You have', name: 'youhave', desc: '', args: []);
  }

  /// `Items in cart`
  String get itemsincart {
    return Intl.message(
      'Items in cart',
      name: 'itemsincart',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get cartempty {
    return Intl.message('Cart is empty', name: 'cartempty', desc: '', args: []);
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Edit address`
  String get editaddress {
    return Intl.message(
      'Edit address',
      name: 'editaddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter new address`
  String get enternewaddress {
    return Intl.message(
      'Enter new address',
      name: 'enternewaddress',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message('save', name: 'save', desc: '', args: []);
  }

  /// `Order number`
  String get ordernumber {
    return Intl.message(
      'Order number',
      name: 'ordernumber',
      desc: '',
      args: [],
    );
  }

  /// `Ordered at`
  String get orderedat {
    return Intl.message('Ordered at', name: 'orderedat', desc: '', args: []);
  }

  /// `Items Count`
  String get itemscount {
    return Intl.message('Items Count', name: 'itemscount', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `payment`
  String get payment {
    return Intl.message('payment', name: 'payment', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Flat number`
  String get flat {
    return Intl.message('Flat number', name: 'flat', desc: '', args: []);
  }

  /// `Save address`
  String get saveaddress {
    return Intl.message(
      'Save address',
      name: 'saveaddress',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Fail fetch order...please try later`
  String get failfetchorder {
    return Intl.message(
      'Fail fetch order...please try later',
      name: 'failfetchorder',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get orderdetails {
    return Intl.message(
      'Order details',
      name: 'orderdetails',
      desc: '',
      args: [],
    );
  }

  /// `Order following`
  String get orderfollowing {
    return Intl.message(
      'Order following',
      name: 'orderfollowing',
      desc: '',
      args: [],
    );
  }

  /// `Order accepted`
  String get orderaccepted {
    return Intl.message(
      'Order accepted',
      name: 'orderaccepted',
      desc: '',
      args: [],
    );
  }

  /// `Order Shipping`
  String get ordershipping {
    return Intl.message(
      'Order Shipping',
      name: 'ordershipping',
      desc: '',
      args: [],
    );
  }

  /// `Order out for delivery`
  String get orderout {
    return Intl.message(
      'Order out for delivery',
      name: 'orderout',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered`
  String get orderdelivered {
    return Intl.message(
      'Order delivered',
      name: 'orderdelivered',
      desc: '',
      args: [],
    );
  }

  /// `Fail to complete order...please try again later`
  String get failcompleteorder {
    return Intl.message(
      'Fail to complete order...please try again later',
      name: 'failcompleteorder',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary:`
  String get ordersumary {
    return Intl.message(
      'Order Summary:',
      name: 'ordersumary',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subtotal {
    return Intl.message('Sub Total', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Confirm your order`
  String get confirmorder {
    return Intl.message(
      'Confirm your order',
      name: 'confirmorder',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentmethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentmethod',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Please select shipping option`
  String get shipoption {
    return Intl.message(
      'Please select shipping option',
      name: 'shipoption',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method`
  String get selectpaymentmethod {
    return Intl.message(
      'Please select payment method',
      name: 'selectpaymentmethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment online`
  String get paymentonline {
    return Intl.message(
      'Payment online',
      name: 'paymentonline',
      desc: '',
      args: [],
    );
  }

  /// `Payment on delivery`
  String get paymentondelivery {
    return Intl.message(
      'Payment on delivery',
      name: 'paymentondelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery on place`
  String get deliveryonplace {
    return Intl.message(
      'Delivery on place',
      name: 'deliveryonplace',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get myaccount {
    return Intl.message('My account', name: 'myaccount', desc: '', args: []);
  }

  /// `My profile`
  String get myprofile {
    return Intl.message('My profile', name: 'myprofile', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Choose Language`
  String get chooselanguge {
    return Intl.message(
      'Choose Language',
      name: 'chooselanguge',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `About us`
  String get aboutus {
    return Intl.message('About us', name: 'aboutus', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Our Products`
  String get ourproducts {
    return Intl.message(
      'Our Products',
      name: 'ourproducts',
      desc: '',
      args: [],
    );
  }

  /// `Fail to fetch search history`
  String get failfetchsearchhistory {
    return Intl.message(
      'Fail to fetch search history',
      name: 'failfetchsearchhistory',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Personal Information`
  String get personalinformation {
    return Intl.message(
      'Personal Information',
      name: 'personalinformation',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldrequired {
    return Intl.message(
      'This field is required',
      name: 'fieldrequired',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentpassword {
    return Intl.message(
      'Current Password',
      name: 'currentpassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmnewpassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmnewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changepassword {
    return Intl.message(
      'Change Password',
      name: 'changepassword',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get savechanges {
    return Intl.message(
      'Save Changes',
      name: 'savechanges',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get wait {
    return Intl.message('Waiting', name: 'wait', desc: '', args: []);
  }

  /// `+ Add new payment method`
  String get addnewpayment {
    return Intl.message(
      '+ Add new payment method',
      name: 'addnewpayment',
      desc: '',
      args: [],
    );
  }

  /// `Add new card`
  String get addcard {
    return Intl.message('Add new card', name: 'addcard', desc: '', args: []);
  }

  /// `Card holder name`
  String get cardholde {
    return Intl.message(
      'Card holder name',
      name: 'cardholde',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get cardnumber {
    return Intl.message('Card number', name: 'cardnumber', desc: '', args: []);
  }

  /// `Expiration date`
  String get expdate {
    return Intl.message('Expiration date', name: 'expdate', desc: '', args: []);
  }

  /// `CVV`
  String get cvv {
    return Intl.message('CVV', name: 'cvv', desc: '', args: []);
  }

  /// `Save as virtual card`
  String get savevirtualcard {
    return Intl.message(
      'Save as virtual card',
      name: 'savevirtualcard',
      desc: '',
      args: [],
    );
  }

  /// `Fail fetch products ..please check internet connection`
  String get failfetchproducts {
    return Intl.message(
      'Fail fetch products ..please check internet connection',
      name: 'failfetchproducts',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get failfetchsearchedproducts {
    return Intl.message(
      'Not found',
      name: 'failfetchsearchedproducts',
      desc: '',
      args: [],
    );
  }

  /// `check for cards`
  String get cardcheck {
    return Intl.message(
      'check for cards',
      name: 'cardcheck',
      desc: '',
      args: [],
    );
  }

  /// `No cards are added`
  String get nocards {
    return Intl.message(
      'No cards are added',
      name: 'nocards',
      desc: '',
      args: [],
    );
  }

  /// `Success Add Card`
  String get successaddcard {
    return Intl.message(
      'Success Add Card',
      name: 'successaddcard',
      desc: '',
      args: [],
    );
  }

  /// `Fail add card`
  String get failaddcard {
    return Intl.message(
      'Fail add card',
      name: 'failaddcard',
      desc: '',
      args: [],
    );
  }

  /// `Card added successfully`
  String get successAddCard {
    return Intl.message(
      'Card added successfully',
      name: 'successAddCard',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add card`
  String get failAddCard {
    return Intl.message(
      'Failed to add card',
      name: 'failAddCard',
      desc: '',
      args: [],
    );
  }

  /// `Card number must be exactly 8 digits`
  String get invalidCardNumber {
    return Intl.message(
      'Card number must be exactly 8 digits',
      name: 'invalidCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myorders {
    return Intl.message('My Orders', name: 'myorders', desc: '', args: []);
  }

  /// `No favorite items founded`
  String get nofavorite {
    return Intl.message(
      'No favorite items founded',
      name: 'nofavorite',
      desc: '',
      args: [],
    );
  }

  /// `Special offers`
  String get specialoffers {
    return Intl.message(
      'Special offers',
      name: 'specialoffers',
      desc: '',
      args: [],
    );
  }

  /// `25% off`
  String get discount {
    return Intl.message('25% off', name: 'discount', desc: '', args: []);
  }

  /// `Shop now`
  String get shopnow {
    return Intl.message('Shop now', name: 'shopnow', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `About us`
  String get aboitus {
    return Intl.message('About us', name: 'aboitus', desc: '', args: []);
  }

  /// `Profile updated successfully.`
  String get profileupdatedsuccessfully {
    return Intl.message(
      'Profile updated successfully.',
      name: 'profileupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'confirmyournewpassword.' key

  /// `Password do not match.`
  String get match {
    return Intl.message(
      'Password do not match.',
      name: 'match',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current Password`
  String get enterCurrentPassword {
    return Intl.message(
      'Enter Current Password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  // skipped getter for the 'enteryourcurrentpassword.' key

  /// `Password must be at least 6 characters long.`
  String get passwordmustbeatleast6 {
    return Intl.message(
      'Password must be at least 6 characters long.',
      name: 'passwordmustbeatleast6',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our restaurant, where authentic flavor meets high quality and exceptional service.\nWe offer a wide variety of dishes carefully prepared with fresh, daily ingredients to provide you with an unforgettable dining experience that satisfies every taste.\n\nWhether you're a fan of traditional cuisine or looking for a modern twist on your favorite meals, our kitchen blends authenticity and creativity in every dish.\nWe are committed to creating a comfortable atmosphere and providing top-notch service, because your comfort and satisfaction are our top priorities.\n\n📞 Contact Us\n📍 Address: Riyadh – Al-Nakheel District, Prince Turki Al Awwal Street\n📧 Email: info@tastyrestaurant.com\n📱 Mobile: +966 55 123 4567\n☎️ Landline: +966 11 876 5432\n\n⏰ Opening Hours: Daily from 12:00 PM to 12:00 AM`
  String get us {
    return Intl.message(
      'Welcome to our restaurant, where authentic flavor meets high quality and exceptional service.\nWe offer a wide variety of dishes carefully prepared with fresh, daily ingredients to provide you with an unforgettable dining experience that satisfies every taste.\n\nWhether you\'re a fan of traditional cuisine or looking for a modern twist on your favorite meals, our kitchen blends authenticity and creativity in every dish.\nWe are committed to creating a comfortable atmosphere and providing top-notch service, because your comfort and satisfaction are our top priorities.\n\n📞 Contact Us\n📍 Address: Riyadh – Al-Nakheel District, Prince Turki Al Awwal Street\n📧 Email: info@tastyrestaurant.com\n📱 Mobile: +966 55 123 4567\n☎️ Landline: +966 11 876 5432\n\n⏰ Opening Hours: Daily from 12:00 PM to 12:00 AM',
      name: 'us',
      desc: '',
      args: [],
    );
  }

  /// `Card holder name is required`
  String get requiredCardName {
    return Intl.message(
      'Card holder name is required',
      name: 'requiredCardName',
      desc: '',
      args: [],
    );
  }

  /// `Card holder name is too short`
  String get shortCardName {
    return Intl.message(
      'Card holder name is too short',
      name: 'shortCardName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid card holder name`
  String get invalidCardName {
    return Intl.message(
      'Invalid card holder name',
      name: 'invalidCardName',
      desc: '',
      args: [],
    );
  }

  /// `Card number is required`
  String get requiredCardNumber {
    return Intl.message(
      'Card number is required',
      name: 'requiredCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Card number must be exactly 16 digits`
  String get cardNumberDigits {
    return Intl.message(
      'Card number must be exactly 16 digits',
      name: 'cardNumberDigits',
      desc: '',
      args: [],
    );
  }

  /// `Expiry date is required`
  String get requiredExpiryDate {
    return Intl.message(
      'Expiry date is required',
      name: 'requiredExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format, use MM/YY`
  String get invalidExpiryFormat {
    return Intl.message(
      'Invalid format, use MM/YY',
      name: 'invalidExpiryFormat',
      desc: '',
      args: [],
    );
  }

  /// `Invalid expiry date`
  String get invalidExpiryDate {
    return Intl.message(
      'Invalid expiry date',
      name: 'invalidExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Card has expired`
  String get cardExpired {
    return Intl.message(
      'Card has expired',
      name: 'cardExpired',
      desc: '',
      args: [],
    );
  }

  /// `CVV is required`
  String get requiredCVV {
    return Intl.message(
      'CVV is required',
      name: 'requiredCVV',
      desc: '',
      args: [],
    );
  }

  /// `CVV must be exactly 3 digits`
  String get cvvDigits {
    return Intl.message(
      'CVV must be exactly 3 digits',
      name: 'cvvDigits',
      desc: '',
      args: [],
    );
  }

  /// `fail delete search history`
  String get faildeletesearchhistory {
    return Intl.message(
      'fail delete search history',
      name: 'faildeletesearchhistory',
      desc: '',
      args: [],
    );
  }

  /// `Name is required.`
  String get requiredName {
    return Intl.message(
      'Name is required.',
      name: 'requiredName',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short.`
  String get shortName {
    return Intl.message(
      'Name is too short.',
      name: 'shortName',
      desc: '',
      args: [],
    );
  }

  /// `Name contains invalid characters.`
  String get invalidName {
    return Intl.message(
      'Name contains invalid characters.',
      name: 'invalidName',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get requiredEmail {
    return Intl.message(
      'Email is required.',
      name: 'requiredEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required.`
  String get requiredPhone {
    return Intl.message(
      'Phone number is required.',
      name: 'requiredPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number.`
  String get invalidPhone {
    return Intl.message(
      'Please enter a valid phone number.',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Address is required.`
  String get requiredAddress {
    return Intl.message(
      'Address is required.',
      name: 'requiredAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address is too short.`
  String get shortAddress {
    return Intl.message(
      'Address is too short.',
      name: 'shortAddress',
      desc: '',
      args: [],
    );
  }

  /// `City is required.`
  String get requiredCity {
    return Intl.message(
      'City is required.',
      name: 'requiredCity',
      desc: '',
      args: [],
    );
  }

  /// `City name is too short.`
  String get shortCity {
    return Intl.message(
      'City name is too short.',
      name: 'shortCity',
      desc: '',
      args: [],
    );
  }

  /// `City contains invalid characters.`
  String get invalidCity {
    return Intl.message(
      'City contains invalid characters.',
      name: 'invalidCity',
      desc: '',
      args: [],
    );
  }

  /// `Flat number is required.`
  String get requiredFlatNumber {
    return Intl.message(
      'Flat number is required.',
      name: 'requiredFlatNumber',
      desc: '',
      args: [],
    );
  }

  /// `Flat number contains invalid characters.`
  String get invalidFlatNumber {
    return Intl.message(
      'Flat number contains invalid characters.',
      name: 'invalidFlatNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get emailRequired {
    return Intl.message(
      'Email is required.',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required.`
  String get passwordRequired {
    return Intl.message(
      'Password is required.',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters.`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters.',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Name is required.`
  String get nameRequired {
    return Intl.message(
      'Name is required.',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `We send you a verification email`
  String get verifyemail {
    return Intl.message(
      'We send you a verification email',
      name: 'verifyemail',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get checkemail {
    return Intl.message(
      'Check your email',
      name: 'checkemail',
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
