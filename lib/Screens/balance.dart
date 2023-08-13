import 'package:build_mate/Provider/balance_Provider.dart';
import 'package:build_mate/Widgets/balanceItems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/appbar.dart';
import '../Widgets/drawer.dart';

class BalanceScreen extends StatefulWidget {
  static const routeName = 'balance';

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  var _isLoading = true;
  @override
  void initState() {
    super.initState();

    Provider.of<ProviderBalance>(context, listen: false)
        .fetchBalanceItem()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final format = Provider.of<ProviderBalance>(context);
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: MediaQuery.of(context).size.height * 0.08,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        backgroundColor: Colors.blue,
        child: drawerWidget(),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  _buildAccountInfoCard(context),
                  const SizedBox(height: 16.0),
                  Flexible(
                    child: Consumer<ProviderBalance>(
                      builder: (context, providerBalance, _) {
                        final List<dynamic> data = providerBalance.balanceItem;
                        if (data.isEmpty) {
                          return const Center(
                            child: Text(
                              'هیچ تراکنشی ای اضافه نشده + لمس کنید',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: format.refresh,
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                balanceItems(data[index]),
                            itemCount: data.length,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildAccountInfoCard(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مانده صندوق',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'تومان900,000', // Replace with actual balance
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
