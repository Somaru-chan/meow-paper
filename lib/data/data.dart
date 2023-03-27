import 'package:meow_paper/model/categories_model.dart';

String apiKey = "563492ad6f917000010000011ea2c97ca83a4235bd53efc1735a3916";

List<CategoriesModel> getCategories() {

  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Kittens";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/5732429/pexels-photo-5732429.jpeg?auto=compress&cs=tinysrgb&w=800";
  categoriesModel.categoryName = "Pet Birthday";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/4588071/pexels-photo-4588071.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Rabbit";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/1183434/pexels-photo-1183434.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Cute Cats";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Birds";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/1854219/pexels-photo-1854219.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Intl Cat Day";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/732456/pexels-photo-732456.jpeg?auto=compress&cs=tinysrgb&w=800";
  categoriesModel.categoryName = "Funny Dogs";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/20861/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Iguana";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/1093126/pexels-photo-1093126.jpeg?auto=compress&cs=tinysrgb&w=800";
  categoriesModel.categoryName = "Guinea Pig";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


  return categories;

}