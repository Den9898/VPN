import 'package:flutter/material.dart';
import 'package:untitled4/presentation/wighet/vpn_button.dart';
import 'package:untitled4/presentation/wighet/vpn_layout.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:flutter_vpn/state.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterVpnState vpnStatus = FlutterVpnState.disconnected;
  CharonErrorState? charonState = CharonErrorState.NO_ERROR;

  @override
  void initState() {
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((s) => setState(() => vpnStatus = s));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VpnLayout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildVpnButton(vpnStatus),
          ],
        ),
      ),
    );
  }

  Widget _buildVpnButton(FlutterVpnState status) {
    if (status == FlutterVpnState.disconnected) {
      return VpnButton.text(
        title: 'Подключить VPN',
        onTap: () => FlutterVpn.connectIkev2EAP(
          server: '',
          username: 'username',
          password: 'password',
        ),
      );
    }

    if (status == FlutterVpnState.connected) {
      return VpnButton.text(
        title: 'Отключиться',
        onTap: () => FlutterVpn.disconnect(),
      );
    }

    if (status == FlutterVpnState.connecting || status == FlutterVpnState.disconnecting) {
      return VpnButton(
        title: const CircularProgressIndicator(),
        onTap: () {},
      );
    }

    if (status == FlutterVpnState.error) {
      return Column(
        children: [
          VpnButton.text(
            title: 'Подключить VPN',
            onTap: () => FlutterVpn.connectIkev2EAP(
              server: '',
              username: 'username',
              password: 'password',
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Что-то пошло не так, повторите попытку',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12.0,
            ),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}