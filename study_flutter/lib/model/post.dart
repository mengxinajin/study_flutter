class Post{
  const Post({
      this.title,
      this.author,
      this.imgUrl,

  });
  final String title;
  final String author;
  final String imgUrl;

}
final List<Post> posts = [
  Post(title: "123",
    author: "张三",
    imgUrl: "https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh%3D450%2C600/sign=a587b23df11f3a295a9dddcaac159007/500fd9f9d72a60590cfef2f92934349b023bba62.jpg"
  ),
  Post(title: "124",
      author: "李四",
      imgUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic4.zhimg.com%2F50%2Fv2-823f52256c4db5dd8ba72bca329e31be_hd.jpg&refer=http%3A%2F%2Fpic4.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621934144&t=1ae03a40390e8a55f4043125622692f4"
  ),
  Post(title: "125",
      author: "王五",
      imgUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2F50%2Fv2-efe7a9615c763c97f9ed205dd9e1338a_hd.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621934144&t=970a868c6b37e79c41ce012b2ba52126"
  ),
];