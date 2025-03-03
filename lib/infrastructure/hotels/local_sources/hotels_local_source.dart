import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HotelsLocalSource {
  static const String _favourHotelsBoxIds = 'favourHotelsBoxIds';
  static const String _favourHotelList = 'favourHotelList';

  Future<void> setFavorHotel(String id) async {
    final hiveBox = await _getBox();

    final currentList = hiveBox.get(_favourHotelList, defaultValue: []) ?? [];

    await hiveBox.put(_favourHotelList, List.from([id, ...currentList]));
  }

  Future<void> deleteFavorHotel(String id) async {
    final hiveBox = await _getBox();

    final currentList = hiveBox.get(_favourHotelList, defaultValue: []) ?? [];

    final newList = List<String>.from(currentList)..remove(id);

    await hiveBox.put(_favourHotelList, newList);
  }

  Future<List<String>> getFavorHotels() async {
    return (await _getBox()).get(_favourHotelList, defaultValue: []) ?? [];
  }

  Future<Box<List<String>>> _getBox() async => await Hive.openBox<List<String>>(_favourHotelsBoxIds);
}
