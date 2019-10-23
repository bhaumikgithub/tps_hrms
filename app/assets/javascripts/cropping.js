$(document).on("hidden.bs.modal","#image_cropping",function(){
  $("#upload").val('');
});

$(document).on('click','.rotate',function(){
  $("#prof_pic_img").cropper("rotate",-45);
});

function dataURItoBlob(dataURI) { 
  var byteString = atob(dataURI.split(',')[1]);
  var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
  var ab = new ArrayBuffer(byteString.length);
  var ia = new Uint8Array(ab);
  for (var i = 0; i < byteString.length; i++) {
      ia[i] = byteString.charCodeAt(i);
  }
  var blob = new Blob([ab], {type: mimeString});
  return blob;
}

$(document).on('click', '#student_pic_span', function(){
  var fileinput = document.getElementById("upload");
  fileinput.click();
});

$(document).on('change', '#upload', function(){ readFile(this); });

function readFile(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
       blob_url = URL.createObjectURL(dataURItoBlob(e.target.result));
        
      applyCroppie();

      $('#prof_pic_img').cropper('replace',blob_url);
      $('#image_cropping').modal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        onOpenEnd: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
          console.log("Ready");
          // console.log(modal, trigger);
        },
        onCloseEnd: function() { // Callback for Modal close
          $("#upload").val('');
          console.log('Closed');
        } 
      }
      );
      $('#image_cropping').modal('open');
    }      
    reader.readAsDataURL(input.files[0]);
  }
};

function applyCroppie(){
  var $img = $('#prof_pic_img');
  $img.cropper({
    aspectRatio : 1 / 1,
    viewMode: 1,
    minCanvasWidth: 0,
    minCanvasHeight: 0,
    minCropBoxWidth: 0,
    minCropBoxHeight: 0,
    minContainerWidth: 200,
    minContainerHeight: 200
  });
}
