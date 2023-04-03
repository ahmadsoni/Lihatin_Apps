import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lihatin/models/transaction_model.dart';

import '../../shared/theme.dart';
import 'custom_booking_detail_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    var transactionModel;
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Note Destination Tile
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transactionModel.film.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactionModel.film.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transactionModel.film.genre,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_star.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      transactionModel.film.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          // Note Booking Detail Text
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          // Note Booking Detail Items
          BookingDetailsItem(
              title: 'Person',
              valueText: '${transactionModel.amoutOfFilm} Person',
              valueColor: kBlackColor),
          BookingDetailsItem(
            title: 'Seat',
            valueText: transactionModel.selectSeat,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
              title: 'Price',
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transactionModel.price),
              valueColor: kBlackColor),
          BookingDetailsItem(
              title: 'Grand Total',
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transactionModel.grandTotal),
              valueColor: kPrimaryColor),
        ],
      ),
    );
  }
}
