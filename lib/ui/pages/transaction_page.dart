import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lihatin/cubit/transaction_cubit.dart';
import 'package:lihatin/ui/widgets/custom_transaction_card.dart';
import '../../shared/theme.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        print(state is TransactionSuccess);
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          print('masuk');
          if (state.transaction.length == 0) {
            return Center(
              child: Text('Kamu Belum Memiliki Transaksi'),
            );
          } else {
            return ListView.builder(
              itemCount: state.transaction.length,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              itemBuilder: (context, index) {
                return TransactionCard(state.transaction[index]);
              },
            );
          }
        } else if (state is TransactionFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
