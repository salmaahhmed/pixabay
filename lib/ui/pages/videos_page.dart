import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/di/di.dart';
import 'package:pixabay_task/presentation/bloc/videos_bloc/get_videos_bloc.dart';
import 'package:pixabay_task/core/constants.dart' as constant;
import 'package:pixabay_task/ui/widgets/videos_list.dart';

class VideosPage extends StatefulWidget {
  final String category;
  const VideosPage(this.category) : super();

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  late GetVideosBloc videosBloc;
  List<String> sort = ["popular", "latest"];
  List<String> filter = ["all", "film", "animation"];

  @override
  void initState() {
    super.initState();
    videosBloc = getIt.get<GetVideosBloc>()
      ..add(GetVideo(constant.ImageType.all.toString().split('.').last,
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
                    .get<GetVideosBloc>()
                    .add(FilterSortVideo(sort: val ?? ""));
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
                    .get<GetVideosBloc>()
                    .add(FilterSortVideo(filter: val ?? ""));
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
        child: BlocBuilder<GetVideosBloc, GetVideosState>(
            bloc: videosBloc,
            builder: (context, GetVideosState currentState) {
              if (currentState is GetVideosInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (currentState is GetVideosLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (currentState is GetVideosSuccess) {
                if (currentState.videos.isEmpty) {
                  return Center(
                    child: Text('No Videos found!'),
                  );
                }
                return VideosList(sucessState: currentState);
              } else if (currentState is GetVideosFail) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Something went wrong. Please check internet connection'),
                      SizedBox(height: 20),
                      InkWell(
                        child: Icon(Icons.refresh),
                        onTap: () => videosBloc.add(
                          GetVideo(
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
