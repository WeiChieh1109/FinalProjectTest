<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>

<!--
Copyright 2017 Google Inc.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<html lang="en">
<head>

<meta name="description" content="Simplest possible examples of HTML, CSS and JavaScript." />
<meta name="author" content="//samdutton.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta itemprop="name" content="simpl.info: simplest possible examples of HTML, CSS and JavaScript">
<meta itemprop="image" content="/images/icons/icon192.png">
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#fff">

<base target="_blank">

<title>getUserMedia (wpd example)</title>

<link rel="stylesheet" href="../css/main.css" />

<style>
@media (min-width: 1000px) {
  video {
    height: 540px;
  }
}
</style>
</head>

<body>

<div id="container">

  <h1><a href="../index.html" title="simpl.info home page">simpl.info</a> getUserMedia (wpd example)</h1>

  <video autoplay muted playsinline></video>

  <script>
var constraints = {video: true};

var successCallback = function(localMediaStream) {
  window.stream = localMediaStream; // just to enable access from the console
  window.mediaStreamTrackList = stream.getVideoTracks();
  mediaStreamTrackList.onaddtrack = function(e){console.log(e)};
  mediaStreamTrackList.onremovetrack = function(e){console.log(e)};
  window.mediaStreamTrack = mediaStreamTrackList[0];
  var kind = mediaStreamTrack.kind // "video"
  var label = mediaStreamTrack.label // e.g. "FaceTime HD Camera (Built-in)"
  var video = document.querySelector("video");
  video.srcObject = localMediaStream;
}

var errorCallback = function(error) {
  console.log("navigator.getUserMedia error: ", error);
}

navigator.mediaDevice.getUserMedia(constraints)
  .then(successCallback, errorCallback);

</script>

  <p>For more information, see <a href="https://www.html5rocks.com/en/tutorials/getusermedia/intro/" title="Media capture article by Eric Bidelman on HTML5 Rocks">Capturing Audio &amp; Video in HTML5</a> on HTML5 Rocks.</p>

  <a href="https://github.com/samdutton/simpl/blob/gh-pages/getusermedia/wpd.html" title="View source for this page on GitHub" id="viewSource">View source on GitHub</a>

</div>

<script src="../js/lib/ga.js"></script>

</body>
</html>