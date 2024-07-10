
import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/application_widget.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/custom_appbar.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_blocks.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_events.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_states.dart';
import 'package:elearning_app_bloc/pages/others/home/home_controller.dart';
import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _index = 0;

  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }



  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile!=null?Scaffold(
      appBar: buildAppBar(_homeController.userProfile!.avatar.toString()),
      body: BlocBuilder<HomePageBlocks, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: buildHomePageTitle("hello",
                      color: AppColors.primaryThreeElementText),
                ),
                SliverToBoxAdapter(child: buildHomePageTitle(_homeController.userProfile.name!)),
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                ),
                SliverToBoxAdapter(child: buildSearchView()),
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                ),
                SliverToBoxAdapter(child: buildSlidersView(context, state)),
                SliverToBoxAdapter(child: buildSlidersView(context, state)),
                SliverToBoxAdapter(child: buildMenuView()),
                SliverPadding(padding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 0.w
                )),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (context, index) {
                    return GestureDetector(
                      onTap: () {
                        
                      },
                      child: courseGrid(),
                      
                    );
                  },), 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                    ),
                  ),

                SliverFillRemaining(
                  child: BlocBuilder<AppBlocs, AppState>(
                    builder: (context, state) {
                      return Container(
                        color: Colors.white,
                        child: SafeArea(
                          child: Scaffold(
                            body: buildPage(_index),
                            bottomNavigationBar: Container(
                              width: 375.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.h),
                                  topRight: Radius.circular(20.h),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                ],
                              ),
                              child: BottomNavigationBar(
                                elevation: 0,
                                currentIndex: _index,
                                type: BottomNavigationBarType.fixed,
                                showSelectedLabels: false,
                                showUnselectedLabels: false,
                                selectedItemColor: AppColors.primaryElement,
                                unselectedItemColor:
                                    AppColors.primaryFourElementText,
                                onTap: (value) {
                                  // Dispatch event to change state
                                  context
                                      .read<HomePageBlocks>()
                                      .add(TriggerAppEvent(value) as HomePageEvents);
                                  setState(() {
                                    _index = value;
                                  });
                                },
                                items: bottomTabs,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ): Container(
      child: Center(child: Text("Data Not Found")),
    );
  }

  Container courseGrid() {
    return Container(
                      padding: EdgeInsetsDirectional.all(12.w),
                      width: 100.w,
                      height: 100.h,
                      color: Colors.red,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.w),
                        image: DecorationImage(
                          image: AssetImage(
                            
                            "assets/icons/image.png"), fit: BoxFit.fill),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Best course for IT and Engineering", 
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: TextStyle(
                            color: AppColors.primaryElementText,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                          ),
                          ),
                          SizedBox(height: 5.h,),
                          Text("Best course for IT", 
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: TextStyle(
                            color: AppColors.primaryFourElementText,
                            fontWeight: FontWeight.bold,
                            fontSize: 8.sp,
                          ),),
                        ],
                      ),
                    );
  }
}
