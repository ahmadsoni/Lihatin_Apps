import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lihatin/models/transaction_model.dart';
import 'package:lihatin/models/user_model.dart';

class TransactionService {
  CollectionReference _transactionRefrence =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      _transactionRefrence.add({
        'film': {
          transactionModel.film.toJson(),
        },
        'amoutOfFilm': transactionModel.amoutOfFilm,
        'selectSeat': transactionModel.selectSeat,
        'price': transactionModel.price,
        'grandTotal': transactionModel.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionRefrence.get();
      List<TransactionModel> transaction = result.docs.map(
        (e) {
          return TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return transaction;
    } catch (e) {
      throw e;
    }
  }
}
