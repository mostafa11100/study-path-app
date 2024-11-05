class ResponseRoderModel {
  ResponseRoderModel({
    required this.id,
    required this.intent,
    required this.status,
    required this.paymentSource,
    required this.purchaseUnits,
    required this.links,
  });

  final String? id;
  final String? intent;
  final String? status;
  final PaymentSource? paymentSource;
  final List<PurchaseUnit> purchaseUnits;
  final List<Link> links;

  factory ResponseRoderModel.fromJson(Map<String, dynamic> json) {
    return ResponseRoderModel(
      id: json["id"],
      intent: json["intent"],
      status: json["status"],
      paymentSource: json["payment_source"] == null
          ? null
          : PaymentSource.fromJson(json["payment_source"]),
      purchaseUnits: json["purchase_units"] == null
          ? []
          : List<PurchaseUnit>.from(
              json["purchase_units"]!.map((x) => PurchaseUnit.fromJson(x))),
      links: json["links"] == null
          ? []
          : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "intent": intent,
        "status": status,
        "payment_source": paymentSource?.toJson(),
        "purchase_units": purchaseUnits.map((x) => x?.toJson()).toList(),
        "links": links.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $intent, $status, $paymentSource, $purchaseUnits, $links, ";
  }
}

class Link {
  Link({
    required this.href,
    required this.rel,
    required this.method,
  });

  final String? href;
  final String? rel;
  final String? method;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      href: json["href"],
      rel: json["rel"],
      method: json["method"],
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
        "rel": rel,
        "method": method,
      };

  @override
  String toString() {
    return "$href, $rel, $method, ";
  }
}

class PaymentSource {
  PaymentSource({
    required this.paypal,
  });

  final Paypal? paypal;

  factory PaymentSource.fromJson(Map<String, dynamic> json) {
    return PaymentSource(
      paypal: json["paypal"] == null ? null : Paypal.fromJson(json["paypal"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "paypal": paypal?.toJson(),
      };

  @override
  String toString() {
    return "$paypal, ";
  }
}

class Paypal {
  Paypal({required this.json});
  final Map<String, dynamic> json;

  factory Paypal.fromJson(Map<String, dynamic> json) {
    return Paypal(json: json);
  }

  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return "";
  }
}

class PurchaseUnit {
  PurchaseUnit({
    required this.referenceId,
    required this.amount,
    required this.payee,
    required this.description,
    required this.customId,
    required this.invoiceId,
    required this.softDescriptor,
    required this.items,
  });

  final String? referenceId;
  final Amount? amount;
  final Payee? payee;
  final String? description;
  final String? customId;
  final String? invoiceId;
  final String? softDescriptor;
  final List<Item> items;

  factory PurchaseUnit.fromJson(Map<String, dynamic> json) {
    return PurchaseUnit(
      referenceId: json["reference_id"],
      amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
      payee: json["payee"] == null ? null : Payee.fromJson(json["payee"]),
      description: json["description"],
      customId: json["custom_id"],
      invoiceId: json["invoice_id"],
      softDescriptor: json["soft_descriptor"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "amount": amount?.toJson(),
        "payee": payee?.toJson(),
        "description": description,
        "custom_id": customId,
        "invoice_id": invoiceId,
        "soft_descriptor": softDescriptor,
        "items": items.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$referenceId, $amount, $payee, $description, $customId, $invoiceId, $softDescriptor, $items, ";
  }
}

class Amount {
  Amount({
    required this.currencyCode,
    required this.value,
    required this.breakdown,
  });

  final String? currencyCode;
  final String? value;
  final Breakdown? breakdown;

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      currencyCode: json["currency_code"],
      value: json["value"],
      breakdown: json["breakdown"] == null
          ? null
          : Breakdown.fromJson(json["breakdown"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "value": value,
        "breakdown": breakdown?.toJson(),
      };

  @override
  String toString() {
    return "$currencyCode, $value, $breakdown, ";
  }
}

class Breakdown {
  Breakdown({
    required this.itemTotal,
    required this.shipping,
    required this.handling,
    required this.taxTotal,
    required this.shippingDiscount,
    required this.discount,
  });

  final Tax? itemTotal;
  final Tax? shipping;
  final Tax? handling;
  final Tax? taxTotal;
  final Tax? shippingDiscount;
  final Tax? discount;

  factory Breakdown.fromJson(Map<String, dynamic> json) {
    return Breakdown(
      itemTotal:
          json["item_total"] == null ? null : Tax.fromJson(json["item_total"]),
      shipping:
          json["shipping"] == null ? null : Tax.fromJson(json["shipping"]),
      handling:
          json["handling"] == null ? null : Tax.fromJson(json["handling"]),
      taxTotal:
          json["tax_total"] == null ? null : Tax.fromJson(json["tax_total"]),
      shippingDiscount: json["shipping_discount"] == null
          ? null
          : Tax.fromJson(json["shipping_discount"]),
      discount:
          json["discount"] == null ? null : Tax.fromJson(json["discount"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "item_total": itemTotal?.toJson(),
        "shipping": shipping?.toJson(),
        "handling": handling?.toJson(),
        "tax_total": taxTotal?.toJson(),
        "shipping_discount": shippingDiscount?.toJson(),
        "discount": discount?.toJson(),
      };

  @override
  String toString() {
    return "$itemTotal, $shipping, $handling, $taxTotal, $shippingDiscount, $discount, ";
  }
}

class Tax {
  Tax({
    required this.currencyCode,
    required this.value,
  });

  final String? currencyCode;
  final String? value;

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      currencyCode: json["currency_code"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "value": value,
      };

  @override
  String toString() {
    return "$currencyCode, $value, ";
  }
}

class Item {
  Item({
    required this.name,
    required this.description,
    required this.sku,
    required this.unitAmount,
    required this.tax,
    required this.quantity,
    required this.category,
  });

  final String? name;
  final String? description;
  final String? sku;
  final Tax? unitAmount;
  final Tax? tax;
  final String? quantity;
  final String? category;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"],
      description: json["description"],
      sku: json["sku"],
      unitAmount: json["unit_amount"] == null
          ? null
          : Tax.fromJson(json["unit_amount"]),
      tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
      quantity: json["quantity"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "sku": sku,
        "unit_amount": unitAmount?.toJson(),
        "tax": tax?.toJson(),
        "quantity": quantity,
        "category": category,
      };

  @override
  String toString() {
    return "$name, $description, $sku, $unitAmount, $tax, $quantity, $category, ";
  }
}

class Payee {
  Payee({
    required this.emailAddress,
    required this.merchantId,
    required this.displayData,
  });

  final String? emailAddress;
  final String? merchantId;
  final DisplayData? displayData;

  factory Payee.fromJson(Map<String, dynamic> json) {
    return Payee(
      emailAddress: json["email_address"],
      merchantId: json["merchant_id"],
      displayData: json["display_data"] == null
          ? null
          : DisplayData.fromJson(json["display_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "email_address": emailAddress,
        "merchant_id": merchantId,
        "display_data": displayData?.toJson(),
      };

  @override
  String toString() {
    return "$emailAddress, $merchantId, $displayData, ";
  }
}

class DisplayData {
  DisplayData({
    required this.businessEmail,
    required this.businessPhone,
    required this.brandName,
  });

  final String? businessEmail;
  final BusinessPhone? businessPhone;
  final String? brandName;

  factory DisplayData.fromJson(Map<String, dynamic> json) {
    return DisplayData(
      businessEmail: json["business_email"],
      businessPhone: json["business_phone"] == null
          ? null
          : BusinessPhone.fromJson(json["business_phone"]),
      brandName: json["brand_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "business_email": businessEmail,
        "business_phone": businessPhone?.toJson(),
        "brand_name": brandName,
      };

  @override
  String toString() {
    return "$businessEmail, $businessPhone, $brandName, ";
  }
}

class BusinessPhone {
  BusinessPhone({
    required this.nationalNumber,
  });

  final String? nationalNumber;

  factory BusinessPhone.fromJson(Map<String, dynamic> json) {
    return BusinessPhone(
      nationalNumber: json["national_number"],
    );
  }

  Map<String, dynamic> toJson() => {
        "national_number": nationalNumber,
      };

  @override
  String toString() {
    return "$nationalNumber, ";
  }
}
