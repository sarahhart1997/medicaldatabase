<?php
include "../functions.php";


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql_find_names = "SELECT patient_name, patient_id FROM patient_personal_data ORDER BY patient_name";

$all_patients = mysqli_query($conn,$sql_find_names);

$sql_find_physicians = "SELECT employee_name, physician_id FROM physicians WHERE position <> 'chief_of_staff' ORDER BY employee_name";

$all_physicians = mysqli_query($conn,$sql_find_physicians);

?>

<!DOCTYPE html>
<html>
<head>
    <style>
html{background-color: ivory;}

input[type=submit] {
  background-color: teal;
  border: none;
  color: white;
  padding: 14px 25px;
  text-decoration: none;
  margin: 6px 3px;
  cursor: pointer;
}
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Newark Medical Association</title>
</head>
<body>
<h2 align="center" style="color:teal"><b>Patient Management Home</b></h2>

<div class="container" align="center">
    <h1 style="color:blue">Newark Medical Association</h1>
    <input type="submit" value="Home" onclick="location.href = '../index.html'">
</div>

<div>
    <form action="ScheduleDocApp" class="form-inline" method="post">

        <div align="center">
        <br></br>
        &nbsp;<input type="radio" name="radio" value = "1" id="Create_Patient" onclick="location.href = '../Patient_Management/CreatePatient.html'">
        &nbsp;Create Patient&nbsp;
        &nbsp;<input type="radio" name="radio" value = "2" id="Lookup_Patient" onclick="location.href = '../Patient_Management/LookupPatient.html'">
        &nbsp;Lookup Patient&nbsp;
        &nbsp;<input type="radio" name="radio" value = "3" id="ScheduleDocApp" onclick="location.href = 'ScheduleDocApp.php'" checked>
        &nbsp;Schedule Doctor's Appointment&nbsp;
        <input type="radio" name="radio" value = "4" id="ViewApp" onclick="location.href = '../Patient_Management/ViewApp.html'">&nbsp;
        &nbsp;View Appointments&nbsp;
        <br></br>
        <br></br>

<!--Eventually add auth to not reveal medical to unqualified individuals. -->
        <!-- If lookup page can edit, delete and view medical info that would be ideal. -->
        <div align="center" style="border:10px solid slateblue; background-color:white">
            <br></br>
            <label style="color:purple; font-size:21px;"><b>Schedule Doctor's Appointment for Patient</b></label>
            <br></br>
            Patient Name:&nbsp;<input type="text" name="Name">&nbsp;
            Patient ID:&nbsp;<input type="text" name="ID">&nbsp;
            <select name="gender-select">
                <option value = "gender-select" selected> Select Gender</option>
                <option value = "Male">Male</option>
                <option value = "Female">Female</option>
                <option value = "Non-Binary">Non-Binary</option>
            </select>
            Phone:&nbsp;<input type="text" name="Phone">&nbsp;

            <br></br>
            <input type="submit" value="Search">
        </div>
    </form>

</div>

</body>
</html>