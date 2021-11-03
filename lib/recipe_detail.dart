import 'package:flutter/material.dart';
import 'recipe.dart';

// 1 NOTE: Creates a new StatefulWidget which has an initializer that takes the Recipe details to display. This is a StatefulWidget because you’ll add some interactive state to this page later.

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderVal here

  @override
  Widget build(BuildContext context) {
    // 2 NOTE: Scaffold defines the page’s general structure.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
        // 2.1 NOTE: Because you now have a Scaffold with an appBar, Flutter will automatically include a back button to return the user to the main list.
      ),

      // 3 NOTE: In the body, there’s a SafeArea, a Column with a Container, a SizedBox and Text children.
      body: SafeArea(
        child: Column(
          children: [
            // 4 NOTE: One new thing is the SizedBox around the Image, which defines resizable bounds for the image. Here, the height is fixed at 300 but the width will adjust to fit the aspect ratio. The unit of measurement in Flutter is logical pixels.
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // 5 NOTE: There is a spacer SizedBox.
            const SizedBox(
              height: 4,
            ),
            // 6 NOTE: The Text for the label has a style that’s a little different than the main Card, to show you how much customizability is available.
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),

            // TODO: Add Expanded

            // TODO: Add Slider() here
          ],
        ),
      ),
    );
  }
}

// NOTE: Create a simple data container for an ingredient.
class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
