
import 'package:flutter/material.dart';

import '../../../../utils/custom_font/custom_fonts.dart';
import '../../../../utils/value/app_colors.dart';
import '../../domain/model/category_list_response.dart';

class CategoryCardView extends StatefulWidget {

  final CategoryListResponse objData;

  const CategoryCardView({
    super.key,
    required this.objData,
  });

  @override
  State<CategoryCardView> createState() => CategoryCardViewState();
}

class CategoryCardViewState extends State<CategoryCardView> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.all(6),
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:((widget.objData.image).isNotEmpty && (widget.objData.image.contains(".jpg") || widget.objData.image.contains(".jpeg"))) ? DecorationImage(
                    image: NetworkImage(widget.objData.image),
                    fit: BoxFit.cover,
                  ) :  const DecorationImage(
                    image: AssetImage('assets/images/ic_profile.jpg'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.objData.name,
              style: const TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeights.regular),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            "3 Quizzes",
            style: TextStyle(fontSize: 10, color: AppColors.black, fontWeight: FontWeights.regular),
          ),
        ],
      ),
    );
  }
}
