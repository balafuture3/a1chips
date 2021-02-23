class CustomerListModel {
  List<Data> data;
  int count;

  CustomerListModel({this.data, this.count});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Data {
  String patientId;
  String patientName;
  int patientAge;
  String patientPhone;
  String alterPhone;
  String patientGender;
  String whatsappNumber;
  String patientEmail;
  String state;
  String pincode;
  String address1;
  String address2;
  String address3;
  String parentPosition;
  String fullFaceNotSmiling;
  String fullFacesmiling;
  String rightProfileView;
  String leftProfileView;
  String habits;
  String regNo;
  String whatsupchk;
  String cosentForm;
  String status;
  String lastVisit;
  String nextVisitDate;
  List<Images> images;

  Data(
      {this.patientId,
        this.patientName,
        this.patientAge,
        this.patientPhone,
        this.alterPhone,
        this.patientGender,
        this.whatsappNumber,
        this.patientEmail,
        this.state,
        this.pincode,
        this.address1,
        this.address2,
        this.address3,
        this.parentPosition,
        this.fullFaceNotSmiling,
        this.fullFacesmiling,
        this.rightProfileView,
        this.leftProfileView,
        this.habits,
        this.regNo,
        this.whatsupchk,
        this.cosentForm,
        this.status,
        this.lastVisit,
        this.nextVisitDate,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    patientAge = json['patient_age'];
    patientPhone = json['patient_phone'];
    alterPhone = json['alter_phone'];
    patientGender = json['patient_gender'];
    whatsappNumber = json['whatsapp_number'];
    patientEmail = json['patient_email'];
    state = json['state'];
    pincode = json['pincode'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    parentPosition = json['parentPosition'];
    fullFaceNotSmiling = json['fullFaceNotSmiling'];
    fullFacesmiling = json['fullFacesmiling'];
    rightProfileView = json['rightProfileView'];
    leftProfileView = json['leftProfileView'];
    habits = json['habits'];
    regNo = json['reg_no'];
    whatsupchk = json['whatsupchk'];
    cosentForm = json['cosent_form'];
    status = json['status'];
    lastVisit = json['last_visit'];
    nextVisitDate = json['next_visit_date'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['patient_age'] = this.patientAge;
    data['patient_phone'] = this.patientPhone;
    data['alter_phone'] = this.alterPhone;
    data['patient_gender'] = this.patientGender;
    data['whatsapp_number'] = this.whatsappNumber;
    data['patient_email'] = this.patientEmail;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['parentPosition'] = this.parentPosition;
    data['fullFaceNotSmiling'] = this.fullFaceNotSmiling;
    data['fullFacesmiling'] = this.fullFacesmiling;
    data['rightProfileView'] = this.rightProfileView;
    data['leftProfileView'] = this.leftProfileView;
    data['habits'] = this.habits;
    data['reg_no'] = this.regNo;
    data['whatsupchk'] = this.whatsupchk;
    data['cosent_form'] = this.cosentForm;
    data['status'] = this.status;
    data['last_visit'] = this.lastVisit;
    data['next_visit_date'] = this.nextVisitDate;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String path;
  String type;
  String name;

  Images({this.path, this.type, this.name});

  Images.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}