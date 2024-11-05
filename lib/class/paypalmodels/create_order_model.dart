class CreatOrderModel {
  String? intent;
  List<PurchaseUnitss>? purchaseUnits;
  PaymentSourcee? paymentSource;

  CreatOrderModel({this.intent, this.purchaseUnits, this.paymentSource});

  CreatOrderModel.fromJson(Map<String, dynamic> json) {
    intent = json['intent'];
    if (json['purchase_units'] != null) {
      purchaseUnits = <PurchaseUnitss>[];
      json['purchase_units'].forEach((v) {
        purchaseUnits!.add(new PurchaseUnitss.fromJson(v));
      });
    }
    paymentSource = json['payment_source'] != null
        ? new PaymentSourcee.fromJson(json['payment_source'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intent'] = this.intent;
    if (this.purchaseUnits != null) {
      data['purchase_units'] =
          this.purchaseUnits!.map((v) => v.toJson()).toList();
    }
    if (this.paymentSource != null) {
      data['payment_source'] = this.paymentSource!.toJson();
    }
    return data;
  }
}

class PurchaseUnitss {
  String? referenceId;
  Amountt? amount;

  PurchaseUnitss({this.referenceId, this.amount});

  PurchaseUnitss.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    amount =
        json['amount'] != null ? new Amountt.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_id'] = this.referenceId;
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    return data;
  }
}

class Amountt {
  String? currencyCode;
  String? value;

  Amountt({this.currencyCode, this.value});

  Amountt.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currency_code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_code'] = this.currencyCode;
    data['value'] = this.value;
    return data;
  }
}

class PaymentSourcee {
  Paypall? paypal;

  PaymentSourcee({this.paypal});

  PaymentSourcee.fromJson(Map<String, dynamic> json) {
    paypal =
        json['paypal'] != null ? new Paypall.fromJson(json['paypal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paypal != null) {
      data['paypal'] = this.paypal!.toJson();
    }
    return data;
  }
}

class Paypall {
  ExperienceContextt? experienceContext;

  Paypall({this.experienceContext});

  Paypall.fromJson(Map<String, dynamic> json) {
    experienceContext = json['experience_context'] != null
        ? new ExperienceContextt.fromJson(json['experience_context'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.experienceContext != null) {
      data['experience_context'] = this.experienceContext!.toJson();
    }
    return data;
  }
}

class ExperienceContextt {
  String? paymentMethodPreference;
  String? brandName;
  String? locale;
  String? landingPage;
  String? shippingPreference;
  String? userAction;
  String? returnUrl;
  String? cancelUrl;

  ExperienceContextt(
      {this.paymentMethodPreference,
      this.brandName,
      this.locale,
      this.landingPage,
      this.shippingPreference,
      this.userAction,
      this.returnUrl,
      this.cancelUrl});

  ExperienceContextt.fromJson(Map<String, dynamic> json) {
    paymentMethodPreference = json['payment_method_preference'];
    brandName = json['brand_name'];
    locale = json['locale'];
    landingPage = json['landing_page'];
    shippingPreference = json['shipping_preference'];
    userAction = json['user_action'];
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method_preference'] = this.paymentMethodPreference;
    data['brand_name'] = this.brandName;
    data['locale'] = this.locale;
    data['landing_page'] = this.landingPage;
    data['shipping_preference'] = this.shippingPreference;
    data['user_action'] = this.userAction;
    data['return_url'] = this.returnUrl;
    data['cancel_url'] = this.cancelUrl;
    return data;
  }
}
