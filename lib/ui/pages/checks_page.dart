import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/check_bloc.dart';
import '../../utils/contants.dart';
import '../widgets/check_item.dart';
import '../widgets/loading_widgets/check_loading.dart';

class ChecksPage extends StatefulWidget {
  const ChecksPage({Key? key}) : super(key: key);

  @override
  State<ChecksPage> createState() => _ChecksPageState();
}

class _ChecksPageState extends State<ChecksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBloc, CheckState>(builder: (context, state) {
      if (state is CheckInitial) {
        context.read<CheckBloc>().add(CheckLoadDataEvent());
        return const SizedBox.shrink();
      } else if (state is  CheckIsLoading) {
        return checkLoadingWidget();
      } else if (state is  CheckIsLoaded) {
        return SafeArea(
      child: Container(
    color: Constants.bgColor,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: state.check.length,
      itemBuilder: (BuildContext context, int index) {
        return checkItem(state.check[index].title, state.check[index].completed);
      },
    ),
  ));
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    });
  
  }
}