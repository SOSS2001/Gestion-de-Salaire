import 'dart:io';

void main() {
  stdout.write('nom et prenom: ');
  String? nomPrenom = stdin.readLineSync();
  stdout.write('sexe: ');
  String? sexe = stdin.readLineSync();
  stdout.write('service: ');
  String? service = stdin.readLineSync();
  stdout.write('ancienneté: ');
  double? ancienneté = double.parse(stdin.readLineSync()!);
  stdout.write('situation: ');
  String? situation = stdin.readLineSync();
  stdout.write('nombre enfant: ');
  int? nombreEnfant = int.parse(stdin.readLineSync()!);
  
  double sbbase = 0;
  if (service == "achat") {
    sbbase = 7500;
  } else if (service == "vente") {
    sbbase = 6500;
  } else if (service == "personnel") {
    sbbase = 5000;
  } else {
    sbbase = 4500;
  }
  
  double cnss;
  if (sbbase < 6000) {
    cnss = sbbase * 4.48 / 100;
  } else {
    cnss = 6000 * 4.48 / 100;
  }
  
  double allocation;
  if (nombreEnfant! <= 3) {
    allocation = nombreEnfant * 300;
  } else if (nombreEnfant <= 6) {
    allocation = (300 * 3) + (nombreEnfant - 3) * 100;
  } else {
    allocation = (300 * 3) + (100 * 3);
  }
  
  double cimrr;
  if (sbbase < 6000) {
    cimrr = sbbase * 2 / 100;
  } else {
    cimrr = sbbase * 3 / 100;
  }
  
  double panc;
  if (ancienneté < 2) {
    panc = sbbase * 0;
  } else if (ancienneté < 5) {
    panc = sbbase * 2 / 100;
  } else if (ancienneté < 10) {
    panc = sbbase * 5 / 100;
  } else if (ancienneté < 15) {
    panc = sbbase * 10 / 100;
  } else {
    panc = sbbase * 15 / 100;
  }
  
  double snet = sbbase - cnss - cimrr + panc + allocation;

  print('''  
nom et prenom: $nomPrenom
sexe: $sexe
service: $service
ancienneté: $ancienneté
situation: $situation
nombre enfant: $nombreEnfant
salaire base: $sbbase
cnss: $cnss
cimrr: $cimrr
panc: $panc
allocation: $allocation
salaire net: $snet
''');
}
