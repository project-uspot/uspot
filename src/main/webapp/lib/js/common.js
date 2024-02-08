//금액에 , 를 붙혀서 return 해주는 함수
function formatNumberWithCommas(amount) {
    // Check if the input is a valid number
    if (isNaN(amount)) {
        return "Invalid input";
    }

    // Convert the number to a string
    let amountStr = amount.toString();

    // Split the string into integer and decimal parts
    let parts = amountStr.split('.');

    // Add commas to the integer part
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // Join the integer and decimal parts back together
    let formattedAmount = parts.join('.');

    return formattedAmount;
}

//금액에 붙은 , 를 지워주는 함수
function removeCommasFromNumber(formattedNumber) {
    // Remove commas from the string
    let numberWithoutCommas = formattedNumber.replace(/,/g, '');

    // Convert the string to a number
    let numericValue = parseFloat(numberWithoutCommas);

    // Check if the conversion was successful
    if (isNaN(numericValue)) {
        return "Invalid input";
    }

    return numericValue;
}

//문자열 날짜를 날짜 형식으로 변환
function formatDate(dateStr,dateFrm) {
    // 입력된 문자열에서 각 부분을 추출
    var year = dateStr.substring(0, 4);
    var month = dateStr.substring(4, 6);
    var day = dateStr.substring(6, 8);

	switch(dateFrm){
		case "yMdHms":
		    var hour = dateStr.substring(8, 10);
		    var minute = dateStr.substring(10, 12);
		    var second = dateStr.substring(12, 14);

			// 추출된 부분을 'yyyy-MM-dd HH:mm:ss' 형식으로 조합
		    return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
		case "yMdHm":
		    var hour = dateStr.substring(8, 10);
		    var minute = dateStr.substring(10, 12);
		    
			// 추출된 부분을 'yyyy-MM-dd HH:mm:ss' 형식으로 조합
		    return year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
		case "yMd":
			// 추출된 부분을 'yyyy-MM-dd HH:mm:ss' 형식으로 조합
		    return year + '-' + month + '-' + day;
		default:
			return '';
	}
}

//현재날짜를 YYYY-MM-DD 형식으로 반환해주는 함수
function getCurrentDate(){
	var currentDate = new Date();
	// Format the date as yyyy-mm-dd
	var formattedDate = currentDate.getFullYear() + '-' + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' + ('0' + currentDate.getDate()).slice(-2);

	return formattedDate;
}

function onlyNumber(input) {
    // Remove non-numeric characters
    let value = input.value.replace(/[^0-9]/g, '');

    // Add commas to every three digits
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // Update the input value
    input.value = value;
}