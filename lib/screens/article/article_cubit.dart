import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nytimes/model/media_type.dart';

import '../../model/media.dart';
import '../../model/result.dart';
import '../../model/subtype.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  Result? article;
  List<Media> media = [];

  ArticleCubit() : super(ArticleInitial());

  Future<void> initialSetup(Result article) async {
    article = article;
    article.media;
    for (var item in article.media) {
      if (item.type == MediaType.IMAGE && item.subtype == Subtype.PHOTO) {
        media.add(item);
      }
    }
  }
}
