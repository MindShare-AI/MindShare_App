import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mindshare_ai/model/account.dart';


class AccountAccess {
  // STATIC METHODS
  static Future<List<Account>> getAllAccounts() async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/account'));

    // request successfully
    if (response.statusCode == 200) {
      List<Account> accounts = [];

      for (Map<String, dynamic> currentAccountArray in jsonDecode(response.body)) {
        accounts.add(Account.fromArray(currentAccountArray));
      }

      return accounts;

    // request failed
    } else {
      throw Exception("API request failed to get all accounts");
    }
  }

  static Future<Account> getAccountByID(int idAccount) async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/account/$idAccount'));

    // request successfully
    if (response.statusCode == 200) {
      return Account.fromArray(jsonDecode(response.body));

    // request failed
    } else {
      throw Exception("API request failed to get specific account with this id :"
          "$idAccount");
    }
  }

  static Future<Account> getAccountByName(String lastName, String firstName) async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/'
            'account/$lastName/$firstName'));

    // request successfully
    if (response.statusCode == 200) {
      return Account.fromArray(jsonDecode(response.body));

    // request failed
    } else {
      throw Exception("API request failed to get specific account with this name"
          ": $lastName $firstName");
    }
  }
}
