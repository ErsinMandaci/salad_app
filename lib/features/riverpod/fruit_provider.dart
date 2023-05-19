import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/features/models/salad.dart';
import 'package:fruit_app/features/services/salad_service.dart';
import 'package:fruit_app/locator.dart';

final fruitProvider =
    StateNotifierProvider<HomeProviderNotifier, HomeState>((ref) {
  return HomeProviderNotifier();
});

class HomeProviderNotifier extends StateNotifier<HomeState> {
  HomeProviderNotifier() : super(const HomeState());

  final SaladService _service = locator<SaladService>();
  List<Salad> _listSalads = [];
  //List<Salad> _filteredSalads = [];
  final List<Salad> _basketList = [];
  final List<Salad> _orderList = [];
  double totalPrice = 0.0;
  double orderTotalPrice = 0;

  Future<void> fetchSalad() async {
    state = state.copyWith(isLoading: true);
    final items = await _service.fetchSalads();

    _listSalads = items;
    state = state.copyWith(salad: items);
    state = state.copyWith(isLoading: false);
  }

  String orderTotolPrice() {
    orderTotalPrice = 0.0;
    for (var i in _basketList) {
      orderTotalPrice += i.price!.toDouble();
    }
    return orderTotalPrice.toString();
  }

  void selectedSalad(Salad? salad) {
    final filteredData =
        _listSalads.where((element) => element == salad).toList();
    if (filteredData.isNotEmpty) {
      state = state.copyWith(selectedSalad: filteredData);
    } else {
      const Text('SelectedSalad first hatası');
    }
  }

  void setPriceincrease(Salad? salad) {
    totalPrice += salad?.price?.toDouble() ?? 0.0;
  }

  void setPriceReduce(Salad? salad) {
    totalPrice -= salad?.price?.toDouble() ?? 0.0;
  }

  void addBasket(Salad? salad) {
    _basketList.add(salad ?? Salad());
    orderList(salad);
    setPriceincrease(salad);
    state = state.copyWith(basketList: _basketList);
  }

  void removeBasket(Salad? salad) {
    if (_basketList.isNotEmpty) {
      _basketList.remove(salad ?? Salad());
      setPriceReduce(salad);
      state = state.copyWith(basketList: _basketList);
    } else {}
  }

  void orderList(Salad? salad) {
    _orderList.add(salad ?? Salad());
    state = state.copyWith(orderList: _orderList);
  }
}

class HomeState extends Equatable {
  final List<Salad>? salad;
  final bool? isLoading;
  final List<Salad>? selectedSalad;
  final List<Salad>? orderList;

  final List<Salad>? basketList;

  const HomeState({
    this.orderList,
    this.basketList,
    this.selectedSalad,
    this.salad,
    this.isLoading,
  });

  HomeState copyWith({
    List<Salad>? salad,
    List<Salad>? selectedSalad,
    List<Salad>? basketList,
    List<Salad>? orderList,
    bool? isLoading,
  }) {
    return HomeState(
      orderList: orderList ?? this.orderList,
      basketList: basketList ?? this.basketList,
      selectedSalad: selectedSalad ?? this.selectedSalad,
      salad: salad ?? this.salad,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [salad, isLoading, selectedSalad, basketList, orderList];
}
