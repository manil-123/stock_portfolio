import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/app/database/share_info_dao.dart';

abstract class CalculationRepository {
  Future<String?> getLTP(String? scrip);
  Future<String?> getChange(String? scrip);
  Future<double?> getLTPDifference(String? scrip);
  Future<double?> getTotalInvestment();
  Future<int?> getTotalSharesCount();
  Future<int?> getTotalStockCount();
  Future<double?> getTotalProfitLoss();
  Future<double?> getCurrentValue();
  Future<double?> profitLossPercentage();
  Future<double?> getTotalDailyProfitLoss();
}

class CalculationRepo implements CalculationRepository {
  final ShareInfoListDAO? shareInfoListDAO;
  final LocalStockListDAO? localStockListDAO;
  CalculationRepo({this.shareInfoListDAO, this.localStockListDAO});

  @override
  Future<String?> getLTP(String? scrip) async {
    var shareInfoList = await shareInfoListDAO!.getShareInfoList();
    for (var i in shareInfoList!.shareInfoList!) {
      if (scrip == i.symbol) {
        return i.ltp!.replaceAll(RegExp(','), '');
      }
    }
    return null;
  }

  @override
  Future<String?> getChange(String? scrip) async {
    var shareInfoList = await shareInfoListDAO!.getShareInfoList();
    for (var i in shareInfoList!.shareInfoList!) {
      if (scrip == i.symbol) {
        return i.change;
      }
    }
    return null;
  }

  @override
  Future<double?> getLTPDifference(String? scrip) async {
    var ltp = await getLTP(scrip);
    var change = await getChange(scrip);
    double? result;
    if (double.parse(change!) > 0) {
      result = double.parse(ltp!) -
          ((100 - double.parse(change)) / 100.0 * double.parse(ltp));
    } else {
      result = ((100 + double.parse(change)) / 100.0 * double.parse(ltp!)) -
          double.parse(ltp);
    }
    return result;
  }

  @override
  Future<double?> getTotalInvestment() async {
    double totalInvestment = 0;
    var localStockList = await localStockListDAO!.getLocalStockList();
    for (var i in localStockList!) {
      totalInvestment = totalInvestment + i.quantity! * i.price!;
    }
    return totalInvestment;
  }

  @override
  Future<int?> getTotalSharesCount() async {
    int sum = 0;
    var localStockList = await localStockListDAO!.getLocalStockList();
    for (var i in localStockList!) {
      sum = sum + i.quantity!;
    }
    return sum;
  }

  @override
  Future<int?> getTotalStockCount() async {
    var localStockList = await localStockListDAO!.getLocalStockList();
    return localStockList!.length;
  }

  @override
  Future<double?> getTotalProfitLoss() async {
    var localStockList = await localStockListDAO!.getLocalStockList();
    double profitLoss = 0;
    for (var i in localStockList!) {
      var ltp = await getLTP(i.scrip);
      profitLoss = profitLoss +
          (i.quantity! * double.parse(ltp!) - i.quantity! * i.price!);
    }
    return profitLoss;
  }

  @override
  Future<double?> getCurrentValue() async {
    var localStockList = await localStockListDAO!.getLocalStockList();
    double currentValue = 0;
    for (var i in localStockList!) {
      var ltp = await getLTP(i.scrip);
      currentValue = currentValue + i.quantity! * double.parse(ltp!);
    }
    return currentValue;
  }

  @override
  Future<double?> profitLossPercentage() async {
    var totalInvestment = await getTotalInvestment();
    var totalProfitLoss = await getTotalProfitLoss();
    var per = (totalProfitLoss! / totalInvestment!) * 100;
    return per;
  }

  @override
  Future<double?> getTotalDailyProfitLoss() async {
    var localStockList = await localStockListDAO!.getLocalStockList();
    double dailyPL = 0;
    for (var i in localStockList!) {
      var individualLTP = await getLTPDifference(i.scrip);
      dailyPL = dailyPL + individualLTP! * i.quantity!;
    }
    return dailyPL;
  }
}
