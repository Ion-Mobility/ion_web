import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/debouncer.dart';

class HomeScrollProvider {
  final double screenHeight;
  final _controller = ScrollController();
  final debouncer = Debouncer(milliseconds: 100);
  final isScrolling = ValueNotifier(false);

  // Expose the controller
  ScrollController get controller => _controller;

  HomeScrollProvider(
    this.screenHeight,
  ) {
    _controller.addListener(
      _scrollListener,
    );
  }

  // The scroll listener method
  void _scrollListener() {
    final height = screenHeight;
    final offset = _controller.offset;
    final page = (offset / height).round();
    final direction = _controller.position.userScrollDirection;
    // Use page or offset properties here
    // final currentPage = _pageController.page ?? 0;
    if (!debouncer.isRunning) {
      debouncer.run(
        () {
          if (direction.toString() == 'ScrollDirection.reverse' &&
              page + 1 < 4) {
            final startOffset = (page + 1) * height;

            _controller
                .animateTo(
                  startOffset,
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                  curve: Curves.easeInOut,
                )
                .then((_) => isScrolling.value = true)
                .whenComplete(() => isScrolling.value = false);
          } else if (direction.toString() == 'ScrollDirection.forward' &&
              page - 1 < 4) {
            final offset = (page - 1) * height;
            final targetOffset = (offset < height) ? 0.0 : offset;
            _controller
                .animateTo(
                  targetOffset,
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                  curve: Curves.easeInOut,
                )
                .then((_) => isScrolling.value = true)
                .whenComplete(() => isScrolling.value = false);
          }
        },
      );
    }
  }

  // Dispose the controller when no longer needed
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
  }
}

final homeScrollProvider =
    AutoDisposeStateProvider.family<HomeScrollProvider, double>(
  (ref, screenHeight) {
    final provider = HomeScrollProvider(screenHeight);
    ref.onDispose(() => provider.dispose());
    return provider;
  },
);
