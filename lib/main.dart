import 'package:flutter/material.dart';
import 'package:recipes/recipe_detail.dart';
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
        // 4 NOTE: SafeArea has a child widget, here we a list using ListView.
        child: ListView.builder(
          // 5 NOTE: itemCount determines the number of rows the list has.
          itemCount: Recipe.samples.length,
          // 6 NOTE: itemBuilder builds the widget tree for each row.
          itemBuilder: (BuildContext context, int index) {
            // 7 NOTE: Return a GestureDetector widget, which, as the name implies, detects gestures.
            return GestureDetector(
              // 8 NOTE: Implements an onTap function, which is the callback called when the widget is tapped.
              onTap: () {
                // 9 NOTE: The Navigator widget manages a stack of pages. Calling push() with a MaterialPageRoute will push a new Material page onto the stack.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10 NOTE: Builder creates the destination page widget. Here we return the RecipeDetail()
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              // 11 NOTE: The child widget that defines the area where the gesture is active.
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    // 1 NOTE: Return a Card from buildRecipeCard().
    return Card(
      // 1.1 NOTE: A card’s elevation determines how high off the screen the card is, affecting its shadow.
      elevation: 2.0,
      // 1.2 NOTE: Shape handles the shape of the card. This code defines a rounded rectangle with a 10.0 corner radius.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      // 1.3 NOTE: Padding insets its child’s contents by the specified padding value.
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        // 2 NOTE: The Card’s child property is a Column
        child: Column(
          // 3 NOTE: The Column has two children.
          children: [
            // 4 NOTE: he first child is an Image widget. AssetImage states that the image is fetched from the local asset bundle defined in pubspec.yaml.
            Image(image: AssetImage(recipe.imageUrl)),
            // 4.1 NOTE: Between the image and text is a SizedBox. This is a blank view with a fixed size.
            const SizedBox(
              height: 14.0,
            ),

            // 5 NOTE: A Text widget is the second child. It will contain the recipe.label value.
            Text(
              recipe.label,
              // 5.1 NOTE: We can customize Text widgets with a style object. In this case, you’ve specified a Palatino font with a size of 20.0 and a bold weight of w700.

              style: const TextStyle(
                fontFamily: 'Palatino',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
