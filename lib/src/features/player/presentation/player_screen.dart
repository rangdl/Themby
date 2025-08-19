import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';

import 'package:themby/src/features/player/presentation/video_custom.dart';
import 'package:themby/src/features/player/service/themby_controller.dart';

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({super.key, required this.media});

  final SelectedMedia media;

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreen();
}

class _PlayerScreen extends ConsumerState<PlayerScreen> {
  bool isInitialize = false;
  @override
  void initState() {
    super.initState();
    if (!isInitialize) {
      Future.microtask(() async {
        await ref.read(thembyControllerProvider).init();
        setState(() {
          isInitialize = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // watch一下 防止自动销毁
    // ignore: unused_local_variable
    final state = ref.watch(thembyControllerProvider);
    return isInitialize ? VideoCustom(media: widget.media) : Container();
  }
}
