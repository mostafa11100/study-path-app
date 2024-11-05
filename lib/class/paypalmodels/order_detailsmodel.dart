class DetailsOrderModel {
  DetailsOrderModel({
    required this.id,
    required this.status,
    required this.intent,
    required this.paymentSource,
    required this.purchaseUnits,
    required this.payer,
    required this.createTime,
    required this.links,
  });

  final String? id;
  final String? status;
  final String? intent;
  final PaymentSource? paymentSource;
  final List<PurchaseUnit> purchaseUnits;
  final Payer? payer;
  final DateTime? createTime;
  final List<Link> links;

  factory DetailsOrderModel.fromJson(Map<String, dynamic> json) {
    return DetailsOrderModel(
      id: json["id"],
      status: json["status"],
      intent: json["intent"],
      paymentSource: json["payment_source"] == null
          ? null
          : PaymentSource.fromJson(json["payment_source"]),
      purchaseUnits: json["purchase_units"] == null
          ? []
          : List<PurchaseUnit>.from(
              json["purchase_units"]!.map((x) => PurchaseUnit.fromJson(x))),
      payer: json["payer"] == null ? null : Payer.fromJson(json["payer"]),
      createTime: DateTime.tryParse(json["create_time"] ?? ""),
      links: json["links"] == null
          ? []
          : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "intent": intent,
        "payment_source": paymentSource?.toJson(),
        "purchase_units": purchaseUnits.map((x) => x?.toJson()).toList(),
        "payer": payer?.toJson(),
        "create_time": createTime?.toIso8601String(),
        "links": links.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $status, $intent, $paymentSource, $purchaseUnits, $payer, $createTime, $links, ";
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

class Payer {
  Payer({
    required this.name,
    required this.emailAddress,
    required this.payerId,
  });

  final Name? name;
  final String? emailAddress;
  final String? payerId;

  factory Payer.fromJson(Map<String, dynamic> json) {
    return Payer(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      emailAddress: json["email_address"],
      payerId: json["payer_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "email_address": emailAddress,
        "payer_id": payerId,
      };

  @override
  String toString() {
    return "$name, $emailAddress, $payerId, ";
  }
}

class Name {
  Name({
    required this.givenName,
    required this.surname,
  });

  final String? givenName;
  final String? surname;

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      givenName: json["given_name"],
      surname: json["surname"],
    );
  }

  Map<String, dynamic> toJson() => {
        "given_name": givenName,
        "surname": surname,
      };

  @override
  String toString() {
    return "$givenName, $surname, ";
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
  Paypal({
    required this.name,
    required this.emailAddress,
    required this.accountId,
  });

  final Name? name;
  final String? emailAddress;
  final String? accountId;

  factory Paypal.fromJson(Map<String, dynamic> json) {
    return Paypal(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      emailAddress: json["email_address"],
      accountId: json["account_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "email_address": emailAddress,
        "account_id": accountId,
      };

  @override
  String toString() {
    return "$name, $emailAddress, $accountId, ";
  }
}

class PurchaseUnit {
  PurchaseUnit({
    required this.referenceId,
    required this.amount,
  });

  final String? referenceId;
  final Amount? amount;

  factory PurchaseUnit.fromJson(Map<String, dynamic> json) {
    return PurchaseUnit(
      referenceId: json["reference_id"],
      amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "amount": amount?.toJson(),
      };

  @override
  String toString() {
    return "$referenceId, $amount, ";
  }
}

class Amount {
  Amount({
    required this.currencyCode,
    required this.value,
  });

  final String? currencyCode;
  final String? value;

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
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
