<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Google Login Asuuu</title>
</head>
<body>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script>
    function handleCredentialResponse(response) {
        console.log("Encoded JWT ID token: " + response.credential);
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
</body>
</html>
