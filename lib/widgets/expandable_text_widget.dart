import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/samll_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({ Key? key,required this.text }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 150.px;

  @override
  void initState() {
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContent(),
    );
  }

  Widget _buildContent(){
    return secondHalf.isEmpty ? SmallText(height: 1.5,text: firstHalf,color: AppColors.paraColor,maxLines: null)
     : Column(
      children:[
        SmallText(
          height: 1.5,
          text: hiddenText ? firstHalf + "..." : widget.text,
          maxLines: null,
          color: hiddenText ? AppColors.textColor : AppColors.paraColor,
        ),
        InkWell(
          onTap: (){
            setState(() {
              hiddenText = !hiddenText;
            });
          },
          child: Row(
            children: [
              SmallText(height: 1.5,text: hiddenText ? "Show more" : "Hide",color: AppColors.mainColor,maxLines: null,),
              Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,color: AppColors.mainColor,)
            ],
          ),
        ),
      ],
    );
  }
}