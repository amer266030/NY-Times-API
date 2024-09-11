import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/extensions/date_ext.dart';
import 'package:nytimes/screens/article/article_cubit.dart';

import '../../model/result.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});

  final Result article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ArticleCubit(),
        child: Builder(builder: (context) {
          final cubit = context.read<ArticleCubit>();
          cubit.initialSetup(article);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.byline),
                  Text(article.publishedDate.toFormattedString()),
                  const _ImgView(),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(article.media.last.copyright,
                        style: const TextStyle(fontSize: 12))
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(article.media.last.caption,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Text(article.resultAbstract)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ImgView extends StatelessWidget {
  const _ImgView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ArticleCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: cubit.media.isEmpty
            ? const Placeholder()
            : ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  cubit.media.last.mediaMetadata.last.url,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
