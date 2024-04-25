// "Index":"NEPSE",
// "Current":"2,628.37",
// "Points Change":"1.64",
// "%Change":"0.06"

class NepseIndexModel {
  String? index;
  String? pointsChange;
  String? percentageChange;

  NepseIndexModel({this.index, this.pointsChange, this.percentageChange});

  factory NepseIndexModel.fromJson(Map<String, dynamic> json) {
    return NepseIndexModel(
      index: json['Current'],
      pointsChange: json['Points Change'],
      percentageChange: json['%Change'],
    );
  }
}
