var userController = angular.module('mainApp', []);


userController.controller('userController',function($scope){


// Inicialización del perfil de usuario, si el usuario no está logeado lo redirecciona a la página login

    firebase.auth().onAuthStateChanged(function(user) {

        if (user) {
            // User is signed in.

              $("#userNameInput").val(user.displayName);
              $("#userEmailInput").val(user.email);

              if(user.photoURL === null ){
                  $scope.userImgSrc = '/public/imgs/user.png';
              }else{
                  $scope.userImgSrc = user.photoURL;
              }
              $scope.$apply();

              userConect = database.ref('/user/'+user.uid);
              agregarUserDB(user.uid,user.displayName,user.email);

          } else {
            // No user is signed in.
            window.location = 'index.html';
          }
        });

// Añadir el registro a la base de datos del usuario Logeado

    agregarUserDB = function(uid, name, email){
        var fecha = new Date();
        console.log(fecha);

        var conectados = userConect.set({
            uid: uid,
            name: name,
            email: email,
            last_connection: fecha.toString()
        });
    };


// Función de logout

    $scope.logout = function(){

        firebase.auth().signOut();


        firebase.auth().onAuthStateChanged(function(user) {
          if (user) {

            console.log(user); // User is signed in.
          } else {
            window.location = 'login.html';
            console.log('Not signed in...') // No user is signed in.
          }
        });
    };

// Función de actualizar perfil del usuario

    $scope.updateUserProfile = function(){

        var user = firebase.auth().currentUser;

        var nameUser = angular.element('#userNameInput').val();
        var emailUser = angular.element('#userEmailInput').val();
        var passwordUser= angular.element('#userPasswordInput').val();
        var userId = user.uid;

        console.log(nameUser);

        var Mensajes ;

        user.updateProfile({
          displayName: nameUser,
        }).then(function() {
          // Update successful.

            uploadProfileImg(userId,nameUser,emailUser);
            user.updateEmail(emailUser).then(function() {
                  // Update successful.


                    if(passwordUser === '' || passwordUser === null || passwordUser === undefined){
                        modalMsgAccepted();
                        $scope.errorMsg = 'Email actualizado Correctamente!';
                        $scope.$apply();
                    }else{
                        user.updatePassword(passwordUser).then(function() {
                          // Update successful.
                            modalMsgAccepted();
                            $scope.errorMsg = 'password actualizado Correctamente!';
                            $scope.$apply();
                        }, function(error) {
                          // An error happened.
                            modalMsgError();
                            console.log(error);
                            if(error.code === 'auth/weak-password'){
                                $scope.errorMsg = 'Error en la actualización del contraseña, debe tener mínimo 6 carácteres!';
                                $scope.$apply();
                            }else{
                                $scope.errorMsg = 'Error en la actualización del contraseña, para actualizar debe hacer login recientemente!';
                                $scope.$apply();
                            }

                        });
                    }

                }, function(error) {
                  // An error happened.
                    modalMsgError();
                    console.log(error);
                    $scope.errorMsg = 'Error en la actualización del email, para actualizar debe hacer login recientemente!';
                    $scope.$apply();
                });


        }, function(error) {
          // An error happened.
                modalMsgError();
                console.log(error);
                $scope.errorMsg = 'Error en la actualización del usuario';
                $scope.$apply();
        });

    };

// Funcion para la actualización de la imagen de perfil
    uploadProfileImg = function(userId,nameUser,emailUser){

        var user = firebase.auth().currentUser;

        //var file = document.getElementById("my_file").files[0];
        var file = ($("#my_file"))[0].files[0];


        if(!file){
            console.log('No existe archivo para cambiar la imagen!');

        }else{

            var storageRef = firebase.storage().ref('/profileImgs/' + file.name); // Se crea referencia de la imagen en Firebase
            var uploadTask = storageRef.put(file);  // Almacena la imagen en Firebase

            uploadTask.on('state_changed',function(snapshot){

            }, function(error){

            }, function(){
               var downloadURL = uploadTask.snapshot.downloadURL;
                console.log(downloadURL);

                    user.updateProfile({
                        photoURL: downloadURL
                    });
                    window.location.reload(true);


            });
        }

    };


// Funciones para el cambio de color de los mensajes de error!

    modalMsgError = function(){
        w3.hide('#modalUser');
        w3.removeClass('#modalContentErrores','w3-pale-green w3-text-green');
        w3.addClass('#modalContentErrores','w3-pale-red w3-text-red');
        w3.show('#modalErrores');
    };

    modalMsgAccepted = function(){
            w3.hide('#modalUser');
            w3.removeClass('#modalContentErrores','w3-pale-red w3-text-red');
            w3.addClass('#modalContentErrores','w3-pale-green w3-text-green');
            w3.show('#modalErrores');
        };

});

