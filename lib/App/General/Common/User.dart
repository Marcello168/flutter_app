/*
 * @Author: gongyonghui
 * @Date: 2019-09-18 16:35:19
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-18 17:41:26
 * @Description: file content
 */

import 'package:flutter/foundation.dart';

class User {
  /// token
  String token;

  /// 名字
  String name;

  ///手机号码
  String phone;

  //头像
  String avatar;

  User({this.token, this.name, this.phone, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        token: json['token'],
        name: json['name'],
        phone: json['phone'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    return data;
  }
}
