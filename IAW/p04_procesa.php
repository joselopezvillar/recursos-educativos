<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Comprobar se o ficheiro é imaxe ou fake comparado co tipo MIME
if(isset($_POST["submit"])) {
  $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
  if($check !== false) {
    echo "Ficheiro é unha imaxe (comprobado co tipo mime)" . $check["mime"] . ". <br>";
    $uploadOk = 1;
  } else {
    echo "Estas facendo trampas! Iso non é unha imaxe! <br>";
    $uploadOk = 0;
  }
}

// Comprobar ficheiro existe
if (file_exists($target_file)) {
  echo "Xa existe ese ficheiro! <br>";
  $uploadOk = 0;
}

// Comprobar tamaño
if ($_FILES["fileToUpload"]["size"] > 500000) {
  echo "Ficheiro demasiado grande! Sube unha imaxe máis pequena. <br>";
  $uploadOk = 0;
}

// Permitir algúns formatos
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
  echo "So permito subir extensións JPG, JPEG, PNG e GIF!. <br>";
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "<br> Non foi posible subir a imaxe";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    echo "Ficheiro ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " subido! <br>";
  } else {
    echo "<br> Houbo un erro subindo a imaxe. <br>";
  }
}
?>
