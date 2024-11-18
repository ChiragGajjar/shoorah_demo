
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shoorah_test_app/utils/custom_font/custom_fonts.dart';
import 'package:shoorah_test_app/utils/value/app_images.dart';
import 'package:shoorah_test_app/utils/value/app_string.dart';
import 'package:shoorah_test_app/views/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:shoorah_test_app/views/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:shoorah_test_app/views/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../blocs/bloc_status.dart';
import '../../../../utils/value/app_colors.dart';
import '../../domain/repository/repository_store.dart';
import '../widgets/category_card_view.dart';
import '../widgets/recently_taken_card_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  double progressValue = 65;
  final PageController _pageController = PageController();

  String imgURL = 'https://media.istockphoto.com/id/614409688/photo/persevere-with-a-positive-attitude.jpg?s=1024x1024&w=is&k=20&c=VwAIHj1LtXpmQlbpFOvmghNdrz5-mLmMKUUhdMFY8dY=';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(AppString.dashboardTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: const [
          Image(image: AppImages.infoIcon, width: 30,),
          Image(image: AppImages.homeIcon, width: 30,),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: const Text(
                    "Good Morning Reuben!",
                    style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeights.medium),
                  ),
                ),
              ],
            ),

            const Text(
              "Welcome to our free self-assessments! Take charge of your mental health and well-being by exploring these insightful evaluations.",
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeights.regular),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.blue.withOpacity(0.9),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Test",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeights.regular),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            children: [
                              Icon(Icons.light_mode_outlined, color: Colors.white, size: 15,),
                              SizedBox(width: 5),
                              Text(
                                "Self-Discovery Assessment",
                                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeights.regular),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      CircularPercentIndicator(
                        radius: 30.0,
                        lineWidth: 8.0,
                        percent: 0.8,
                        center: Text("${progressValue.toInt()}%", style: const TextStyle(color: AppColors.white),),
                        progressColor: AppColors.blue.withOpacity(0.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),


            ///Category List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonHeaderView(title: AppString.category, onTapViewAll: (){}),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 150,
                  child:BlocProvider(
                    create: (context) => DashboardBloc(dashboardRepo: RepositoryStore.dashboardRepository),
                    child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                      if (state.appStatus == const InitialStatus()) {
                        context.read<DashboardBloc>().add(GetCategoryEvent());
                      }
                      if (state.appStatus.runtimeType == SubmissionLoading().runtimeType) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categoryModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = state.categoryModel[index];
                              return CategoryCardView(objData: item);
                            }
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),

            ///Top Picks List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: const Text(
                    AppString.topPicks,
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeights.medium),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 120,
                  child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.white,
                                    border: Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          image:(imgURL).isNotEmpty ? DecorationImage(
                                            image: NetworkImage(imgURL),
                                            fit: BoxFit.cover,
                                          ) :  const DecorationImage(
                                            image: AssetImage('assets/images/ic_profile.jpg'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Test - 8 Min",
                                                style: TextStyle(fontSize: 10, color: AppColors.black, fontWeight: FontWeights.regular),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: const Text(
                                                  "Personality Test",
                                                  style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeights.medium),
                                                ),
                                              ),
                                              const Text(
                                                "Discover your unique characteristics & understand yourself better.",
                                                style: TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeights.regular),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 5,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                      activeDotColor: Colors.white54,
                      dotHeight: 10,
                      dotColor: Colors.blue,
                      dotWidth: 10,
                    ),
                  ),
                ),
              ],
            ),


            ///Recently Taken List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonHeaderView(title: AppString.recentlyTaken, onTapViewAll: (){}),

                BlocProvider(
                  create: (context) => DashboardBloc(dashboardRepo: RepositoryStore.dashboardRepository),
                  child: BlocBuilder<DashboardBloc, DashboardState>( builder: (context, state) {
                    if (state.appStatus == const InitialStatus()) {
                      context.read<DashboardBloc>().add(DashboardGetEvent());
                    }
                    if (state.appStatus.runtimeType == SubmissionLoading().runtimeType) {
                      return const SizedBox(
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.dashboardCardModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = state.dashboardCardModel[index];
                              return RecentlyTakenCardView(objData: item);
                            }
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


Widget commonHeaderView({required String title, required VoidCallback onTapViewAll}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeights.medium),
        ),
      ),
      InkWell(
        onTap: onTapViewAll,
        child: Container(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: const Text(
            AppString.viewAll,
            style: TextStyle(fontSize: 14, color: AppColors.darkGrey, fontWeight: FontWeights.regular),
          ),
        ),
      ),
    ],
  );
}