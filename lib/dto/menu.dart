class Menu {
  final int idMenu;
  final String menuName;
  final String descMenu;
  final int menuPrice; // Update Int to int
  final String? imageUrl;

  Menu({
    required this.idMenu,
    required this.menuName,
    required this.descMenu,
    required this.menuPrice,
    this.imageUrl, // Make imageUrl optional
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        idMenu: json['id_menu'] as int,
        menuName: json['nama_menu'] as String,
        descMenu: json['desc_menu'] as String,
        menuPrice: json['harga_menu'] as int, // Update Int to int
        imageUrl: json['img'] as String?,
      );
}




// class Menu {
//   final int idMenu;
//   final String menuName;
//   final String descMenu;
//   final Int menuPrice;
//   final String? imageUrl;

//   Menu(
//       {required this.idMenu,
//       required this.menuName,
//       required this.descMenu,
//       required this.menuPrice,
//       required this.imageUrl});

//   // factory Menu.fromJson(Map<String, dynamic> json) => Menu(
//   //       idMenu: json['id_menu'],
//   //       menuName: json['nama_menu'],
//   //       descMenu: json['desc_menu'],
//   //       menuPrice: json['harga_menu'],
//   //       imageUrl: json['img'],
//   //     );

//   factory Menu.fromJson(Map<String, dynamic> json) => Menu(
//       idMenu: json['id_menu'] as int,
//       menuName: json['nama_menu'] as String,
//       descMenu: json['desc_menu'] as String,
//       menuPrice: json['harga_menu'] as Int,
//       imageUrl: json['img'] as String);
// }
