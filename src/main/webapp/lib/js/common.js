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

//date 형식을 YYYY-MM-DD 형식으로 바궈주는 함수
function formatDate(date) {
	const yyyy = date.getFullYear();
	const mm = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리 숫자로 표시
	const dd = String(date.getDate()).padStart(2, '0'); // 일자를 2자리 숫자로 표시
	return yyyy+'-'+mm+'-'+dd;
}