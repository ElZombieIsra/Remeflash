library globals;
import 'package:intl/intl.dart';
String title = "Remeflash";

List countrys = [
  'México', 
  'Estados Unidos', 
  'Canadá'
], currencys = [
  "MXN",
  "USD"
], accounts = [
  "Visa 3167"
], paymentTypes = [
  "Cuenta bancaria",
  "Tarjeta de crédito",
  "Tarjeta de débito"
];

String country, account, currency, 
  subscribeUrl = "https://us-central1-remeflash-8d649.cloudfunctions.net/subscribeToTopic?token=",
  notificationUrl = "https://us-central1-remeflash-8d649.cloudfunctions.net/sendNotification?money=";
Map card = {
  'number': null,
  'date': null,
  'code': null
};
double quantity;
int paymentType;

// Tells if the money is going in (true) or going out (false)
bool import;


String numberFormat(num){
  var f = NumberFormat("#,##0.00", "es_MX");
  return "${f.format(num)}";
}

void clearData(){
  country = null;
  account = null;
  currency = null;
  card = {
    'number': null,
    'date': null,
    'code': null
  };
  quantity = null;
  paymentType = null;
  import = null;
}