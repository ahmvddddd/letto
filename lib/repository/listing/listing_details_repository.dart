import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/models/listing/listing_details_model.dart';

class ListingDetailsRepository {
  static const String _storageKey = 'cached_listing_details';

  /// Saves or updates a full listing detail in the local storage
  Future<void> saveListingDetail(ListingDetailsModel listing) async {
    final prefs = await SharedPreferences.getInstance();
    
    // 1. Fetch existing details
    List<ListingDetailsModel> currentDetails = await getAllSavedDetails();
    
    // 2. Remove existing entry of the same ID to avoid duplicates
    currentDetails.removeWhere((item) => item.id == listing.id);
    
    // 3. Add the new detail model
    currentDetails.add(listing);
    
    // 4. Serialize the list to JSON strings
    List<String> jsonList = currentDetails
        .map((item) => jsonEncode(item.toJson()))
        .toList();
    
    // 5. Persist to SharedPreferences
    await prefs.setStringList(_storageKey, jsonList);
  }

  /// Retrieves a specific listing detail by its ID
  Future<ListingDetailsModel?> getListingDetailById(String id) async {
    final List<ListingDetailsModel> allDetails = await getAllSavedDetails();
    try {
      return allDetails.firstWhere((item) => item.id == id);
    } catch (e) {
      return null; // Return null if not found locally
    }
  }

  /// Retrieves all cached listing details
  Future<List<ListingDetailsModel>> getAllSavedDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_storageKey);
    
    if (jsonList == null) return [];

    return jsonList
        .map((item) => ListingDetailsModel.fromJson(jsonDecode(item)))
        .toList();
  }

  /// Deletes a specific detail entry from storage
  Future<void> deleteListingDetail(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<ListingDetailsModel> currentDetails = await getAllSavedDetails();
    
    currentDetails.removeWhere((item) => item.id == id);
    
    List<String> jsonList = currentDetails
        .map((item) => jsonEncode(item.toJson()))
        .toList();
        
    await prefs.setStringList(_storageKey, jsonList);
  }

  /// Clears all saved listing details
  Future<void> clearAllDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}