
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_font/custom_fonts.dart';
import '../../../../utils/value/app_colors.dart';
import '../../domain/model/dashboard_list_response.dart';

class RecentlyTakenCardView extends StatefulWidget {

  final CompanyDataListResponse objData;

  const RecentlyTakenCardView({
    super.key,
    required this.objData,
  });

  @override
  State<RecentlyTakenCardView> createState() => RecentlyTakenCardViewState();
}

class RecentlyTakenCardViewState extends State<RecentlyTakenCardView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue.withOpacity(0.4), width: 5),
              shape: BoxShape.circle,
              image:((widget.objData.avatar).isNotEmpty && widget.objData.avatar.contains(".jpg")) ? DecorationImage(
                image: NetworkImage(widget.objData.avatar),
                fit: BoxFit.cover,
              ) :  const DecorationImage(
                image: AssetImage('assets/images/ic_profile.jpg'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child: Text(
                widget.objData.name,
                style: const TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeights.regular),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.blue,
            ),
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              widget.objData.role,
              style: const TextStyle(fontSize: 10, color: AppColors.white, fontWeight: FontWeights.regular),
            ),
          ),
        ],
      ),
    );
  }
}
