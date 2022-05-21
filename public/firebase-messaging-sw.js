// Give the service worker access to Firebase Messaging.
// Note that you can only use Firebase Messaging here. Other Firebase libraries
// are not available in the service worker.
importScripts("https://www.gstatic.com/firebasejs/8.2.5/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.2.5/firebase-messaging.js");

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
firebase.initializeApp({
    apiKey: "AIzaSyAi03PUUjCVEiOqYWBKeCfnC2dtC77oELA",
    authDomain: "kreatora-mobile.firebaseapp.com",
    projectId: "kreatora-mobile",
    storageBucket: "kreatora-mobile.appspot.com",
    messagingSenderId: "671989481166",
    appId: "1:671989481166:web:f16d956b7fbd452b62da9f"
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
    console.log(
        "[firebase-messaging-sw.js] Received background message ",
        payload
    );
    // Customize notification here
    const notificationTitle = payload.data.title;
    const notificationOptions = {
        body: payload.data.body,
        icon: "/assets_app/images/logo/icon-logo-kreatora-small.png",
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});
