import 'package:flutter/material.dart';

class FiverrScreen2 extends StatefulWidget {
  const FiverrScreen2({Key? key}) : super(key: key);

  @override
  _FiverrScreen2State createState() => _FiverrScreen2State();
}

class _FiverrScreen2State extends State<FiverrScreen2> {
  int grpValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF881284),
      appBar: AppBar(
        backgroundColor: const Color(0xFF640D64),
        title: const Text("Streaming"),
        centerTitle: false,
      ),
      drawer: const Drawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.width * 0.70 - 44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: MediaQuery.of(context).size.width * 0.70 - 80,
                        decoration: const BoxDecoration(
                            //  color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimagesvc.meredithcorp.io%2Fv3%2Fmm%2Fimage%3Furl%3Dhttps%253A%252F%252Fstatic.onecms.io%252Fwp-content%252Fuploads%252Fsites%252F6%252F2014%252F06%252Fcolbert612.jpg&q=85",
                                ),
                                fit: BoxFit.fill)),
                        child: Container(
                          margin: const EdgeInsets.all(75),
                          decoration: BoxDecoration(
                              color: const Color(0xFF881284).withOpacity(0.6),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xFF881284))),
                          child: const Icon(
                            Icons.play_circle_outlined,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                      Positioned(
                          right: 5.0,
                          bottom: 5.0,
                          child: Image.asset(
                            "assets/images/loading.png",
                            height: 30,
                            width: 30,
                          ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Fox News",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.20,
              color: Colors.white.withOpacity(0.1),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRhmZWIoAtQbuepiVAB2Ei5vrZQifk0k2bkVFBKv6iSKy1QsS77qJVATctVdEGu3yhJo0&usqp=CAU"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                               Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/a/af/HistoryHD_Logo_2015_4C_Black_type.png"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                               Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://e7.pngegg.com/pngimages/482/735/png-clipart-discovery-channel-television-channel-logo-television-show-others-television-globe.png"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),



                                                 Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://yt3.ggpht.com/ytc/AKedOLQupbAEoTwCMb2GRozuuNtRsGQlLOblrAFjpj9S=s900-c-k-c0x00ffffff-no-rj"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                                                 Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROHrsyukTHMkJ5PHA8Qu0_9HZ5tCU8YXTNVA&usqp=CAU"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                                                 Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Cartoon_Network_2010_logo.svg/1200px-Cartoon_Network_2010_logo.svg.png"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                                                 Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://cdn.iconscout.com/icon/free/png-256/cnn-2-283243.png"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),


                                                           Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://ewsat.com/img/GHANA.png"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                                                           Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://photos.live-tv-channels.org/tv-logo/gh-joy-prime-2852-300x225.jpg"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                                                                             Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzOeBAu4JHs_oSHK_iCeYGLZjcOwvWQoYS8VLeZZZWcuE5ScMhDYaDt1eGIP5C8BWnj4o&usqp=CAU"))),
                  
                  child: Image.network("https://cdn-icons-png.flaticon.com/512/891/891399.png", height: 25, width: 25,),
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
