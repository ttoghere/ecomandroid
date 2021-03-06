import 'package:ecomandroid/providers/viewed_provider.dart';
import 'package:ecomandroid/screens/cart/empty_screen.dart';
import 'package:ecomandroid/screens/viewed_recently/viewed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../services/global_methods.dart';
import '../../shared/text_widget.dart';
import '../onsale/on_sale_screen.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';

  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyScreenState createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProvider>(context);
    final viewedProviderList =
        viewedProvider.viewedItems.values.toList().reversed.toList();
    bool _isEmpty = true;
    if (viewedProviderList.isEmpty) {
      return EmptyScreen(
        title: "Your history is empty",
        subtitle: "No products have been viewed",
        buttonText: "Shop Now",
        imagePath: "images/history.png",
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: 'Empty your history?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: Colors.black,
              ),
            )
          ],
          leading: const BackWidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'History',
            color: Colors.black,
            textSize: 24.0,
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: ChangeNotifierProvider.value(
                    value: viewedProviderList[index],
                    child: ViewedRecentlyWidget()),
              );
            }),
      );
    }
  }
}
