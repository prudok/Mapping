import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../bloc/home_bloc.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  final String userEmail;

  const HomeView({super.key, required this.userEmail});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(HomeEvent.loadUserDetails(widget.userEmail));
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout_outlined),
        onPressed: () {
          homeBloc.add(const HomeEvent.signOut());
        },
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            initial: () =>
                homeBloc.add(HomeEvent.loadUserDetails(widget.userEmail)),
            orElse: () {},
          );
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
            const HomeSliverAppBar(),
          ],
          body: BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              return state.when(
                // TODO: implement shimmer view
                loaded: (userInfo) => const HomeListView(),
                initial: () => const Text('Initial'),
                loading: (_) => const Text('loading'),
                loadingFailed: () => const Text('Loading Failed'),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.purple,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.access_time),
        onPressed: () {},
      ),
      title: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (user) => Column(
              children: [
                Text(user.name),
                Text(user.surName),
              ],
            ),
            // TODO: implement shimmer view
            orElse: () => const SizedBox(),
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        )
      ],
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.03,
              right: MediaQuery.sizeOf(context).width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.of(context).goalOfTheWeek),
                          const Text('50km'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.run_circle),
                ),
                const Column(
                  children: [
                    Text('Some text'),
                    Text('Some text'),
                  ],
                ),
                const Column(
                  children: [
                    Text('19'),
                    Text('km'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).history),
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).all),
              ),
            ],
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
              ),
              child: const ListTile(
                leading: Icon(Icons.map),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Some Text'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Some Text'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Some Text'),
                        Text('Some Text'),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_right_alt),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ),
      ],
    );
  }
}
