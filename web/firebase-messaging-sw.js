importScripts('https://www.gstatic.com/firebasejs/9.6.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.6.1/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyAQ1EGcY3GxNMalDS_3RUQyCzxpDPAT_0g",
  authDomain: "fruits-market-613e5.firebaseapp.com",
  projectId: "fruits-market-613e5",
  messagingSenderId: "260849137592",
  appId: "1:260849137592:web:206c6aa1290c801b01814d"
});

const messaging = firebase.messaging();

// استقبال الإشعارات في الخلفية
messaging.onBackgroundMessage(function(payload) {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});