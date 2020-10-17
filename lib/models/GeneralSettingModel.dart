class GeneralSettingModel {
  String apptitle;
  String currency;
  String title;
  String contactemail;
  String contactphone;
  String contactaddress;
  double spilloverfee;
  double usdrate;
  double nairarate;
  double tronmax;
  double tronmin;
  double bankmax;
  double bankmin;

  GeneralSettingModel(
      {this.title,
      this.currency,
      this.apptitle,
      this.contactemail,
      this.contactaddress,
      this.contactphone,
      this.spilloverfee,
      this.usdrate,
      this.bankmax,
      this.bankmin,
      this.nairarate,
      this.tronmax,
      this.tronmin});

  static GeneralSettingModel fromJson(Map<String, dynamic> json) {
    return GeneralSettingModel(
      apptitle: json["setting"]['sitename'],
      currency: json["setting"]['cur_text'],
      contactemail: json["setting"]['contact_email'],
      contactaddress: json["setting"]['contact_address'],
      contactphone: json["setting"]['contact_phone'],
      spilloverfee: double.parse(json["setting"]['spill_over_fee']),
      bankmax: double.parse(json["bank_max"]),
      bankmin: double.parse(json["bank_min"]),
      tronmax: double.parse(json["tron_max"]),
      tronmin: double.parse(json["tron_min"]),
      nairarate: double.parse(json["naira_rate"]),
      usdrate: double.parse(json["usd_rate"]),
    );
  }
}
