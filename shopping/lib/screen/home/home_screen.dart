import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/commons/utils/app_images.dart';
import 'package:shopping/commons/widgets/carousel/carousel.dart';
import 'package:shopping/commons/widgets/category/category_row.dart';
import 'package:shopping/model/product/product.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/home/bloc/home_bloc.dart';
import 'package:shopping/screen/home/bloc/home_event.dart';
import 'package:shopping/screen/home/bloc/home_state.dart';
import 'package:shopping/screen/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc=BlocProvider.of<HomeBloc>(context);
    homeBloc.add(HomeRequest());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(

        create: (context) => HomeBloc(productRepos: ProductRepositoryImpl()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ImageSlider(),
            CategoryRow(),

            _buildCategory(),
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {

            var currentState = state;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.listProduct.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
//                        Text(currentState.listCategory[index].type),
                        _buildListCategory(currentState.listProduct),
                      ],
                    ),
                  );
                });
          } else if (state is HomeFailure) {
            return Center(child: Text('${state.error}'));
          }
          if(state is HomeLoading)
          {return Center(child: Text('Center'));}
          return Center(child: Text('Center'));
        },
      ),
    );
  }

  Widget _buildListCategory(List<Product> list) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
                onTap: () async {
                  await Navigator.of(context).pushNamed(Routes.Detail);
                },
                child: Card(child: _buildDetailCard(list, index))),
          );
        },
      ),
    );
  }
}

Widget _buildDetailCard(List<Product> cate, int i) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 50,
                width: 20,
                child: Image.asset(
                  AppAssets.icBag,
                  height: 50,
                  width: 20,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                "Bag",
                maxLines: 2,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
