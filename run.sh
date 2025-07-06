#!/bin/bash

echo "📸 PrinceCamX चालू हो रहा है..."
php -S 127.0.0.1:8080 -t cam > /dev/null 2>&1 &
sleep 2
echo "🌐 Cloudflared tunnel बना रहे हैं..."
cloudflared tunnel --url http://127.0.0.1:8080
<!DOCTYPE html>
<html>
<head>
  <title>PrinceCamX - Camera Access</title>
</head>
<body>
  <h1 style="color:blue;">PrinceCamX Camera Test</h1>
  <video autoplay playsinline id="video" width="300" height="200"></video>

  <script>
    navigator.mediaDevices.getUserMedia({ video: true })
    .then(stream => {
      document.getElementById('video').srcObject = stream;
    })
    .catch(err => {
      alert("Camera access failed: " + err);
    });
  </script>
</body>


</html>
