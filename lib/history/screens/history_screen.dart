
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/history/data/model/history_model.dart';
import 'package:my_app/history/manager/history_cubit.dart';
import 'package:my_app/history/screens/widget/history_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if(state is GetDataIsFailuer){
          return  Center(child: Text(state.errorMessage,style: Theme.of(context).textTheme.titleMedium,),);
        }else if (state is GetDataIsSuccessfuly){
          return _buildListview(historyModel: BlocProvider.of<HistoryCubit>(context).historyModel);
        }else {
          return const Center(child: CircularProgressIndicator(color: Colors.black,),);
        }
      },
    );
  }
  Widget _buildListview({required HistoryModel historyModel }){
    return ListView.builder(
      itemCount: historyModel.data!.length,
      itemBuilder: (context,index){
      return HistoryTile(data: historyModel.data![index]);
    });
  }
}


