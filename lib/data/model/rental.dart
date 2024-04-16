class Rental {
  final String type;
  final double cost;
  final String owner;
  final String comment;
  final RentalPeriod rentalPeriod;
  final RentalState state;

  Rental({
    this.type = '',
    this.cost = 0.0,
    this.owner = '',
    this.comment = '',
    this.rentalPeriod = RentalPeriod.monthly,
    this.state = RentalState.average,
  });

  Rental copyWith({
    String? type,
    double? cost,
    String? owner,
    String? comment,
    RentalPeriod? rentalPeriod,
    RentalState? state,
  }) {
    return Rental(
      type: type ?? this.type,
      cost: cost ?? this.cost,
      owner: owner ?? this.owner,
      comment: comment ?? this.comment,
      rentalPeriod: rentalPeriod ?? this.rentalPeriod,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'cost': cost,
      'owner': owner,
      'comment': comment,
      'rentalPeriod': rentalPeriod.name,
      'state': state.name,
    };
  }

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
      type: json['type'],
      cost: (json['cost'] as num).toDouble(),
      owner: json['owner'],
      comment: json['comment'],
      rentalPeriod: RentalPeriod.values.byName(json['rentalPeriod']),
      state: RentalState.values.byName(json['state']),
    );
  }
}

enum RentalPeriod { weekly, monthly, annually }

enum RentalState { perfect, average, bad }
