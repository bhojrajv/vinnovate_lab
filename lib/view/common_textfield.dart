import 'package:flutter/material.dart';
import 'package:vinnovate_task/Appconst/appcolors.dart';

class TextFieldForms extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final Widget? icons;
 final String?flag;
 final Widget? sufix;
 final bool?toggleEye;
  const TextFieldForms({this.toggleEye=true,required this.controller,this.flag,this.label,this.icons,this.sufix,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.bold),),
        SizedBox(height: 8,),
        TextFormField(obscureText:flag=="pass"? toggleEye??false:false, controller: controller,decoration: InputDecoration(border: OutlineInputBorder(borderRadius
            : BorderRadius.circular(10.0),borderSide: BorderSide.none),label: Text("$label"),hintText: '$label',prefixIcon: icons,enabled: true,
        filled: true,fillColor: AppcColors.txtgrey,isDense: true,suffixIcon:flag=="pass"? sufix:SizedBox(),),),
      ],
    );
  }
}
