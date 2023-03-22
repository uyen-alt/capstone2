import 'package:flutter/material.dart';
import 'package:lts_app/widgets/app_button.dart';
import 'package:lts_app/widgets/input_search_widget.dart';

class AddFriendScreen extends StatefulWidget {
  final double height;

  const AddFriendScreen({Key? key, required this.height}) : super(key: key);

  @override
  State<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.91,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black12),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const InputSearchWidget(
            hint: "Tìm kiếm",
            iconLeading: Icon(Icons.search),
            marginVertical: 8.0,
          ),
          _buildTitleOptions("Chia sẻ", Icons.link),
          _buildContentShare(),
          _buildTitleOptions("Gợi ý cho bạn", Icons.repeat),
          _buildSuggest(),
          _buildTitleOptions("Danh bạ", null),
          _buildListUser(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40.0,
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
            const Center(
              child: Text(
                "Thêm bạn",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleOptions(String title, IconData? iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          iconPath != null ? Icon(iconPath, size: 30) : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildContentShare() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return const CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent,
            radius: 20, //Text
          );
        }),
        separatorBuilder: ((context, index) => const SizedBox(width: 8.0)),
        itemCount: 4,
      ),
    );
  }

  Widget _buildSuggest() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: const BoxDecoration(
        color: Color(0x59e0e0e0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.location_history,
                    size: 30,
                  ),
                  SizedBox(width: 15.0),
                  Text(
                    "shipper",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ],
              ),
            ],
          ),
          AppButton(
              title: "Thêm vào",
              onTap: () {
                // [TODO] handler add shipper
              }),
        ],
      ),
    );
  }

  Widget _buildListUser() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemBuilder: ((context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrangeAccent,
                          radius: 25, //Text
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "123345667567",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                AppButton(
                    title: "Mời",
                    onTap: () {
                      // [TODO] handler add invite
                    }),
              ],
            );
          }),
          separatorBuilder: ((context, index) => const SizedBox(height: 8.0)),
          itemCount: 20,
        ),
      ),
    );
  }
}
