class Menu {
  final int idMenu;
  final String menuName;
  final String descMenu;
  final String menuPrice;
  final String? imageUrl;

  Menu(
      {required this.idMenu,
      required this.menuName,
      required this.descMenu,
      required this.menuPrice,
      this.imageUrl});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        idMenu: json['id_menu'],
        menuName: json['nama_menu'],
        descMenu: json['desc_menu'],
        menuPrice: json['harga_menu'],
        imageUrl: json['img'],
      );
}
