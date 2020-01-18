var contactController = angular.module('mainApp', []);


contactController.controller('contactController',function($scope){

// Inicialización del perfil de usuario, si el usuario no está logeado lo redirecciona a la página login

    firebase.auth().onAuthStateChanged(function(user) {

        if (user) {
            // User is signed in.
            //console.log(firebase);

          } else {
            // No user is signed in.
            window.location = 'login.html';
          }
        });

    $scope.crearContacto =  function(){

        var user = firebase.auth().currentUser;

        var contactName = $scope.contactNameInput;
        var contactEmail = $scope.contactEmailInput;
        var contactPhone = $scope.contactPhoneInput;

        var downloadURL;

         if(contactName === undefined && contactEmail === undefined && contactPhone === undefined){
            console.log('No se completaron los campos');
                  modalMsgError();
                  $scope.errorMsg = 'Se deben completar todos los campos!';
                  $scope.$apply();
          }else{

              // Agregar imagen a contacto
              var file = ($("#contact_file"))[0].files[0];

                if(!file){
                    console.log('No existe archivo para cambiar la imagen!');
                    contactSaveData(user,contactName,contactEmail,contactPhone,null);

                }else{

                    var storageRef = firebase.storage().ref('/contactImgs/' + file.name); // Se crea referencia de la imagen en Firebase
                    var uploadTask = storageRef.put(file);  // Almacena la imagen en Firebase

                    uploadTask.on('state_changed',function(snapshot){

                    }, function(error){

                    }, function(){
                       downloadURL = uploadTask.snapshot.downloadURL;
                        console.log(downloadURL);
                        contactSaveData(user,contactName,contactEmail,contactPhone,downloadURL);

                    });
                }


          }

    };

// Funcion almacenar datos del usuario

    contactSaveData = function(user,contactName, contactEmail, contactPhone, downloadURL){
        // Get a key for a new Post.
              var newPostKey = firebase.database().ref().child('posts').push().key;

               var contactData = {
                contactName: contactName,
                contactEmail: contactEmail,
                contactPhone: contactPhone,
                contactUid: newPostKey,
                contactPhoto: downloadURL
              };

              console.log(downloadURL);

              // Write the new post's data simultaneously in the posts list and the user's post list.
              var updates = {};
              //updates['/contacts/' + newPostKey] = contactData;
              updates['/user-contacts/' + user.uid + '/' + newPostKey] = contactData;

              firebase.database().ref().update(updates).then(function(){
                console.log('Usuario almacenado correctamente!');
                  modalMsgAccepted();
                  $scope.errorMsg = 'Contacto almacenado correctamente!';
                  $scope.$apply();

                  window.setTimeout(function(){
                        window.location.href = "/views/main.html";
                    }, 1500);

              }).catch(function(error){
                console.log('Se presentó error al almacenar la información!');
                  modalMsgError();
                  $scope.errorMsg = 'Error al almacenar los datos!';
                  $scope.$apply();
              });
    };

// Funciones para el cambio de color de los mensajes de error!

    modalMsgError = function(){
        w3.removeClass('#modalContentErrores','w3-pale-green w3-text-green');
        w3.addClass('#modalContentErrores','w3-pale-red w3-text-red');
        w3.show('#modalErrores');
    };

    modalMsgAccepted = function(){
            w3.removeClass('#modalContentErrores','w3-pale-red w3-text-red');
            w3.addClass('#modalContentErrores','w3-pale-green w3-text-green');
            w3.show('#modalErrores');
        };

});
