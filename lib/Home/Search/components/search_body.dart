import 'package:app2/Home/Search/components/Search_header.dart';
import 'package:flutter/cupertino.dart';

class Search_Body extends StatelessWidget {
  const Search_Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 10),
            SearchHeader(),
          ],
        ),
      ),
    );
  }
}
