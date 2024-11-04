const String apiKey = 'YOUR_API_KEY';
const String baseImageUrl = 'https://image.tmdb.org/t/p/';

String imageUrl(String path, {String size = 'w500'}) {
  return '$baseImageUrl$size$path';
}
