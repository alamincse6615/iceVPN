import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';
import 'package:http/http.dart' as http;
import 'package:securevpn/constants/stringConst.dart';

class Vpn with ChangeNotifier {
  final String id;
  final String name;
  final String country;
  final String countryCode;
  final String ovpn;
  final String status;
  final String password;
  final String username;
  bool paidStatus;


  Vpn({
    @required this.password,
    @required this.username,
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.countryCode,
    @required this.ovpn,
    this.paidStatus,
    this.status = 'Not Connected',
  });

  get speed => null;

  get ping => null;
}

class Vpns with ChangeNotifier {
  int time = 0;
  String timeString = '00:00:00';
  List<Vpn> _vpns;
  List<Vpn> _paidVpns;
  List<String> _paidVpnPassList;


  List<String> get paidVpnPassList => [..._paidVpnPassList];
  List<Vpn> get vpns => [..._vpns];
  List<Vpn> get paidvpns => [..._paidVpns];

  String _connectionState = 'Not Connected';
  String get connectionState => _connectionState;
  set connectionState(String connectionState) {
    _connectionState = connectionState;
    notifyListeners();
  }

  Vpn _connectedVpn;
  Vpn get connectedVpn => _connectedVpn;

  set connectedVpn(Vpn vpn) {
    _connectedVpn = vpn;
    notifyListeners();
  }

  Vpn getHighSpeed() {
    // var _newVpn = _vpns;
    return _vpns[0];
  }

  Future<void> fetchVpns() async {
    List<Vpn> _newVpns = [];
    List<Vpn> _newPaidVpns = [];
    List<String> _newpaidVpnPassList = [];
    try {
      final request = await http.get(StringConst.URl);
      var decodedResponse = jsonDecode(request.body);
      var rawVpns = decodedResponse['vpns'];
      print(rawVpns);
      for (var v in rawVpns) {
        Vpn _vpn = Vpn(
            id: v['id'],
            name: v['name'],
            country: v['country'],
            countryCode: v['flagLogo'],
            username: v['username'],
            password: v['password'],
            ovpn: v['configScriptTCP'],
            paidStatus: v['paid']);

        if(v['paid']){
          _newPaidVpns.add(_vpn);
          _newpaidVpnPassList.add(_vpn.password);
        }else{
          _newVpns.add(_vpn);
        }
      }
    } catch (err) {
      print(err);
    }

    _vpns = _newVpns;
    _paidVpns = _newPaidVpns;
    _paidVpnPassList = _newpaidVpnPassList;
    notifyListeners();
  }

  void connect(Vpn vpn) async {
    FlutterOpenvpn.init(
      localizedDescription: "Ice VPN",
      providerBundleIdentifier: "com.phariddot.securevpn.SecureVPN",
    );

    FlutterOpenvpn.lunchVpn(vpn.ovpn, (isProfileLoaded) {}, (newVpnStatus) {
      _connectedVpn = vpn;
      _connectionState = newVpnStatus;
      notifyListeners();
    }, user: vpn.username, pass: vpn.password);
  }

  void disconnect() {
    FlutterOpenvpn.stopVPN();
    time = 0;
    timeString = "00:00:00";

    _connectedVpn = null;
    _connectionState = 'Not Connected';
    notifyListeners();
  }
}
