import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lihatin/cubit/auth_cubit.dart';
import 'package:lihatin/cubit/film_cubit.dart';
import 'package:lihatin/models/film_model.dart';
import 'package:lihatin/ui/widgets/custom_card_film.dart';
import 'package:lihatin/ui/widgets/custom_film_tile.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<FilmCubit>().fetchFilm();
    // context.read<FilmCubit>().newFetchFilm();
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget appbar() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, top: 30),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,\n${state.user.name}',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Discover your fantasy',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/image_profile.png'),
                      )),
                )
              ]),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<FilmModel> film) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: film.map((FilmModel film) {
              return CustomCardFilm(film);
            }).toList(),
          ),
        ),
      );
    }

    Widget newFilm(List<FilmModel> new_film) {
      return Container(
        margin: EdgeInsets.only(
            top: 30, left: defaultMargin, right: defaultMargin, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Column(
              children: new_film.map((FilmModel new_film) {
                return FilmTile(new_film);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<FilmCubit, FilmState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is FilmFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FilmSuccess) {
          return ListView(
            children: [
              appbar(),
              popularDestination(state.film),
              newFilm(state.film),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
