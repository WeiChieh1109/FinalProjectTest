<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebCamara</title>
    <script type="text/javascript" src="instascan.min.js"></script>
    <!-- ���Jinstascan.min.js -->
</head>

<body>
    <video id="preview"></video>
    <!-- �߰ݬO�_���\�}�Ҭ۾���A�|��ܦb�o�Ӥ����� -->
    <!-- ---------- -->
    <!-- �H�U�{���� -->
    <script type="text/javascript" src="./instascan.min.js"></script>
    <script type="text/javascript">
    let scanner = new Instascan.Scanner({
        video: document.getElementById('preview')
    });
    // �}�Ҥ@�ӷs�����y
    // �ŧi�ܼ�scanner�A�bhtml<video>����id��preview���a��}�Ҭ۾��w���C
    // Notice:�o��`�N�@�w�n��<video>�����Ҥ~��ϥΡA�Ա��ЬݥL��github API�����������C

    scanner.addListener('scan', function(content) {
        console.log(content);
    });
    //�}�l��ť���y�ƥ�A�Y����ť��L�X���e�C

    Instascan.Camera.getCameras().then(function(cameras) {
    //���o�]�ƪ��۾��ƥ�
        if (cameras.length > 0) {
          ///�Y�]�Ƭ۾��ƥؤj��0 �h���}�Ҳ�0�Ӭ۾�(�{�����@�ɬO�q�Ĺs�Ӷ}�l��)
            scanner.start(cameras[0]);
        } else {
          //�Y�]�ƨS���۾��ƶq�h���"No cameras found";
          //�o�̦ۦ�P�_�n�g����
            console.error('No cameras found.');
        }
    }).catch(function(e) {
        console.error(e);
    });
    </script>
</body>
</html>