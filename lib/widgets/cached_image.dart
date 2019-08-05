part of widgets;

class CachedImage extends StatelessWidget {
  final String imageUrl;
  CachedImage(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // placeholder: (context, url) => LinearProgressIndicator(),
      placeholder: (context, url) => Container(),
      fadeInDuration: Duration(microseconds: 0),
      fadeOutDuration: Duration(microseconds: 0),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageUrl: imageUrl,
    );
  }
}
