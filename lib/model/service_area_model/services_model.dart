class ServiceAreaModel {
  String? _expectedDelivery;
  String? _areaName;
  String? _serviceStatus;
  String? _postalCode;

  ServiceAreaModel(
      {String? expectedDelivery,
      String? areaName,
      String? serviceStatus,
      String? postalCode}) {
    if (expectedDelivery != null) {
      _expectedDelivery = expectedDelivery;
    }
    if (areaName != null) {
      _areaName = areaName;
    }
    if (serviceStatus != null) {
      _serviceStatus = serviceStatus;
    }
    if (postalCode != null) {
      _postalCode = postalCode;
    }
  }

  String? get expectedDelivery => _expectedDelivery;
  set expectedDelivery(String? expectedDelivery) =>
      _expectedDelivery = expectedDelivery;
  String? get areaName => _areaName;
  set areaName(String? areaName) => _areaName = areaName;
  String? get serviceStatus => _serviceStatus;
  set serviceStatus(String? serviceStatus) => _serviceStatus = serviceStatus;
  String? get postalCode => _postalCode;
  set postalCode(String? postalCode) => _postalCode = postalCode;

  ServiceAreaModel.fromJson(Map<String, dynamic> json) {
    _expectedDelivery = json['ExpectedDelivery'];
    _areaName = json['AreaName'];
    _serviceStatus = json['ServiceStatus'];
    _postalCode = json['PostalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ExpectedDelivery'] = _expectedDelivery;
    data['AreaName'] = _areaName;
    data['ServiceStatus'] = _serviceStatus;
    data['PostalCode'] = _postalCode;
    return data;
  }
}
