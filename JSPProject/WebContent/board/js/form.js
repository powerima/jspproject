/**
 * 
 */

function functionK() {	
	if (f1.sno.value == "") {
		alert("학번을 입력해 주세요");
		return false;
	}

	if (f1.sno.value.length != 5) {
		alert("학번은 5자를 입력해 주세요");
		f1.sno.value = "";
		f1.sno.focus();
		return false;
	}
}