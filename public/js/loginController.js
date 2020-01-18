var loginController = angular.module('loginApp', []);


loginController.controller('loginController',function($scope){

// Login email y contraseña

    $scope.loginEmail = function(){
        var email = $scope.emailInput;
        var password  = $scope.passwordInput;

        if(!firebase.auth().currentUser){

            var promise = firebase.auth().signInWithEmailAndPassword(email,password);

            promise.then(function(res){
                window.location = 'main.html';

            }).catch(function(error){

                var errorCode  = error.code;

                if(errorCode == "auth/user-not-found"){
                    $scope.errorMsg = 'Email o usuario no existe!, registrarse para ingresar.';
                }

                if(errorCode == "auth/wrong-password"){
                    $scope.errorMsg = 'Contraseña incorrecta!';
                }

                w3.show('#modalErrores');
                $scope.$apply();

                console.log(error)

            });
        }
    };

// Login Google account

    $scope.loginGoogle = function(){

        if(!firebase.auth().currentUser){

            var provider = new firebase.auth.GoogleAuthProvider();

            provider.addScope('https://www.googleapis.com/auth/plus.login');

            firebase.auth().signInWithPopup(provider).then(function(result) {
              // This gives you a Google Access Token. You can use it to access the Google API.
              var token = result.credential.accessToken;
              // The signed-in user info.
              var user = result.user;
              // ...
              window.location = 'main.html';

            }).catch(function(error) {
              // Handle Errors here.
              var errorCode = error.code;
              var errorMessage = error.message;
              // The email of the user's account used.
              var email = error.email;
              // The firebase.auth.AuthCredential type that was used.
              var credential = error.credential;
              // ...
                console.log( error);
            });




        }

    };


// Si el usuario ya está logeado lo redirecciona a la pagina main

    firebase.auth().onAuthStateChanged(function(user) {
          if (user) {
            // User is signed in.

             window.location = 'main.html';

          } else {
            // No user is signed in.

          }
        });


});
