class MarketChart {
  List<List<double>> prices;

  MarketChart({
    required this.prices,
  });

  factory MarketChart.fromJson(Map<String, dynamic> json) {
    return MarketChart(
      prices: List<List<double>>.from(json["prices"]),
    );
  }
}
