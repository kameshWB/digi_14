class APIs {
  static const String url = "https://api.seatgeek.com/2";
  static const String clientId = "Mjc2NzU0MzB8MTY1NjY3MDA0NS40NTAxMDY";
  static const String clientSecret =
      "da1d9faca77b5bb9408d2ec4f8771e9e0467f8284248db276d9c76a18dc7683e";
  static const String events =
      url + "/events" + "?client_id=$clientId" + "&client_secret=$clientSecret";

  static String searchEvent(String query) => events + "&q=$query";
}

