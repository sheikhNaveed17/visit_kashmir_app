import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
        name: 'Places',
        imageUrl:
            'https://images.unsplash.com/photo-1621232051504-dc6f30ba8bc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=8'
    ),

    const Category(
        name: 'Food',
        imageUrl:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60'
    ),

    const Category(
        name: 'Shopping',
        imageUrl:
        'https://images.unsplash.com/photo-1560243563-062bfc001d68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xvdGhpbmd8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    ),

    const Category(
        name: 'Shopping',
        imageUrl:
        'https://images.unsplash.com/photo-1560243563-062bfc001d68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xvdGhpbmd8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    ),



  ];
}
