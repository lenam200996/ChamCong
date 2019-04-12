<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>

    <!-- Style CSS -->
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link rel="stylesheet" type="text/css" href="css/responsive.css" />

    <!-- jQuery -->    
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="libs/owl-carousel/owl.carousel.min.js"></script>
    <!-- orther script -->
    <script  type="text/javascript" src="js/main.js"></script>
</head>

<body>
<?php 
			require("Common/connect.php");
            $sql = "select * from LichHoc_All ";
            $rs = $mysqli->query($sql);
            
?>
    <div id="wrapper">
        <header id="header" class="site-header">
        </header>
<main id="main" class="site-main">
        <div class="container">
            <div class="row">
<form action="index.php" method="POST" class="filter-form">
               	<div class="row">
                <div class="filter-input selectf">
                    <label>Tên giảng viên</label>
                    <select name="idnhanvien" id="idnhanvien">
                        <option value="">Tất cả</option>
                        <?php 
                         $sqlgv = "select DISTINCT GiaoVien from LichHoc_All ";
                         $rsgv = $mysqli->query($sqlgv);
                        while($dt = $rsgv->fetch_assoc()) {?>
                            <option value="<?php echo $dt["GiaoVien"];?>"><?php echo $dt["GiaoVien"];?></option>
                      <?php  }?>
                    </select>
                </div>
                <div class="filter-input selectf">
                    <label>Tên khoa viện</label>
                    <select name="idcustomer" id="idcustomer">
                        <option value="">Tất cả</option>
                        <?php 
                         $sqlkv = "select DISTINCT KhoaVien	 from LichHoc_All ";
                         $rskv = $mysqli->query($sqlkv);
                        while($dtkv = $rskv->fetch_assoc()) {?>
                            <option value="<?php echo $dtkv["KhoaVien"];?>"><?php echo $dtkv["KhoaVien"];?></option>
                      <?php  }?>
                    </select>
                </div>
                 <div class="filter-input selectf">
                    <label>Phòng học</label>
                    <select name="idstatus" id="idstatus">
                         <option value="">Tất cả</option>
                         <?php 
                         $sqlph = "select DISTINCT PhongHoc	 from LichHoc_All ";
                         $rsph = $mysqli->query($sqlph);
                        while($dtph = $rsph->fetch_assoc()) {?>
                            <option value="<?php echo $dtph["PhongHoc"];?>"><?php echo $dtph["PhongHoc"];?></option>
                      <?php  }?> 
                    </select>
                </div>
                <!-- <div class="filter-input selectf">
                    <label>Học phần</label>
                    <select name="idstatus" id="idstatus">
                         <option value="">Tất cả</option>
                         <?php 
                        //  $sqlhp = "select DISTINCT MaHocPhan,LopHocPhan	 from LichHoc_All ";
                        //  $rshp = $mysqli->query($sqlhp);
                        // while($dthp = $rshp->fetch_assoc()) {?>
                        //     <option value="<?php //echo $dthp["MaHocPhan"];?>"><?php //echo $dthp["LopHocPhan"];?></option> -->
                      <?php // }?>
                   <!-- </select>
                </div> -->
                <div class="filter-input selectf">
                    <label>Thứ ngày</label>
                    <select name="idsta" id="idsta">
                         <option value="">Tất cả</option>
                        <?php for($i = 2; $i <9; $i++){?>
                            <option value="<?php echo $i;?>"><?php if($i==8){
                                echo "Chủ nhật";
                            }else{
                             echo "Thứ: ".$i;   
                            }?></option>
                        <?php } ?>
                    </select>
                </div>
                    <div class="button">
                        <button class="pri-button" type="submit" name="submit-search" id="submit-search"><i class="ti ti-filter"></i>Lọc</button>
                    </div>
                </div>
            </div>
</form><!-- .fillter-form -->

<form action="index.php" method="POST">
        <div class="button">
            <button class="pri-button" type="submit" name="submit-thongke" id="submit-search"><i class="ti ti-filter"></i>Thống Kê</button>
        </div>
</form>

<?php 
if(isset($_POST["submit-thongke"])){
    $sql_input = "select * from input_check";

    $rs_input = $mysqli->query($sql_input);
    $input_arr = array();
    $index_input = 0;
    while($data_input = $rs_input->fetch_assoc()){
        $input_arr[$index_input] = $data_input;
        $index_input++;
    }
    var_dump($input_arr);

}


?>



<?php if(!isset($_POST["submit-search"])){ ?>
<table class="table table-customize table-responsive">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Giang viên</th>
                            <th>Lớp HP</th>
                            <th>Khóa học</th>
                            <th>Lịch dạy</th>
                            <th>Phòng học</th>
                            <th>Ngày BD</th>
                            <th>Ngày KT</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                    <?php
                    $i = 1;
                    while($data = $rs->fetch_assoc()){?>
                        <tr>
                            <td data-title="STT"><?php echo $i;?></td>
                            <td data-title="Giang viên"><?php echo $data["GiaoVien"];?></td>
                            <td data-title="Lớp HP"><?php echo $data["LopHocPhan"];?></td>
                            <td data-title="Khóa học"><?php echo $data["KhoaHoc"];?></td>
                            <td data-title="Lịch dạy" ><?php echo "Thứ ".$data["ThuNgay"]." (".$data["TietBD"]."-".((int)$data["TietBD"]+(int)$data["SoTiet"]-1).")";?></td>
                            <td  data-title="Phòng học"><?php echo $data["PhongHoc"];?></td>
                            <td data-title="Ngày BD"><?php echo $data["NgayBD"];?></td>
                            <td data-title="Ngày KT"><?php echo $data["NgayKT"];?></td>
                        </tr>
                      
                    <?php $i++;}?>
                </tbody>
            </table>
<?php }else{

    $sqls = "select * from LichHoc_All where GiaoVien like'".($_POST["idnhanvien"]=='idnhanvien'?"":$_POST["idnhanvien"])."%' 
    and  KhoaVien like'".($_POST["idcustomer"]=='idcustomer'?"":$_POST["idcustomer"])."%'
    and  PhongHoc like'".($_POST["idstatus"]=='idstatus'?"":$_POST["idstatus"])."%'
    and  ThuNgay like'".($_POST["idsta"]=='idsta'?"":$_POST["idsta"])."%'
    ";
    $rss = $mysqli->query($sqls);?>
    <table class="table table-customize table-responsive">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Giang viên</th>
                            <th>Lớp HP</th>
                            <th>Khóa học</th>
                            <th>Lịch dạy</th>
                            <th>Phòng học</th>
                            <th>Ngày BD</th>
                            <th>Ngày KT</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                    <?php
                    $i = 1;
                    while($datas = $rss->fetch_assoc()){?>
                        <tr>
                            <td data-title="STT"><?php echo $i;?></td>
                            <td data-title="Giang viên"><?php echo $datas["GiaoVien"];?></td>
                            <td data-title="Lớp HP"><?php echo $datas["LopHocPhan"];?></td>
                            <td data-title="Khóa học"><?php echo $datas["KhoaHoc"];?></td>
                            <td data-title="Lịch dạy" ><?php echo "Thứ ".$datas["ThuNgay"]." (".$datas["TietBD"]."-".((int)$datas["TietBD"]+(int)$datas["SoTiet"]-1).")";?></td>
                            <td  data-title="Phòng học"><?php echo $datas["PhongHoc"];?></td>
                            <td data-title="Ngày BD"><?php echo $datas["NgayBD"];?></td>
                            <td data-title="Ngày KT"><?php echo $datas["NgayKT"];?></td>
                        </tr>
                      
                    <?php $i++;}?>
                </tbody>
            </table>

 <?php 
}?>
        </div>
        </div>
    </main>

</body>
</html>