<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, maximum-scale=1.0">
    <style>
        body {width: 100%;}
        canvas {display: none;}
    </style>
    <script>
        var video, canvas, msg;
        var load = function () {
            video  = document.getElementById('video');
            canvas = document.getElementById('canvas');
            msg    = document.getElementById('error');
            if( navigator.getUserMedia ) {
                video.onclick = function () {
                    var context = canvas.getContext("2d");
                    context.drawImage(video, 0, 0, 240, 320);
                    var image = {"demo" : {
                        "type"  : "device",
                        "image" : canvas.toDataURL("image/png")
                    }};
                };

                var success = function ( stream ) {
                    video.src = stream;
                };

                var error = function ( err ) {
                    msg.innerHTML = "Error: " + err.code;
                };

                navigator.getUserMedia('video', success, error);

            } else {
                msg.innerHTML = "Native web camera not supported :(";
            
        };

        window.addEventListener('DOMContentLoaded', load, false);
    </script>
</head>
<body>
	<!-- 開啟拍照功能 -->
	<input type="file" accept="image/*" capture> 
	
	<input type="file" accept="video/*"capture="user">
	<input type="file" accept="video/*;capture=camcorder">
	<!-- 開啟後鏡頭拍照功能 並變成照片上傳 -->
	<input type="file" accept="image/*" capture="environment">
    <video  id="video" width="240" height="320" autoplay> </video>
    <p      id="error">Click on the video to send a snapshot to the receiving screen</p>
    <canvas id="canvas" width="240" height="320"> </canvas>
</body>
</html>