import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/text_field.dart';
import 'package:flutter/material.dart';

Widget authTextField(TextEditingController controller,String title,hint,{int?maxLength,TextInputType? keyboardType}){
  return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(title,style: GetTextTheme.fs12_regular,),
                          CustomTextfield(
                            hintText: hint,
                            
                            maxLength: maxLength,
                            keyboardType: keyboardType,
                            
                            hintStyle: GetTextTheme.fs14_regular.copyWith(color:AppColors.greylightcolor),
                            border: UnderlineInputBorder(
                            
                              borderSide: BorderSide(color: AppColors.greylightcolor)
                            ),
                            controller: controller,),
                        ],
                      );
}