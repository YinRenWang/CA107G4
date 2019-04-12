<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/registered.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.twzipcode.min.js"></script>


<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
<!------------------------------------------------------首頁頭------------------------------------------------------>	
<div class="header">
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%=request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="index.html">教育共享平台</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active"> <a class="nav-link" href="#">成為老師 <span class="sr-only">(current)</span></a> </li>
        <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="#">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
        </li>
        <li class="nav-item"> <a class="nav-link" href="#">登入</a> </li>
        <li class="nav-item"> <a class="nav-link" href="#">註冊</a> </li>
        <li class="nav-item"> <a class="nav-link disabled" href="#">關於我們</a> </li>
      </ul>
    </div>
  </nav>
</div>	
<!----------------------------------------------------------------------------------------------------------------->


<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    
		<h1></h1>
   
  </div>
</div>

	
  <div class="title TitleImg">
    <h1 class="hader-title" style="text-align:center;color:white;">建立您的  WeShare&nbsp;帳戶</h1>
  </div>


 <FORM action="uploadServlet3_simple.do" class="form-horizontal" method="post" name="MEMBER" id="MEMBER" enctype="multipart/form-data" >
	
<div class="container">
	<div class="row">
	<div class="col-md-2">
	</div>
    <div class="col-md-8">
        <hr>

		 <div class="form-group">
          <label class="control-label col-sm-3">會員帳號 <span class="text-danger">*</span></label>
          <div class="col-md-10 col-sm-3">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
               <input type="text" class="form-control" name="MEMID" id="MEMID" placeholder="請以半形輸入，4-20個英、數字組合。帳號設定不能同密碼。" value="">
           </div>   
          </div>
        </div>		
        <div class="form-group">
          <label class="control-label col-sm-3">電子郵件<span class="text-danger">*</span></label>
          <div class="col-md-11 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="email" class="form-control" name="MEMEMAIL" id="MEMEMAIL" placeholder="請以半形輸入，e-mail不能重複註冊。" value="">
            </div>
            </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">密碼 <span class="text-danger">*</span></label>
          <div class="col-md-11 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="MEMPSW" id="MEMPSW" placeholder="8-12字元，至少2個英文與2個數字，不能包含空格、冒號或引號。" value="">
           </div>   
          </div>
        </div>
		<div class="form-group">
          <label class="control-label col-sm-3">密碼提示<span class="text-danger">*</span></label>
          <div class="col-md-11 col-sm-8">
            <input type="text" class="form-control" name="MEMPSWHINT" id="MEMPSWHINT" placeholder="請輸入您的密碼提示不得更密碼一樣" value="">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">姓名<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="MEMNAME" id="MEMNAME" placeholder="請輸入您的大名" value="">
          </div>
        </div>
			 <div class="form-group">
               <label class="control-label col-sm-3">身分證字號<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div >
                
                <input type="text" name="MEMIDCARD" id="MEMIDCARD"  placeholder="請輸入您的身分證字號" class="form-control label-warning"  />                
              </div>
          </div>
        </div>	
				
		   <div class="form-group">
          <label class="control-label col-sm-3">會員生日<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="date" class="form-control" name="MEMBIRTH" id="MEMBIRTH" value="">
          </div>
        </div>		

        <div class="form-group">
          <label class="control-label col-sm-3">性別 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label>
            <input name="MEMSEX" type="radio" value="0" checked>
            男生 </label>
               
            <label>
            <input name="MEMSEX" type="radio" value="1" >
            女生 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">手機號碼<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" class="form-control" name="MEMPHONE" id="MEMPHONE" placeholder="請輸入您的手機號碼" value="">
            </div>
          </div>
        </div>
  
						 <div class="form-group">
							 <label class="control-label col-sm-3">地址<br></label>
								   <div class="form-inline">
						<div id="zipcode2" class="col-md-6 col-sm-8 col-xl-12" >
							<script>
							$("#zipcode2").twzipcode({
							zipcodeIntoDistrict: true, // 郵遞區號自動顯示在地區
							css: ["form-control", "form-control"], // 自訂 "城市"、"地區" class 名稱 
							countyName: "city", // 自訂城市 select 標籤的 name 值
							districtName: "town" // 自訂地區 select 標籤的 name 值

							});
  							</script>
							
						<input type="text" class="form-control" name="address" id="address" placeholder="請輸入地址" value="" size="35">
						<input type="hidden" id="MEMADD" name="MEMADD" value="">
						</div>
					
					
						
						</div>
						</div>
			
				
			
        <div class="form-group">
          <label class="control-label col-sm-3">會員頭貼<br></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group"> <span class="input-group-addon" id="file_upload"><i class="glyphicon glyphicon-upload"></i></span>
              <p><input type="file" name="MEMIMAGE" id="file" class="form-control upload" placeholder="" aria-describedby="file_upload"/></p>
				<p><img id="demo" /></p>
            </div>
          </div>
        </div>
				
<script type="text/javascript">

$('#file').change(function() {
  var file = $('#file')[0].files[0];
  var reader = new FileReader;
  reader.onload = function(e) {
    $('#demo').attr('src', e.target.result);
  };
  reader.readAsDataURL(file);
});
</script>
				
				
        <div class="form-group">
          <div class="col-xs-offset-3 col-md-8 col-sm-9 col-xl-12"><span class="text-muted"><span class="label label-danger">注意</span> 點選註冊及表示您已經閱讀完網站 <a href="#">條款</a> 並且同意我們所有 <a href="#">規章</a>,包含讓我們使用您的 <a href="#">Cookie</a>.</span> </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">

<script type="text/javascript">

  function Magic(){
    document.getElementById("MEMID").value="weshare05";
    document.getElementById("MEMEMAIL").value="weshare@gmail.com";
    document.getElementById("MEMPSW").value="123456";
    document.getElementById("MEMPSWHINT").value="654321";
    document.getElementById("MEMNAME").value="大衛海鮮";
    document.getElementById("MEMIDCARD").value="A181313047";
    document.getElementById("MEMBIRTH").value="2018-5-23";
    document.getElementById("MEMPHONE").value="0857957957";
    document.getElementById("MEMADD").value="桃園市中壢區中大路300號";

  }

</script>   

 <input id="magic" name="magic" type="button" onclick="Magic()" class="btn btn-link">
			  
				  
<script type="text/javascript">
let city;
let town;
let address;

$("select[name='city']").change(function(){
 city = $('option:selected', this).val(); 
});


$("select[name='town']").change(function(){
 town = $('option:selected', this).val(); 
});

function Send(){
document.getElementById("MEMADD").value=city+town+document.getElementById("address").value;
console.log(document.getElementById("MEMADD").value);
}
</script>

            <input id="signUp" name="submit" type="button" value="註冊" onmousedown="Send()" class="btn btn-primary">
          </div>
			
        </div>
    
    </div>
</div>
</div>
	   </form>
</div>	
	
	
	

<!------------------------------------------------------首頁尾------------------------------------------------------>	
<footer class="section footer-classic context-dark bg-image" style="background: #74b49b;">
  <div class="container">
    <div class="row row-30">
      <div class="col-md-4 col-xl-5">
        <div class="pr-xl-4"><a href="index.html"></a>
          <p class="reademe">我們是最佳的共享教育的平台，致力於在分享技能，保障交易，展現自我，使用戶得到最棒的學習體驗。</p>
          <!-- Rights-->
          <p class="rights"><span>©  </span><span class="copyright-year">2018</span><span> </span><span>WeShare教育共享平台</span><span>. </span><span>© All Rights Reserved.
            .</span></p>
        </div>
      </div>
      <div class="col-md-4" >
        <h5 class="reademe">聯絡我們</h5>
        <dl class="contact-list">
          <dt>地址:</dt>
          <dd>桃園市中壢區中大路300號</dd>
        </dl>
        <dl class="contact-list">
          <dt>信箱:</dt>
          <dd><a href="mailto:#">weshare@gmail.com</a></dd>
        </dl>
        <dl class="contact-list">
          <dt>電話:</dt>
          <dd><a href="tel:#">03-425-7387</a> </dd>
        </dl>
      </div>
      <div class="col-md-4 col-xl-3" >
        <h5 class="reademe2">關於</h5>
        <ul class="nav-list">
          <li><a href="#">關於我們</a></li>
          <li><a href="#">團隊成員</a></li>
          <li><a href="#">加入WeShare</a></li>
          <li><a href="#">隱私權政策</a></li>
          <li><a href="#">功能更新</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="row no-gutters social-container">
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-facebook"></span><span>Facebook</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-instagram"></span><span>instagram</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-twitter"></span><span>twitter</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-youtube-play"></span><span>google</span></a></div>
  </div>
</footer>
<!----------------------------------------------------------------------------------------------------------------->	
<!-- Optional JavaScript --> 
<!-- jQuery first, then Popper.js, then Bootstrap JS --> 


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
