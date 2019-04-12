<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Dữ liệu máy chấm công</title>
    <link rel="shortcut icon" href="/limesurvey/themes/admin/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/limesurvey/themes/admin/favicon.ico" type="image/x-icon">
		<!-- Style CSS -->
	    <link rel="stylesheet" type="text/css" href="style.css" />
	    <link rel="stylesheet" type="text/css" href="css/responsive.css" />

	    <!-- jQuery -->    
	    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
	    <!-- orther script -->
	    <script  type="text/javascript" src="js/main.js"></script>
	</head>

	<body>
		<div id="waper">
		<header class="site-header ">
			<div class="container">
				<div class="site-brand">
					<a href="#"><img src="images/assets/logo.png"></a>
				</div>
			</div>	<!-- .container -->
	</header>
	
</div>
		<?php 
			require("Common/connect.php");
			
		?>
		<main id="main" class="site-main">
			
			<div class="container">
				<div class="page-title">
					<h1>Thêm dữ liệu</h1>
                                        
				</div>
				<div class="row">
					<div class="form-import">
						<hr>
						<fieldset>
							<form action="import_input.php" method="post" enctype="multipart/form-data">
								
                                <h3 class="select-file">Tải tệp lên:<span class="overlay">Định dạng file bắt buộc xlsx , xls (excel)</span></h3>
                                <div class="filed-file">
									<input type="file" name="fileUpload" accept=".xlsx,.xls">
								</div>
								<div class="filed-submit">
									<input type="submit" name="up" value="UP">
								</div>
							</form>
						</fieldset>
                <footer id="footer" class="site-footer">
					<div class="container">
						<a href="http://vinhuni.edu.vn/">Bản quyền thuộc về Lê Văn Nam</a>
						<p>Phát triển bởi Nguyễn Văn Duy</p>
					</div>
      			</footer>
					</div>
				</div>
			</div>
		</main>
			<!-- end content -->
               
   
 </div>
 <?php
if (isset($_POST['up']) && isset($_FILES['fileUpload'])) {
    if ($_FILES['fileUpload']['error'] > 0  )
        echo "<script> alert('Upload thất bại! vui lòng chắc chắn rằng bạn đã chọn tệp hoặc chọn đúng định dạng!'); </script>";
    else {
		move_uploaded_file($_FILES['fileUpload']['tmp_name'], 'Files/' . $_FILES['fileUpload']['name']);
		
		//=================================================

		//  Include thư viện PHPExcel_IOFactory vào
		include 'Classes/PHPExcel/IOFactory.php';
		 
		$inputFileName = 'Files/' . $_FILES['fileUpload']['name'];
		 
		//Tiến hành xác thực file
$objFile = PHPExcel_IOFactory::identify($inputFileName);
$objData = PHPExcel_IOFactory::createReader($objFile);

//Chỉ đọc dữ liệu
$objData->setReadDataOnly(true);

// Load dữ liệu sang dạng đối tượng
$objPHPExcel = $objData->load($inputFileName);

//Lấy ra số trang sử dụng phương thức getSheetCount();
// Lấy Ra tên trang sử dụng getSheetNames();

//Chọn trang cần truy xuất
$sheet = $objPHPExcel->setActiveSheetIndex(0);

//Lấy ra số dòng cuối cùng
$Totalrow = $sheet->getHighestRow();
//Lấy ra tên cột cuối cùng
$LastColumn = $sheet->getHighestColumn();

//Chuyển đổi tên cột đó về vị trí thứ, VD: C là 3,D là 4
$TotalCol = PHPExcel_Cell::columnIndexFromString($LastColumn);

//Tạo mảng chứa dữ liệu
$data = [];

//Tiến hành lặp qua từng ô dữ liệu
//----Lặp dòng, Vì dòng đầu là tiêu đề cột nên chúng ta sẽ lặp giá trị từ dòng 2
for ($i = 1; $i <= $Totalrow; $i++) {
    //----Lặp cột
    for ($j = 0; $j < $TotalCol; $j++) {
		// Tiến hành lấy giá trị của từng ô đổ vào mảng
		// echo $sheet->getCellByColumnAndRow($i,$j)->getValue()."<br/>";
		$data[$i][$j] = $sheet->getCellByColumnAndRow($j, $i)->getValue();
		
    }
}
//Hiển thị mảng dữ liệu
echo '<pre>';
//var_dump($data);
for($i = 2; $i<count($data);$i++){
		$sql = "insert into input_check values(null,
		'".$data[$i][0]."',
		'".$data[$i][1]."',
		'".$data[$i][2]."',
		".$data[$i][3]." ,
		'".$data[$i][4]."',
			'".$data[$i][5]."',
			".$data[$i][6]."
				)";

		$mysqli->query($sql);
}
//var_dump($data);
unlink("Files/".$_FILES['fileUpload']['name']);
	}
	
	//database
}

?>

        
	</body>
</html>