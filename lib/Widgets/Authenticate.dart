import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 280,
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: const Color.fromRGBO(242, 242, 242, 1),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("دوباره ارسال شود؟",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ))),
                  const Text(
                      "لطفا کد ارسال شده به شماره وارد شده را وارد نمایید",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            //it goes for Authentication code
            Container(
              width: 260,
              height: 140,
              color: Colors.grey,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: 118,
                height: 32,
                decoration: const BoxDecoration(color: Color(0xff407bff)),
                child: const Text("تایید",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
