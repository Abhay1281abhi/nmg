import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmg/api/service/dialog_service.dart';
import 'package:nmg/common/locator/locator.dart';
import 'package:nmg/common/constant/color_constants.dart';
import '../../common/custom widget/custom_dailog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/post_bloc.dart';
import '../../bloc/user_bloc.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PostBloc>(context).add(PostRefreshEvent());
    BlocProvider.of<UserBloc>(context).add(UserRefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: (){
        showExitPopup(context);
        return Future.value(false);
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: ColorConstants.blackColor,
          appBar: TabBar(
              tabs: [
                Container(
                  padding:  EdgeInsets.only(top: 20.h),
                  alignment: Alignment.center,
                  child: const Text("Posts"),
                ),
                Container(
                  padding:  EdgeInsets.only(top: 20.h),
                  alignment: Alignment.center,
                  child: const Text("Users",
                  ),
                ),
              ]
          ),
          body:TabBarView(
            children: [
              BlocBuilder<PostBloc,PostState>(
                  builder:(context, state){
                    if(state is PostLoadingState){
                      locator<DialogService>().showLoader();
                    }
                    else if(state is PostSuccessState){
                      locator<DialogService>().hideLoader();
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.response.length,
                          itemBuilder: (context, idx) {
                            return Card(
                              color:Colors.black,
                                child: ExpansionTile(
                                  iconColor: Colors.white,
                                  collapsedIconColor: Colors.white,
                                  backgroundColor:Colors.black,
                                  title: Text(state.response[idx].title??"",style: const TextStyle(color:Colors.white)),
                                  children: [
                                    Text(state.response[idx].body??"",style: const TextStyle(color:Colors.white)),
                                  ],
                                ));
                          });
                    }
                    return Container();
                  }
              ),
              BlocBuilder<UserBloc,UserState>(
                  builder:(context, state){
                    if(state is UserLoadingState){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if(state is UserSuccessState){
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.response.length,
                          itemBuilder: (context, idx) {
                            return Card(
                                color:Colors.black,
                                child: ExpansionTile(
                                  childrenPadding: EdgeInsets.symmetric(horizontal: 15),
                                  tilePadding: EdgeInsets.symmetric(horizontal: 15),
                                  expandedAlignment: Alignment.centerLeft,
                                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                  iconColor: Colors.white,
                                  collapsedIconColor: Colors.white,
                                  backgroundColor:Colors.black,
                                  title: Text("${state.response[idx].name??""}",
                                      style: const TextStyle(color:Colors.white)),
                                  children: [
                                    Text("Name: ${state.response[idx].name??""}",
                                        style: const TextStyle(color:Colors.white)),
                                    Text("UserName: ${state.response[idx].username??""}",
                                        style: const TextStyle(color:Colors.white)),
                                    Text("Phone: ${state.response[idx].phone??""}",
                                        style: const TextStyle(color:Colors.white)),
                                    Text("Website: ${state.response[idx].website??""}",
                                        style: const TextStyle(color:Colors.white)),
                                    Text("Company: ${state.response[idx].company?.name??""}, ${state.response[idx].company?.catchPhrase??""}",
                                        style: const TextStyle(color:Colors.white)),
                                    Text("Address: ${state.response[idx].address?.street??""}, ${state.response[idx].address?.suite??""}, ${state.response[idx].address?.city??""}, ${state.response[idx].address?.zipcode??""}\n${state.response[idx].address?.geo?.lat??""}, ${state.response[idx].address?.geo?.lng??""}",
                                        style: const TextStyle(color:Colors.white)),
                                  ],
                                ));
                          });
                    }
                    return Container();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}



