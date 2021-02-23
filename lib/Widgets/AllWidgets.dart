import 'package:a1chips/Screens/LoginPage.dart';
import 'package:flutter/material.dart';

class Widgetsfield
{
  Widget myTextField(icon,controller,label,void action(),suffix)
  {
    return Container(
      margin: EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        obscureText: controller==LoginPageState.PasswordController?LoginPageState.toggle==Icons.visibility?true:false:false,
        decoration: InputDecoration(
            enabled: true,
            prefixIcon: icon,
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            suffixIcon: suffix!=null?suffix:null
        ),
        onSubmitted: (value){
          action();
        },
      ),
    );
  }
  Widget myButton(label, void action(),width)
  {
    return Container(
      width: width,
      child: RaisedButton(onPressed: action,

      child: Text(label,style: TextStyle(color: Colors.white),),
      color: Color.fromRGBO(162,206,41, 1),
      padding: EdgeInsets.all(16),

      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }
  Widget myImageAsset(asset,void action(),context,height,width)
  {
    return Image.asset(asset,height: height,width: width,);
  }
}

