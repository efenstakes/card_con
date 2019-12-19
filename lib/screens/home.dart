import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:card_con/models/user.dart';



class Home extends StatefulWidget {
  
  @override 
  _HomeState createState()=> _HomeState();

}


class _HomeState extends State<Home> {

  bool isLoading = false;
  List<User> users = [];
  String userServerUrl = 'https://jsonplaceholder.typicode.com/users';

  @override 
  void initState() {
    super.initState();
    // call api functions
    getUsers();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( title: Text('My Cards'), ),

      body: _baseWidget(),

    );
  }// Widget build(BuildContext context) { .. }


  // parent / base app widget
  Widget _baseWidget() {
    return Container( 
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        padding: EdgeInsets.symmetric( vertical: 8, horizontal: 4 ),

        child: isLoading ? _loadingWidget() : _contactList(),

      );
  }// Widget _baseWidget() { .. }

  // show loader
  Widget _loadingWidget() {
    return Center( 
      child: Column(
        children: <Widget>[

          CircularProgressIndicator(),
          SizedBox( height: 40 , ),
          Text('Loading')

        ],
      ),
    );
  }// loadingWidget() { .. }

  Widget _contactList() {
    
    if( users.length == 0 ) {
      return Center( 
        child: Text(
                'You Have No Contacts Yet',
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w300,
                  letterSpacing: 1.0
                ),
              ),
      );
    }

    return ListView.separated(

      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        
        User currentUser = users[index];
        return _userTile(currentUser);

      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }// Widget contactList() { .. }

  // user tile
  Widget _userTile(user) {
    return ListTile(
        leading: CircleAvatar(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage( 
                image: NetworkImage(user.avatar), 
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          )
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Icon(Icons.keyboard_arrow_right),

        onTap: ()=> _viewUser(user),
    );
  }// Widget userTile(user) { .. }


  // navigate to view details page
  void _viewUser(user) async {
    // Navigator.push(
    //   context, 
    //   MaterialPageRoute(
    //     builder: (BuildContext context)=> UserDetailPage(user: user);
    //   )
    // );
  }// void _viewUser(user) { .. }


  void getUsers() async {
    setState(()=> this.isLoading = true );
    http.Response response = await http.get(userServerUrl);
    List<dynamic> usersJson = jsonDecode(response.body);

    setState(()=> this.isLoading = false );

    print(usersJson[0]['name']);
    List<User> users = usersJson.map((userJson) {
      return User.fromJson(userJson);
    }).toList();

    users.forEach((usr)=> print(usr.name) );

    setState(()=> this.users = users );
  }// Future<List<User>> getUsers() { .. }

}