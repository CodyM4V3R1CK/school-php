<?php 
	session_start();
?>

<?php 
	if(empty($_SESSION["jazyk"])){
		$_SESSION["jazyk"]="sk";
	}

	if(!empty($_GET["jazyk"])){
		$_SESSION["jazyk"]=$_GET["jazyk"];
	}
	
	var_dump($_SESSION["jazyk"]);

	echo "<br>";
	echo "<br>";
?>
	
	<a href="http://localhost/rozvrh/tabulka.php?jazyk=sk">SK</a>
	<a href="http://localhost/rozvrh/tabulka.php?jazyk=en">EN</a>

<?php
$servername = "localhost";
$username = "root";
$password = "root1234";

// Create connection
$conn = mysqli_connect($servername, $username, $password, "rozvrh");

// Check connection
if (!$conn){
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";

//$sql = "SELECT den, hodina, predmet FROM rozvrh WHERE trieda='4b' AND skupina=2";
if(!empty($_GET['trieda'])){
	$where=" WHERE trieda='".$_GET["trieda"]."' AND skupina='".$_GET["skupina"]."'";
}else{
	$where="";
}	
$sql = "SELECT * FROM rozvrh $where";

$result = mysqli_query($conn, $sql);

if(mysqli_num_rows($result) > 0){
  // output data of each row
  while($row = mysqli_fetch_assoc($result)){
    $rozvrh[$row["den"]][$row["hodina"]]=preloz($row["predmet"],$conn);
  }
}else{
  echo "0 results";
}

//mysqli_close($conn);

echo "<br>";
echo "<br>";
?>

<!DOCTYPE html>
<html>
<head>
    <title> Stránka 1 </title>
    <link rel="stylesheet" href="style.css">
</head>
</html>

<?php
$sql1="SELECT trieda,skupina FROM rozvrh GROUP BY trieda,skupina";
$result1= mysqli_query($conn,$sql1);
	
	while($row1 = mysqli_fetch_assoc($result1)){
		echo "<a href=tabulka.php?trieda=".$row1["trieda"]."&amp;skupina=".$row1["skupina"].">".$row1["trieda"]." - ".$row1["skupina"].".sk</a></br>";
	}

echo "<br>";
echo "<br>";
?>

<?php
	echo preloz("nadpis",$conn);
?>

<?php
	
	$dni = array("Pondelok", "Utorok", "Streda", "Štvrtok", "Piatok");
	$hodiny = array("0", "1", "2", "3", "4", "5", "6", "7");
	$i = 0;
	//$rozvrh[2][2]= "PFG";
	//$rozvrh[2][3]= "PFG";
?>
	<table border=1 class="table">
		<tr>
			<td>&nbsp;</td>
			<?foreach ($hodiny As $hodina):?>
			<td><?echo $hodina;?></td>
			<?endforeach;?>
		</tr>
		
		<?foreach ($dni As $i=> $den):?>
			<tr>
				<td><?echo $den;?></td>
				<?foreach ($hodiny As $j=> $hodina):?>
				<td><?echo @$rozvrh[$i][$j];?></td>
				<?$i++;?>
				<?endforeach;?>
			</tr>
		<?endforeach;?>
	</table>

<?php
    function preloz($retazec,$conn){
        $sql="SELECT preklad FROM preklad WHERE retazec='".$retazec."' AND jazyk='".$_SESSION["jazyk"]."'";
        $result=mysqli_query($conn,$sql);
        $row=mysqli_fetch_array($result);

        return !empty($row["preklad"])?$row["preklad"]:$retazec;
    }