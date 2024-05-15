import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UCloudHelperFunctions {
  // Any type of snapshot state
  static Widget? checkingSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    // Still waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // No Data
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No Data Found!'),
      );
    }

    // Error
    if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong!'),
      );
    }

    return null;
  }

  // List of snapshots
  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    // Still waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // No Data
    if (!snapshot.hasData || snapshot.data == null) {
      if (nothingFound != null) {
        return nothingFound;
      } else {
        return const Center(
          child: Text('No Data Found!'),
        );
      }
    }

    // Error
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(
        child: Text('Something went wrong!'),
      );
    }

    return null;
  }

  // create a reference with an initial file path and name and retrieve the download URL
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  //
}
