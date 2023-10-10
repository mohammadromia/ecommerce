// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCached extends StatelessWidget {

  String urlimage;
  ImageCached({
    Key? key,
    required this.urlimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlimage,
      imageBuilder: (context, imageProvider) => Container(

            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const CupertinoActivityIndicator(),
          ),
      errorWidget: (context, url, error) => Container(

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const Icon(Icons.error),
          ));
  }
}
