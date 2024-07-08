import 'dart:convert';

import 'package:coffeeshop/models/coffee.dart';
import 'package:flutter/services.dart';

import '../../core/core.dart';
import '../../core/managers/network/models/response.dart';

abstract class ICoffeeService {
  FutureResponse<Coffee> fetchCoffees();
}

class CoffeeService extends ICoffeeService {
  @override
  FutureResponse<Coffee> fetchCoffees() async {
    return await NetworkManager.instance.fetch<Coffee>(
      model: Coffee(),
      path: Path.coffee.path,
    );
  }
}

class DummyCoffeeService extends ICoffeeService {
  @override
  FutureResponse<Coffee> fetchCoffees() async {
    String jsonString = await rootBundle.loadString('assets/data/data.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<Coffee> dataList = jsonList.map((json) => Coffee().fromJson(json) as Coffee).toList();
    return Response<Coffee>(
      responseList: dataList,
    );
  }
}
