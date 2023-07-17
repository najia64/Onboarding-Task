import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';



class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: 
        Center(
          child: 
          Text("Click 'Fetch' to Get Movies", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: model.navigateTo,
          label: const Text("Fetch"),
          icon: const Icon(Icons.navigate_next_rounded),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }

}

