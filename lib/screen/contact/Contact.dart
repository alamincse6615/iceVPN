
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contact Us "),
        /*actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],*/
      ),
      body: SafeArea(

        child: new Column(
          children: [
            new Container(
              child: Image.asset("assests/image/logo.png",
                height: 200,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("123456789",
              style: TextStyle(fontSize: 20)
              ),
              subtitle: const Text('call Us for more details',
                style: TextStyle(color: Colors.red),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.email),
              title: const Text("support@icevpn.com",
                  style: TextStyle(fontSize: 20)
              ),
              subtitle: const Text("For more information mail us ",
                style: TextStyle(color: Colors.red),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              leading: const Icon(Icons.label),
              title: const Text('About Ice VPN',
                  style: TextStyle(fontSize: 20)
              ),
              subtitle: const Text('A virtual private network, or VPN, is an encrypted connection over the Internet from a device to a network. The encrypted connection helps ensure that sensitive data is safely transmitted. It prevents unauthorized people from eavesdropping on the traffic and allows the user to conduct work remotely.',
                style: TextStyle(color: Colors.red),),
            ),

            new ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Thank You For Using Ice VPN',
                  style: TextStyle(fontSize: 15)
              ),
              subtitle: const Text(''),
            ),
            const Divider(
              height: 1.0,
            ),

          ],
        ),
      ),
    );

    /*
   return Scaffold(
        body: SafeArea(
          child: Column(

            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://softitcare.com/images/logo/SoftITCareLogo.png"
                        ),
                        fit: BoxFit.cover
                    )
                ),
                child: Container(

                 */ /* width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0,2.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://softitcare.com/images/logo/SoftITCareLogo.png"
                      ),
                      radius: 60.0,
                    ),
                  ),


                ),
              ),

              SizedBox(
                height: 60,
              ),
              Text(
                "Soft It Care"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Niketon, Gulshan-1"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Software Development Company"
                ,style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.call),

                      ),
                    ),

                  ],
                ),
              ),
            ],

          ),
        ),

    );*/
  }
}
