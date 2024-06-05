import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neru_lending/main.dart';
import 'package:provider/provider.dart';


class MainEngine extends ChangeNotifier {
  bool? loadingBool = false;
  FirebaseAuth? _firebaseAuth;
  String? currentUserEmail;
  FirebaseFirestore? _firestore;
  Uint8List? welcomePageBG;
  var streamFirestoreSnapshot;

  void intializeApp() async {
    updateLoadingState(true);
    if (await checkConnection()) {
      try {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            appId: '1:174022447226:android:43371f62ee78cf5db9ebc3',
            messagingSenderId: 'sendid',
            projectId: 'nerulending-d0aae',
            storageBucket: 'myapp-b9yt18.appspot.com', apiKey: 'AIzaSyDI-y8yimVQwQ-yRmkhFF_0D36PLKgT-3k',
          ),
        );
        _firebaseAuth = FirebaseAuth.instance;
        _firestore = FirebaseFirestore.instance;
        updateLoadingState(false);
      } catch (e) {
        updateLoadingState(false);
        showSnackBar(ContentType.help, "ServerError",
            "There is an internal error for connecting to the server");
      }
    } else {
      updateLoadingState(false);
      showSnackBar(ContentType.failure, "Network Error",
          "Please check your network connection and try again");
    }
  }

  void updateLoadingState(bool? changeValue) {
    loadingBool = changeValue;
    notifyListeners();
  }

  Future<bool> checkConnection() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  void showSnackBar(
      ContentType contentType, String snackBarTitle, String snackBarMessage) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: snackBarTitle,
        message: snackBarMessage,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
  bool? getLoadingBool() {
    return loadingBool;
  }


  Future<bool> signIN(String? email, String? password) async {
    print(email);
    print(password);
    updateLoadingState(true);
    if (await checkConnection()) {
      try {
        final user = await _firebaseAuth!
            .signInWithEmailAndPassword(email: email!, password: password!);
        print(user.additionalUserInfo);

        if (user != null) {
          currentUserEmail = email;
          showSnackBar(
              ContentType.success, "Success", "Successfully Signed In");
          updateLoadingState(false);
          return true;
        } else {
          updateLoadingState(false);
          showSnackBar(ContentType.failure, "Failed", "Failed to Sign In");
          return false;
        }
      } catch (e) {
        updateLoadingState(false);
        showSnackBar(ContentType.failure, "Failed", "$e");
        return false;
      }
    } else {
      updateLoadingState(false);
      showSnackBar(ContentType.failure, "Network Error",
          "Please check your network connection and try again");
      return false;
    }
  }
}