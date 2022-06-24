<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-client_id" content="282529135459-s4uf8hajjhjfmmrqs179usca70o3csgf.apps.googleusercontent.com">
    <title>Google Login Asuuu</title>
</head>
<body>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
    function onSignIn(googleUser) {
        var id_token = googleUser.getAuthResponse().id_token;
        var profile = googleUser.getBasicProfile();
        console.log("id token: ", id_token);
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    }
    function handleCredentialResponse(response) {
        console.log("Encoded JWT ID token: ", response ,response.credential);
    }
    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "282529135459-s4uf8hajjhjfmmrqs179usca70o3csgf.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large" }  // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
    }
</script>
<div id="buttonDiv"></div>
<div class="g-signin2" data-onsuccess="onSignIn"></div>
</body>
</html>
