import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            )
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blueAccent,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 1.0,
            ),
          ),
          hintText: "Search",
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
