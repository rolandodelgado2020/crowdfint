//Añadir tiempor real
function observador() {
    firebase.auth().onAuthStateChanged(function(user) {
    if (user) {
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
    }
  });
};
observador()

// Get a reference to the storage service, which is used to create references in your storage bucket
var storage = firebase.storage();

// Create a storage reference from our storage service
var storageRef = storage.ref();

// Create a child reference
var imagesRef = storageRef.child('images');
// imagesRef now points to 'images'

// Child references can also take paths delimited by '/'
var spaceRef = storageRef.child('images/space.jpg');
// spaceRef now points to "images/space.jpg"
// imagesRef still points to "images"




var auth = firebase.auth();
var storageRef = firebase.storage().ref();

function handleFileSelect(evt) {
  evt.stopPropagation();
  evt.preventDefault();
  var file = evt.target.files[0];

  var metadata = {
    'contentType': file.type
  };

  // Push to child path.
  // [START oncomplete]
  storageRef.child('images/' + file.name).put(file, metadata).then(function(snapshot) {
    console.log('Uploaded', snapshot.totalBytes, 'bytes.');
    console.log('File metadata:', snapshot.metadata);
    // Let's get a download URL for the file.
    snapshot.ref.getDownloadURL().then(function(url) {
      console.log('File available at', url);
      // [START_EXCLUDE]
      document.getElementById('linkbox').innerHTML = '<a href="' +  url + '">Click For File</a>';
      // [END_EXCLUDE]
    });
  }).catch(function(error) {
    // [START onfailure]
    console.error('Upload failed:', error);
    // [END onfailure]
  });
  // [END oncomplete]
}

window.onload = function() {
  document.getElementById('file').addEventListener('change', handleFileSelect, false);
  document.getElementById('file').disabled = true;

  auth.onAuthStateChanged(function(user) {
    if (user) {
      console.log('Anonymous user signed-in.', user);
      document.getElementById('file').disabled = false;
    } else {
      console.log('There was no anonymous session. Creating a new anonymous user.');
      // Sign the user in anonymously since accessing Storage requires the user to be authorized.
      auth.signInAnonymously().catch(function(error) {
        if (error.code === 'auth/operation-not-allowed') {
          window.alert('Anonymous Sign-in failed. Please make sure that you have enabled anonymous ' +
              'sign-in on your Firebase project.');
        }
      });
    }
  });
}
