/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 20:20:56
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-20 09:04:06
 * @Description: EmptyPage
 */
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
            flex: 2,
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child:
                Image.asset('lib/App/Rescoure/defaultIcon/ic_nothing@2x.png'),
          ),
          Text(
            '暂无数据...',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
          ),
          Expanded(
            child: SizedBox(),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
