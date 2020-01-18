var registerController = angular.module('registerApp', []);


registerController.controller('registerController',function($scope){

    $scope.registerEmailPassword = function(){
        var email = $scope.emailRegisterInput;
        var password = $scope.passwordRegisterInput;

        if(!firebase.auth().currentUser){
            var auth = firebase.auth();
            var promise = auth.createUserWithEmailAndPassword(email,password);

            promise.then(function(res){

            window.location = 'main.html';

            }).catch(function(error){

                var errorCode = error.code;
                  var errorMessage = error.message;
                  if (errorCode === 'auth/wrong-password') {

                      w3.show('#modalErrores');
                      console.log('Password Incorrecto');
                      $scope.errorMsg = 'Password Incorrecto';
                      $scope.$apply();

                  } else {

                      w3.show('#modalErrores');
                      $scope.errorMsg = 'Error! Contraseña debe tener mínimo 6 carácteres';
                      $scope.$apply();

                  }

            });
        }

    };
});
