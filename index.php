<?php
$conn = mysqli_connect("localhost", "root", "", "student-registration-system");
if ($conn->connect_error) {

    echo "Connection failed";
}
exit();

?>