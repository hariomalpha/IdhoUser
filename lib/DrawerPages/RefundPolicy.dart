import 'dart:convert';

import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import '../utils/Session.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';

class RefundPolicy extends StatefulWidget {
  const RefundPolicy({Key? key}) : super(key: key);

  @override
  State<RefundPolicy> createState() => _RefundPolicyState();
}

class _RefundPolicyState extends State<RefundPolicy> {

  @override
  void initState() {
    super.initState();
    getRefundPolicy();
  }

  var privacyPolicy;
  var privacyPolicyTitle;

  getRefundPolicy() async {
    var headers = {
      'Cookie': 'ci_session=0972dd56b7dcbe1d24736525bf2ee593c03d46de'
    };
    var request = http.Request('GET', Uri.parse(baseUrl1 + 'page/policy'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('_______sdfsdfsdf___${response.statusCode}_________');
      final result =  await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      print('______asdsadsa____${result}_________');
      setState(() {
        privacyPolicy = jsonResponse['data']['description'];
        // privacyPolicyTitle = jsonResponse['setting']['title'];
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: MyGradients.linearGradient
          ),
        ),
        // backgroundColor: AppTheme.primaryColor,
        title: Text(
          getTranslated(context, 'REDUND_POLICY')!,
          style: TextStyle(
            color: Colors.white, fontSize: 19
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 8,top: 5),
            //   child: Text("$privacyPolicyTitle",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
            // ),
            privacyPolicy == null || privacyPolicy == "" ? Center(child: CircularProgressIndicator(color: Colors.red)):
            Html(
                data:"$privacyPolicy"
            ),
          ],
        ),
      ),
    );
  }
}
