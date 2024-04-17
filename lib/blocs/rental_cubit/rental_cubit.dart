import '../../data/model/rental.dart';
import '../../util/shared_pref_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
// class RentalCubit extends Cubit<List<Rental>> {
//   final SharedPreferencesService _sharedPreferencesService;
//
//   RentalCubit(this._sharedPreferencesService) : super([]) {
//     _loadrentedBoat();
//   }
//
//   void _loadrentedBoat() async {
//     final rentedBoat = await _sharedPreferencesService.getRentedBoat();
//     emit(rentedBoat);
//   }
//
//   void addRental(Rental rentalBoat) async {
//     final List<Rental> updatedList = List.from(state)..add(rentalBoat);
//     emit(updatedList);
//     await _sharedPreferencesService.saveRentedBoat(updatedList);
//   }
//
//   void updateRentedBoatList(List<Rental> updatedList) async {
//     emit(updatedList);
//     await _sharedPreferencesService.saveRentedBoat(updatedList);
//   }
//
//   void deleteRental(Rental rental) async {
//     final List<Rental> updatedList = List.from(state)..remove(rental);
//     emit(updatedList);
//     await _sharedPreferencesService.saveRentedBoat(updatedList);
//   }
// }
