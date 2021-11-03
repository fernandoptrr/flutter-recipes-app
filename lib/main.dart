import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // 1 NOTE: Entry point for composing together other widgets to make a new widget.
  @override
  Widget build(BuildContext context) {
    // 2 NOTE: A theme determines visual aspects like color
    final ThemeData theme = ThemeData();

    // 3 NOTE: Uses Material Design
    return MaterialApp(
      // 4 NOTE: The title of the app is a description that the device uses to identify the app. The UI won’t display this.
      title: 'Recipe Calculator',
      // 5 NOTE: Copying the theme and replacing the color scheme
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      // 6 NOTE: uses the MyHomePage widget
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1 NOTE: A Scaffold provides the high-level structure for a screen.
    return Scaffold(
      // 2 NOTE: AppBar gets a title property by using a Text widget that has a title passed in from home
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3 NOTE: Body has SafeArea, which keeps the app from getting too close to the operating system interfaces such as the notch or interactive areas
      body: SafeArea(
        // TODO: Replace child: Container()
        // 4 NOTE: SafeArea has a child widget, here we a list using ListView.
        child: ListView.builder(
          // 5 NOTE: itemCount determines the number of rows the list has.
          itemCount: Recipe.samples.length,
          // 6 NOTE: itemBuilder builds the widget tree for each row.
          itemBuilder: (BuildContext context, int index) {
            // 7 NOTE: A Text widget displays the name of the recipe.
            // TODO: Update to return Recipe card
            return Text(Recipe.samples[index].label);
          },
        ),
      ),
    );
  }
  // TODO: Add buildRecipeCard() here
}
