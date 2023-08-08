import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Residence_provider.dart';

// ignore: must_be_immutable
class ResidenceList extends StatelessWidget {
  ResidenceList({
    super.key,
    required this.id,
    required this.name,
    required this.floor,
    required this.block,
    required this.unit,
    this.debt,
    this.ask,
  });

  final String id;
  final String name;
  final String floor;
  final String block;
  final String unit;
  String? debt;
  String? ask;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.redAccent,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text(
              'مطمِین هستید ؟ ',
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('خیر'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('بله'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Future.delayed(const Duration(milliseconds: 100), () {
          Provider.of<ResidenceProvider>(context, listen: false)
              .removeResidence(id);
        });
        ScaffoldMessenger.of(context)
            .removeCurrentSnackBar(); // Clear any existing SnackBars.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("آیتم با موفقیت حذف شد."),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff8cb0ff),
        ),
        child: ListTile(
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(206, 221, 255, 1),
                        child: Icon(
                          Icons.person,
                          color: Color.fromRGBO(64, 123, 255, 1),
                        ),
                      ),
                      Text(name),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'بلوک: $block',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'واحد: $unit',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'طبقه: $floor',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'بدهی/طلب',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        debt != null ? 'بدهی: $debt' : 'طلب: $ask',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
