import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockets/common/injector_config.dart';
import 'package:pockets/presentation/journey/pocket_list/bloc/pocket_list_bloc.dart';

class PocketListScreen extends StatefulWidget {
  const PocketListScreen({
    super.key,
  });

  @override
  State<PocketListScreen> createState() => _PocketListScreenState();
}

class _PocketListScreenState extends State<PocketListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PocketListBloc _pocketListBloc;

  @override
  void initState() {
    super.initState();
    _pocketListBloc = Injector.resolve!<PocketListBloc>()
      ..add(LoadPocketListEvent());
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pocket List'), actions: [
        IconButton(
          onPressed: () {
            _pocketListBloc.add(LoadPocketListEvent());
          },
          icon: const Icon(Icons.refresh),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<PocketListBloc, PocketListState>(
      bloc: _pocketListBloc,
      builder: (context, state) {
        if (state is PocketListLoaded) {
          return _buildGridPockets(state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Padding _buildGridPockets(PocketListLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(bottom: 50, top: 16),
      child: GridView.builder(
          itemCount: state.pockets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            final item = state.pockets[index];
            return Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.amber),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.pocketName ?? 'Default',
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                      Expanded(
                        child: Center(
                          child: Text(item.emoji ?? '😶',
                              style: const TextStyle(fontSize: 70)),
                        ),
                      )
                    ]),
              ),
            );
          }),
    );
  }
}
