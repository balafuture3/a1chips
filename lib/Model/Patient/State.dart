class StateList {
  final List<States> details;

  StateList({
    this.details,
  });

  factory StateList.fromJson(
      List<dynamic> parsedJson) {
    List<States> details =
    new List<States>();
    details = parsedJson
        .map((i) => States.fromJson(i))
        .toList();

    return new StateList(details: details);
  }
}


class States {
  int stateId;
  String stateName;

  States({this.stateId, this.stateName});

  States.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    return data;
  }
}
