import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/models/listing/listing_model.dart';

class FavoriteRepository {
  static const String _storageKey = 'saved_listings';

  // Save a single listing to the existing list
  Future<void> saveFavorite(ListingModel listing) async {
    final prefs = await SharedPreferences.getInstance();
    
    // 1. Get current saved listings
    List<ListingModel> currentList = await getFavorites();
    
    // 2. Check for duplicates (optional but recommended)
    currentList.removeWhere((item) => item.id == listing.id);
    
    // 3. Add new listing
    currentList.add(listing);
    
    // 4. Convert list of models to list of JSON strings
    List<String> jsonList = currentList
        .map((item) => jsonEncode(item.toJson()))
        .toList();
    
    // 5. Save back to local storage
    await prefs.setStringList(_storageKey, jsonList);
  }

  // Retrieve all saved listings
  Future<List<ListingModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_storageKey);
    
    if (jsonList == null) return [];

    // Map the strings back into ListingModel objects
    return jsonList
        .map((item) => ListingModel.fromJson(jsonDecode(item)))
        .toList();
  }

  // Remove a specific listing by ID
  Future<void> deleteFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<ListingModel> currentList = await getFavorites();
    
    currentList.removeWhere((item) => item.id == id);
    
    List<String> jsonList = currentList
        .map((item) => jsonEncode(item.toJson()))
        .toList();
        
    await prefs.setStringList(_storageKey, jsonList);
  }
}