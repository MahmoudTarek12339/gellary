import 'package:flutter/material.dart';
import 'package:my_gallery/app/di.dart';
import 'package:my_gallery/presentation/gallery/view_model/gallery_viewmodel.dart';
import 'package:my_gallery/presentation/gallery/widgets/image_item.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({super.key});

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  final GalleryViewModel _viewModel = instance<GalleryViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: _viewModel.outputImages,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Align(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 24,
                alignment: WrapAlignment.start,
                children: List.generate(snapShot.data?.length ?? 0,
                    (index) => ImageItem(snapShot.data![index])).toList(),
              ),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
