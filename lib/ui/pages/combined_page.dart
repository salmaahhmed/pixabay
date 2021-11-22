import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/di/di.dart';
import 'package:pixabay_task/core/constants.dart' as constant;
import 'package:pixabay_task/presentation/bloc/combined_bloc/combined_bloc.dart';
import 'package:pixabay_task/presentation/bloc/images_bloc/get_images_bloc.dart';
import 'package:pixabay_task/ui/widgets/combined_list.dart';

class CombinedPage extends StatefulWidget {
  final String category;
  const CombinedPage(this.category);

  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  late GetCombinedBloc combinedBloc;
  List<String> sort = ["popular", "latest"];
  List<String> filter = ["all"];

  @override
  void initState() {
    super.initState();
    combinedBloc = getIt.get<GetCombinedBloc>()
      ..add(GetCombinedEvent(constant.ImageType.all.toString().split('.').last,
          constant.Order.popular.toString().split('.').last, widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: BlocBuilder<GetCombinedBloc, GetCombinedState>(
            bloc: combinedBloc,
            builder: (context, GetCombinedState currentState) {
              if (currentState is GetCombinedInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (currentState is GetCombinedLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (currentState is GetCombinedSuccess) {
                if (currentState.combined.isEmpty) {
                  return Center(
                    child: Text('No items found!'),
                  );
                }
                return CombinedList(sucessState: currentState);
              } else if (currentState is GetImagesFail) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Something went wrong. Please check internet connection'),
                      SizedBox(height: 20),
                      InkWell(
                        child: Icon(Icons.refresh),
                        onTap: () => combinedBloc.add(
                          GetCombinedEvent(
                            constant.ImageType.all.toString().split('.').last,
                            constant.Order.popular.toString().split('.').last,
                            widget.category,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
