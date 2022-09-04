import 'package:flutter/material.dart';
import 'package:news_application/modules/webview/webview_screen.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  IconButton? suffixIcon,
  ValueChanged<String>? onFieldSubmitted,
  ValueChanged<String>? onChanged,
  FormFieldValidator<String>? validator,
  GestureTapCallback? onTap,
  bool obscureText = false,
}) => TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  double radius = 10.0,
  Color color = Colors.blue,
  required VoidCallback? onPressed,
  required String text,
}) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget divideBy() => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => true,
  );
}

Widget buildItem(context, Map articles) => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            navigateTo(context, WebViewScreen(articles['url']));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        articles['urlToImage'] ?? 'https://www.lbcgroup.tv/newsimages/news-P-default-ar.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          articles['content'] ?? 'No Content To Show',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          articles['publishedAt'],
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget buildListItem(context, cubit, {bool isSearch = true})
    => cubit.isNotEmpty
    ? ListView.separated(
  itemBuilder: (context, index) => buildItem(context, cubit[index]),
  separatorBuilder: (context, index) => const SizedBox(
    height: 15,
  ),
  itemCount: cubit.length,
)
    : isSearch == true ? const Center(child: CircularProgressIndicator()) : Container();