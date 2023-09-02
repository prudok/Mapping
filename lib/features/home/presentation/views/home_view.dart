import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/features/home/presentation/bloc/home_bloc.dart';
import 'package:mapping/features/home/presentation/bloc/news_bloc.dart';

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
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    if (widget.userEmail != null) {
      homeBloc.add(HomeEvent.loadUserDetails(widget.userEmail!));
    }
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
        builder: (_, state) {
          return state.when(
            loaded: (userInfo) {
              BlocProvider.of<NewsBloc>(context).add(const NewsEvent.load());
              return const HomeListView();
            },
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
    final textTheme = Theme.of(context).textTheme.headlineSmall;
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      title: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, state) {
          return state.maybeWhen(
            loaded: (user) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  user.name,
                  style: textTheme?.copyWith(color: AppColors.white),
                ),
                Text(
                  user.surName,
                  style: textTheme?.copyWith(color: AppColors.white),
                ),
              ],
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
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
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (_, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failed: (errorMessage) => Center(child: Text(errorMessage)),
          loaded: (articles) => ListView.builder(
            itemCount: articles.articles.length,
            itemBuilder: (_, index) => ListTile(
              style: ListTileStyle.drawer,
              title: Text(articles.articles[index].title ?? ''),
              subtitle: Text(articles.articles[index].description ?? ''),
            ),
          ),
        );
      },
    );
  }
}
