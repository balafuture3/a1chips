class LoginResponse {
  Menus menus;
  String tokenType;
  bool status;
  String alert;
  String authUser;
  String authUserRole;
  String authUserRolename;

  LoginResponse(
      {this.menus,
        this.tokenType,
        this.status,
        this.alert,
        this.authUser,
        this.authUserRole,
        this.authUserRolename});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    menus = json['menus'] != null ? new Menus.fromJson(json['menus']) : null;
    tokenType = json['token_type'];
    status = json['status'];
    alert = json['alert'];
    authUser = json['auth_user'];
    authUserRole = json['auth_user_role'];
    authUserRolename = json['auth_user_rolename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menus != null) {
      data['menus'] = this.menus.toJson();
    }
    data['token_type'] = this.tokenType;
    data['status'] = this.status;
    data['alert'] = this.alert;
    data['auth_user'] = this.authUser;
    data['auth_user_role'] = this.authUserRole;
    data['auth_user_rolename'] = this.authUserRolename;
    return data;
  }
}

class Menus {
  List<Data> data;
  int treatment;

  Menus({this.data, this.treatment});

  Menus.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    treatment = json['treatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['treatment'] = this.treatment;
    return data;
  }
}

class Data {
  String title;
  int menuId;
  String page;
  String icon;
  int rrMenuCheck;
  int rrCreate;
  int rrRead;
  int rrUpdate;
  int rrDelete;

  Data(
      {this.title,
        this.menuId,
        this.page,
        this.icon,
        this.rrMenuCheck,
        this.rrCreate,
        this.rrRead,
        this.rrUpdate,
        this.rrDelete});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    menuId = json['menu_id'];
    page = json['page'];
    icon = json['icon'];
    rrMenuCheck = json['rr_menu_check'];
    rrCreate = json['rr_create'];
    rrRead = json['rr_read'];
    rrUpdate = json['rr_update'];
    rrDelete = json['rr_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['menu_id'] = this.menuId;
    data['page'] = this.page;
    data['icon'] = this.icon;
    data['rr_menu_check'] = this.rrMenuCheck;
    data['rr_create'] = this.rrCreate;
    data['rr_read'] = this.rrRead;
    data['rr_update'] = this.rrUpdate;
    data['rr_delete'] = this.rrDelete;
    return data;
  }
}