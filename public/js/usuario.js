function btnsign() {
// obetner elementos para usuarios
var correo = document.getElementById('correo').value;
var password = document.getElementById('password').value;
firebase.auth().createUserWithEmailAndPassword(correo, password)
.then(function(){
    verificar();
    alert('Te enviamos un correo electrónico, para verificar la cuenta!');
    btnout();
    window.location.reload()
})
.catch(function(error) {
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;

    alert('El correo electónico que intenta registrar ya se encuentra registrado!')
    // ...
});
};

function btnlogin() {
// obetner elementos para usuarios
var correo = document.getElementById('correo').value;
var password = document.getElementById('password').value;
firebase.auth().signInWithEmailAndPassword(correo, password).catch(function(error) {
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;

    alert('Correo electónico o contraseña incorrecta!')
    // ...
    });
};

function observador() {
    firebase.auth().onAuthStateChanged(function(user) {
    if (user) {
        aparece(user);
    // User is signed in.
    var displayName = user.displayName;
    var correo = user.correo;
    var correoVerified = user.correoVerified;
    var photoURL = user.photoURL;
    var isAnonymous = user.isAnonymous;
    var uid = user.uid;
    var providerData = user.providerData;
    // ...
    } else {
    // User is signed out.
    // ...
    window.location = 'index.html';
    }
});
};



function aparece(user) {
    var user = user;
    var contenido = document.getElementById('contenido');
    if (user.emailVerified) {
    contenido.innerHTML = '<div class="modal fade" id="myModal" role="dialog"><div class="modal-dialog"><div class="modal-content"><p><h3>¡Bienvenido a CROWDFINT!</h3><a class="btn btn--primary full-width" href="ATC.html">Quiero descontar un echeq</a><a class="btn btn--primary full-width" href="P2P.html">Quiero un préstamo</a><button onclick="btnout()" class="btn full-width">Salir</button></p></div></div></div>';
    }
}



function btnout() {
    firebase.auth().signOut()
    .then(function(){
    alert('Cerraste sesión');
    window.location.reload()
    })
};

function verificar() {
    var user = firebase.auth().currentUser;
    user.sendEmailVerification().then(function() {
    // Email sent.
    }).catch(function(error) {
    // An error happened.
    })
}

function reiniciar() {
    setTimeout(function(){window.location.reload();firebase.auth().signOut()}, 3000000);
}
reiniciar()