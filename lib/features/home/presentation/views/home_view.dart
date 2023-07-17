import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/app_styles.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/features/home/presentation/bloc/home_bloc.dart';
import 'package:mapping/generated/l10n.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({required this.userEmail, super.key});

  final String? userEmail;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    if (widget.userEmail != null) {
      homeBloc.add(HomeEvent.loadUserDetails(widget.userEmail!));
    }
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
      appBar: const HomeAppBar(),
      extendBody: true,
      backgroundColor: AppColors.lightGrey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          child: const Icon(Icons.logout_outlined),
          onPressed: () {
            homeBloc.add(const HomeEvent.signOut());
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return state.when(
            loaded: (userInfo) => const HomeListView(),
            initial: () => const Center(child: Text('Initial')),
            loading: (_) => const Center(child: Text('loading')),
            loadingFailed: () => const Center(child: Text('Loading Failed')),
          );
        },
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.add_chart),
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
            orElse: () => const SizedBox(),
          );
        },
      ),
      actions: [
        IconButton(
          icon: Image.asset(AssetPaths.settingsIcon),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.8,
        width: double.infinity,
        child: const Column(
          children: [
            GoalsPreview(),
            SizedBox(height: 10),
            BestRouteRating(),
            SizedBox(height: 10),
            HistoryOptions(),
            Expanded(child: RoutesHistory()),
          ],
        ),
      ),
    );
  }
}

class RoutesHistory extends StatelessWidget {
  const RoutesHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
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
    );
  }
}

class HistoryOptions extends StatelessWidget {
  const HistoryOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
}

class BestRouteRating extends StatelessWidget {
  const BestRouteRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
}

class GoalsPreview extends StatelessWidget {
  const GoalsPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.25,
          width: double.infinity,
          decoration: AppStyles.roundedOnlyBottomEdges.copyWith(
            color: AppColors.orange,
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
                horizontal: 10,
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
    );
  }
}
