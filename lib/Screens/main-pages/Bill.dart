import 'package:build_mate/Provider/chargh_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/billItem.dart';

class Bill extends StatefulWidget {
  const Bill({super.key});

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  var _isLoading = true;
  @override
  void initState() {
    super.initState();

    Provider.of<ProviderChargh>(context, listen: false).fetchChargh().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  //get number of residence !
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : MyListView());
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final format = Provider.of<ProviderChargh>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Consumer<ProviderChargh>(
        builder: (context, providerChargh, _) {
          final List<dynamic> data = providerChargh.charghItems;
          if (data.isEmpty) {
            return const Center(
              child: Text(
                'هیچ شارژی اعلام نشده',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: format.refresh,
            child: ListView.builder(
              itemBuilder: (context, index) => billItem(data[index]),
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}
