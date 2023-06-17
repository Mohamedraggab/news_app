import 'package:flutter/material.dart';

buildCard({required dataList , required index})
{
  return Card(
    margin:const EdgeInsets.all(1),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(dataList[index]['urlToImage'] ?? 'https://www.vuescript.com/wp-content/uploads/2018/11/Show-Loader-During-Image-Loading-vue-load-image.png'),
        ),
        title: Text(dataList[index]['title'] ,
            softWrap: true ,maxLines: 3 ,textDirection: TextDirection.rtl,
            style: const TextStyle(fontWeight: FontWeight.bold ,)),
        subtitle:Text(dataList[index]['publishedAt']),

      ),
    ),
  );
}