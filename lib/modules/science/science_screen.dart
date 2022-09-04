import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/news_layout/cubit_layout/states.dart';

import '../../layout/news_layout/cubit_layout/cubit.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsLayoutCubit, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsLayoutCubit.get(context).science;
        return buildListItem(context, cubit);
      },
    );
  }
}
