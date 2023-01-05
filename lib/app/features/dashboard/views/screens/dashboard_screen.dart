library dashboard;

import 'package:cached_network_image/cached_network_image.dart';
import '/app/config/routes/app_pages.dart';
import '/app/shared_components/async_button.dart';
import '/app/utils/services/service.dart';

import '../../../../shared_components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/add_button.dart';
import 'home/camera.dart';
import 'home/contacts.dart';
import 'home/dasboard.dart';
import 'home/events.dart';
import 'home/location.dart';
import 'home/my_drawer_header.dart';
import 'home/notes.dart';
import 'home/privacy_policy.dart';
import 'home/send_feedback.dart';
import 'home/settings.dart';




// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// component
part '../components/sign_out_button.dart';




class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dasboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dasboard) {
      container = DasboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.addbutton) {
      container = AddButtonPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    } else if (currentPage == DrawerSections.location) {
      container = LocationPage();
    } else if (currentPage == DrawerSections.camera) {
      container = CameraPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[700],
        title: Text("Rural Vistaar"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // show the  list of menu drawer
        children: [
          menuItem(1, "Dasboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dasboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "AddButton", Icons.add_box,
              currentPage == DrawerSections.addbutton ? true : false),
          menuItem(7, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          menuItem(9, "Location", Icons.location_city_sharp,
              currentPage == DrawerSections.location ? true : false),
          menuItem(10, "Camera", Icons.camera_alt_outlined,
              currentPage == DrawerSections.camera ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dasboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.addbutton;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 9) {
              currentPage = DrawerSections.location;
            } else if (id == 10) {
              currentPage = DrawerSections.camera;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dasboard,
  contacts,
  events,
  notes,
  settings,
  addbutton,
  privacy_policy,
  send_feedback,
  location,
  camera,
}
