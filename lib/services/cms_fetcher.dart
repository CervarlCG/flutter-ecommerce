import 'package:ecommerce/models/cms/home.dart';
import 'package:ecommerce/models/schemas/templates/home.dart';

class CMS {
  /// Fetches a CMS template from the backend service and convert it to a [T] instance.
  ///
  /// This method takes [template] as the name of the template to fetch.
  ///
  /// Returns an instance of type [T] populated with the content of the template
  ///
  /// Throws an [Exception] if template cannot be found.
  static Future<T> fetch<T>(String template) async {
    Map<String, dynamic> json = await CMS._fetchData(template);
    return CMS._getTemplateInstance<T>(json);
  }

  /// Fetches only the template data from the backend service
  ///
  /// Return a [Map] that contains the json response
  static Future<Map<String, dynamic>> _fetchData(String template) async {
    if (template == 'home') {
      return homeCMSContent;
    }

    return {};
  }

  /// Retrieve a [T] template populated with json data coming from [json] map
  static T _getTemplateInstance<T>(Map<String, dynamic> json) {
    if (T == HomeTemplate) {
      return HomeTemplate.fromJson(json) as T;
    }

    throw Exception("Unknown template");
  }
}
