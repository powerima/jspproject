function functionK(){
	if(productForm.pcode.value == ""){
		alert("상품코드를 입력해주세요");
		return false;
	}
	
	if(productForm.pcode.value.length != 4){
		alert("상품코드는 4글자로 입력해주세요.");		
		return false;
	}
	
	if(f1.custno.value == ""){
		alert("회원번호가 입력되지 않았습니다");
		return false;
	}
	
	if(f1.custname.value == ""){
		alert("회원성명이 입력되지 않았습니다.");
		return false;
	}
	
	if(f1.phone.value == ""){
		alert("회원전화가 입력되지 않았습니다.");
		return false;	
	}
		
	if(f1.joindate.value == ""){
		alert("가입일자가 입력되지 않았습니다.");
		return false;
	}
	
	if(f1.grade.value == ""){
		alert("고객등급이 입력되지 않았습니다.");
		return false;
	}
	
	if(f1.city.value == ""){
		alert("도시코드가 입력되지 않았습니다.");
		return false;
	}

}