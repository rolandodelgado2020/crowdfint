userController.controller('mainController',function($scope){

   // Inicialización del perfil de usuario, si el usuario no está logeado lo redirecciona a la página login

    firebase.auth().onAuthStateChanged(function(user) {

        if (user) {
            // User is signed in.
            var user = firebase.auth().currentUser;
               var contactos;

               database.ref('/user-contacts/'+user.uid).once('value').then(function(snapshot){
                    contactos = snapshot.val();
                    //console.log(contactos);

                    var array = $.map(contactos, function(value, index) {
                        return [value];
                    });
                    //console.log(array);

                    $scope.contactos =  array;
                    $scope.$apply();

                }).catch(function(error){
                    console.log(error);
                });

          } else {
            // No user is signed in.
            window.location = 'login.html';
          }
        });

// Funciones para eliminar contactos

    $scope.modalEliminar = function(id,contacto){
        w3.show('#modalEliminar');
        $scope.nameContacto = contacto.contactName;
        $scope.id = contacto.contactUid;
        //console.log(id);
    };

    $scope.eliminar = function(id){
        var user = firebase.auth().currentUser;

        database.ref('/user-contacts/'+user.uid+'/'+id).remove().then(function(){
            console.log('eliminado  '+id);
            window.setTimeout(function(){
                window.location.href = "/views/main.html";
            }, 1500);

        }).catch(function(error){
            console.log('No se pudo eliminar el registro');
        });

    }

// Funciones para editar contactos

    $scope.modalEditarContacto = function(key,contact){
        var contactPhoto = contact.contactPhoto;

        w3.show('#modalEditarContacto');
        $scope.contactNameInput = contact.contactName;
        $scope.contactEmailInput = contact.contactEmail;
        $scope.contactPhoneInput = contact.contactPhone;
        $scope.key = contact.contactUid;
        $scope.contactPhoto = contact.contactPhoto;

        if(contactPhoto === undefined || contactPhoto === null){
            $scope.contactImgSrc = '/public/imgs/man.png';
        }else{
            $scope.contactImgSrc = contactPhoto;
        }


    };

    $scope.editarContacto = function(key, contactPhoto){

        var user = firebase.auth().currentUser;

        var contactName = $scope.contactNameInput;
        var contactEmail = $scope.contactEmailInput;
        var contactPhone = $scope.contactPhoneInput;
        var downloadURL;

        console.log(contactPhoto);



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
                    editarDatosContacto(user,key,contactName,contactEmail,contactPhone,contactPhoto);

                }else{

                    var storageRef = firebase.storage().ref('/contactImgs/' + file.name); // Se crea referencia de la imagen en Firebase
                    var uploadTask = storageRef.put(file);  // Almacena la imagen en Firebase

                    uploadTask.on('state_changed',function(snapshot){

                    }, function(error){

                    }, function(){
                        downloadURL = uploadTask.snapshot.downloadURL;
                        console.log(downloadURL);
                        editarDatosContacto(user,key,contactName,contactEmail,contactPhone,downloadURL);

                    });
                }

          }
    };

    editarDatosContacto = function(user,key,contactName,contactEmail,contactPhone,downloadURL){
        // Get a key for a new Post.
              var newPostKey = key;

              var contactData = {
                contactName: contactName,
                contactEmail: contactEmail,
                contactPhone: contactPhone,
                contactPhoto: downloadURL,
                contactUid: key
              };

              // Write the new post's data simultaneously in the posts list and the user's post list.
              var updates = {};
              //updates['/contacts/' + newPostKey] = contactData;
              updates['/user-contacts/' + user.uid + '/' + newPostKey] = contactData;

              firebase.database().ref().update(updates).then(function(){
                   window.setTimeout(function(){
                    window.location.href = "/views/main.html";
                    }, 500);

              }).catch(function(error){
                console.log('Se presentó error al almacenar la información!');

              });
    };


});
