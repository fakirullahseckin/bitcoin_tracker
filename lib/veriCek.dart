import 'internet.dart';

Future<dynamic> getData() async {
  Networking networking = Networking(
      "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=6BF59545-1A8F-4FD2-9917-06F7A96DF661");
  var data = await networking.getData();
  print(data);
  return data;
}
