import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:study_path/class/createdynamiclink/create_links.dart';
import 'package:study_path/class/paypalmodels/create_order_model.dart';
import 'package:study_path/class/paypalmodels/order_detailsmodel.dart';
import 'package:study_path/class/paypalmodels/response_createorder_model.dart';

class ApiService {
  static Future<String> getdata() async {
    String clintid =
        clintid;
    String secretkey =
        scretkey;
    String authrization =
        'Basic ${base64Encode(utf8.encode("$clintid:$secretkey"))}';
    Map<String, String> body = {"grant_type": "client_credentials"};
    Map<String, String> header = {
      "Content-Type": "application/x-www-form-urlencoded",
      'Authorization': authrization
    };
    var url = Uri.parse("https://api-m.sandbox.paypal.com/v1/oauth2/token");
    Response response = await http.post(url, headers: header, body: body);
    // print(response.statusCode);
    // print(jsonDecode(response.body)['access_token']);
    return jsonDecode(response.body)['access_token'];
    // var response2 = await http.get(url);

    // var response3 = await http.put();
  }

  static Future<ResponseRoderModel> createorder(
      {token, succespayment, canselpayment}) async {
    Uri urlsucces = await CreateDynamicLink.createsuccesslink();

    Uri urlcansel = await CreateDynamicLink.createcansellink();
    CreateDynamicLink.packgroundrun(succespayment, canselpayment);

    //print("cansssseeell urllll===${urlcansel}");
    String authrization = "Bearer $token";
    String requestid = "67232cc0-edaf-4fd2-bcc1-iyuyuuu";
    Map<String, dynamic> body = CreatOrderModel(
        intent: "AUTHORIZE",
        purchaseUnits: [
          PurchaseUnitss(
              referenceId: "11122223",
              amount: Amountt(currencyCode: 'usd', value: "121"))
        ],
        paymentSource: PaymentSourcee(
            paypal: Paypall(
                experienceContext: ExperienceContextt(
          paymentMethodPreference: "IMMEDIATE_PAYMENT_REQUIRED",
          brandName: "StudyPath",
          locale: 'ar',
          landingPage: 'LOGIN',
          userAction: "PAY_NOW",
          returnUrl: urlsucces.toString(),

          cancelUrl: urlcansel.toString(),
          )))).toJson();
    Map<String, String> header = {
      "Content-Type": "application/json",
      'Authorization': authrization,
      'PayPal-Request-Id': requestid
    };
    var url = Uri.parse("https://api-m.sandbox.paypal.com/v2/checkout/orders");
    Response response =
        await http.post(url, headers: header, body: jsonEncode(body));
    print(jsonDecode(response.body));
    ResponseRoderModel rmodel =
        ResponseRoderModel.fromJson(jsonDecode(response.body));

    return rmodel;
    //Response re=await http.post(url)
  }

  static Future<DetailsOrderModel> orderdetials(token, id) async {
    String authrization = "Bearer $token";
    Map<String, String> header = {
      'Authorization': authrization,
    };
    var url =
        Uri.parse('https://api-m.sandbox.paypal.com/v2/checkout/orders/$id');
    Response response = await http.get(
      url,
      headers: header,
    );

    DetailsOrderModel rmodel =
        DetailsOrderModel.fromJson(jsonDecode(response.body));

    return rmodel;
  }

  // static UpdateOrder(token, id) async {
  //   String authrization = "Bearer $token";
  //   Map<String, String> header = {
  //     "Content-Type": "application/json",
  //     'Authorization': authrization,
  //   };
  //   Map<String, dynamic> body = UpdateOrderModel(
  //           op: 'REPLACE',
  //           path: '',
  //           value: Value(
  //               addressLine1: null,
  //               addressLine2: null,
  //               adminArea2: null,
  //               adminArea1: null,
  //               postalCode: null,
  //               countryCode: null))
  //       .toJson();
  //   var url =
  //       Uri.parse('https://api-m.sandbox.paypal.com/v2/checkout/orders/$id');
  //   Response response =
  //       await http.patch(url, headers: header, body: jsonEncode(body));

  //   ResponseRoderModel rmodel =
  //       ResponseRoderModel.fromJson(jsonDecode(response.body));

  //   return rmodel;
  // }

  // static Future<ConfirmResponseModel> confirmorder(
  //     token, id, name, email) async {
  //   String authrization = "Bearer $token";
  //   Map<String, dynamic> body = ConfirmOrderModel(
  //       paymentSource: PaymentSourc(
  //           paypal: Paypal2(
  //               name: name,
  //               emailAddress: email,
  //               experienceContext: ExperienceContext(
  //                 paymentMethodPreference: "IMMEDIATE_PAYMENT_REQUIRED",
  //                 brandName: "StudyPath",
  //                 locale: 'ar',
  //                 landingPage: 'LOGIN',
  //                 userAction: "PAY_NOW",
  //                 returnUrl: "https://example.com/doneurl",
  //                 cancelUrl: "https://example.com/cancelUrl",
  //                 shippingPreference: "SET_PROVIDED_ADDRESS",
  //                 //ممكن تكون المشكله هنا  ف الكود اللي تحت
  //               )))).toJson();
  //   Map<String, String> header = {
  //     "Content-Type": "application/json",
  //     'Authorization': authrization,
  //   };
  //   var url = Uri.parse(
  //       'https://api-m.sandbox.paypal.com/v2/checkout/orders/$id/confirm-payment-source');
  //   Response response =
  //       await http.post(url, headers: header, body: jsonEncode(body));

  //   ConfirmResponseModel rmodel =
  //       ConfirmResponseModel.fromJson(jsonDecode(response.body));

  //   return rmodel;
  // }

  // static Future<AuthrizationresponseModel> authrization(token, id) async {
  //   String authrization = "Bearer $token";

  //   Map<String, String> header = {
  //     "Content-Type": "application/json",
  //     'Authorization': authrization,
  //     'PayPal-Request-Id': id,
  //   };
  //   var url = Uri.parse(
  //       'https://api-m.sandbox.paypal.com/v2/checkout/orders/$id/authorize');
  //   Response response = await http.post(url, headers: header);
  //   //print(jsonDecode(response.body));
  //   AuthrizationresponseModel rmodel =
  //       AuthrizationresponseModel.fromJson(jsonDecode(response.body));
  //   return rmodel;
  // }

  // static Future<CaptureresponseModel> capturepayment(token, id) async {
  //   String authrization = "Bearer $token";

  //   Map<String, String> header = {
  //     "Content-Type": "application/json",
  //     'Authorization': authrization,
  //     'PayPal-Request-Id': id,
  //   };
  //   var url = Uri.parse(
  //       'https://api-m.sandbox.paypal.com/v2/checkout/orders/$id/capture');
  //   Response response = await http.post(url, headers: header);
  //   print(jsonDecode(response.body));
  //   CaptureresponseModel rmodel =
  //       CaptureresponseModel.fromJson(jsonDecode(response.body));
  //   return rmodel;
  // }
}
