import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:go_router/go_router.dart';

class CreateDynamicLink {
  static packgroundrun(Function(Uri) success, Function(Uri) cansel) {
    // ignore: deprecated_member_use
    FirebaseDynamicLinks.instance.onLink.listen(
      (pendingDynamicLinkData) {
        // Set up the `onLink` event listener next as it may be received here
        final Uri deepLink = pendingDynamicLinkData.link;
        // Example of using the dynamic link to push the user to a different screen
        if (deepLink.toString().contains("success")) {
          success(deepLink);
        } else {
          cansel(deepLink);
        }
      },
    );
  }

  static Future<Uri> createsuccesslink() async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://www.success.com/"),
      uriPrefix: "https://studypath.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.example.study_path"),
    );
    final dynamicLink =
        // ignore: deprecated_member_use
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    return dynamicLink;
  }

  static Future<Uri> createcansellink() async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://www.cansel.com/"),
      uriPrefix: "https://studypath.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.example.study_path"),
    );
    final dynamicLink =
        // ignore: deprecated_member_use
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    return dynamicLink;
  }
}
