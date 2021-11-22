import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/di/di.dart';
import 'package:pixabay_task/presentation/bloc/images_bloc/get_images_bloc.dart';
import 'package:pixabay_task/core/constants.dart' as constant;
import 'package:pixabay_task/ui/widgets/images_list.dart';

class ImagesPage extends StatefulWidget {
  final String category;
  const ImagesPage(this.category) : super();

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  late GetImagesBloc issuesBloc;
  List<String> sort = ["popular", "latest"];
  List<String> filter = ["all", "photo", "illustration", "vector"];

  @override
  void initState() {
    super.initState();
    issuesBloc = getIt.get<GetImagesBloc>()
      ..add(GetImagesEvent(constant.ImageType.all.toString().split('.').last,
          constant.Order.popular.toString().split('.').last, widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              iconEnabledColor: Colors.white,
              underline: Container(),
              onChanged: (val) {
                getIt
                    .get<GetImagesBloc>()
                    .add(FilterSortImage(sort: val ?? ""));
              },
              icon: Icon(Icons.sort_sharp),
              items: sort.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              iconEnabledColor: Colors.white,
              underline: Container(),
              onChanged: (val) {
                getIt
                    .get<GetImagesBloc>()
                    .add(FilterSortImage(filter: val ?? ""));
              },
              icon: Icon(Icons.format_list_bulleted_rounded),
              items: filter.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        label: Text(""),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: BlocBuilder<GetImagesBloc, GetImagesState>(
            bloc: issuesBloc,
            builder: (context, GetImagesState currentState) {
              if (currentState is GetImagesInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (currentState is GetImagesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (currentState is GetImagesSuccess) {
                if (currentState.Images.isEmpty) {
                  return Center(
                    child: Text('No Images found!'),
                  );
                }
                return ImagesList(sucessState: currentState);
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
                        onTap: () => issuesBloc.add(
                          GetImagesEvent(
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
