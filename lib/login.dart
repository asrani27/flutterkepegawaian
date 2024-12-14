import 'package:flutter/material.dart';
import 'package:pertemuanke2/api/service.dart';
import 'package:pertemuanke2/dashboard.dart';
import 'package:get/get.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formState = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future _masuk() async {
    var response = await DataService().LoginService(_user.text, _pass.text);
    if (response == true) {
      Get.offAll(Dashboard());
    } else {
      Get.defaultDialog(
        title: 'User/pass Salah',
      );
    }
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
        ),
        //backgroundColor: Colors.blueGrey,
        title: Text(
          "APLIKASI PEGAWAI",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Menu')));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Cari')));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Setting')));
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://png.pngtree.com/png-vector/20221027/ourmid/pngtree-official-logo-of-korpri--corps-employees-the-republic-indonesia-png-image_6390913.png',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
                controller: _user,
                decoration: InputDecoration(
                    labelText: 'Username', prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "password tidak boleh kosong";
                  }
                  return null;
                },
                controller: _pass,
                decoration: InputDecoration(
                    labelText: 'Password', prefixIcon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      _masuk();
                    }
                  },
                  child: Text('LOGIN')),
            ],
          ),
        ),
      ),
    );
  }
}
