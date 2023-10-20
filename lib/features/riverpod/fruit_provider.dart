import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/features/models/salad.dart';
import 'package:fruit_app/features/services/salad_service.dart';
import 'package:fruit_app/locator.dart';

final fruitProvider = StateNotifierProvider<HomeProviderNotifier, HomeState>((ref) {
  return HomeProviderNotifier();
});

final class HomeProviderNotifier extends StateNotifier<HomeState> {
  HomeProviderNotifier() : super(const HomeState());

  final SaladService _service = GetItSetup.locator<SaladService>();
  List<Salad> _listSalads = [];
  final List<Salad> _basketList = [];
  final List<Salad> _orderList = [];
  double totalPrice = 0;
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
    for (final i in _basketList) {
      orderTotalPrice += i.price!.toDouble();
    }
    return orderTotalPrice.toString();
  }

  void selectedSalad(Salad? salad) {
    final filteredData = _listSalads.where((element) => element == salad).toList();
    if (filteredData.isNotEmpty) {
      state = state.copyWith(selectedSalad: filteredData);
    } else {
      state = state.copyWith(selectedSalad: []);
    }
  }

  void setPriceincrease(Salad? salad) {
    totalPrice += salad?.price?.toDouble() ?? 0.0;
  }

  void setPriceReduce(Salad? salad) {
    totalPrice -= salad?.price?.toDouble() ?? 0.0;
  }

  void addBasket(Salad? salad) {
    _basketList.add(salad ?? const Salad());
    orderList(salad);
    setPriceincrease(salad);
    state = state.copyWith(basketList: _basketList);
  }

  void removeBasket(Salad? salad) {
    if (_basketList.isNotEmpty) {
      _basketList.remove(salad ?? const Salad());
      setPriceReduce(salad);
      state = state.copyWith(basketList: _basketList);
    } else {
      state = state.copyWith(basketList: []);
    }
  }

  void orderList(Salad? salad) {
    _orderList.add(salad ?? const Salad());
    state = state.copyWith(orderList: _orderList);
  }
}

final class HomeState extends Equatable {
  const HomeState({
    this.orderList,
    this.basketList,
    this.selectedSalad,
    this.salad,
    this.isLoading,
  });
  final List<Salad>? salad;
  final bool? isLoading;
  final List<Salad>? selectedSalad;
  final List<Salad>? orderList;

  final List<Salad>? basketList;

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
  List<Object?> get props => [salad, isLoading, selectedSalad, basketList, orderList];
}
