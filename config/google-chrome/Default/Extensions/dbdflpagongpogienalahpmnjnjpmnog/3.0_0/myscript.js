$(document).ready(function() {
$.ajax({
  'url': 'http://apis.is/currency/m5',
  'type': 'GET',
  'dataType': 'json',
  'success': function(response) {

    myfunc(response.results);
  }
});
});
var data;
var islkr = new Array();

function myfunc(x)
{
	data = x;
	islkr[0] = data[0].value;
	islkr[1] = data[2].value;
	islkr[2] = data[6].value;
  islkr[3] = data[1].value;
  islkr[4] = data[5].value;
}

function currencyController($scope) {
		
	$scope.changeUSD = function() {
        $scope.EUR = (islkr[0]/islkr[1] *$scope.USD).toFixed(2);
       	$scope.GBP = (islkr[0]/islkr[2] *$scope.USD).toFixed(2);
        $scope.ISK = ($scope.USD*islkr[0]).toFixed(2);
        $scope.DKK = (islkr[0]/islkr[3] *$scope.USD).toFixed(2);
        $scope.NOK= (islkr[0]/islkr[4] *$scope.USD).toFixed(2);
    };
    $scope.changeEUR = function() {
        $scope.USD = (islkr[1]/islkr[0] *$scope.EUR).toFixed(2);
       	$scope.GBP = (islkr[1]/islkr[2] *$scope.EUR).toFixed(2);
        $scope.ISK = ($scope.EUR*islkr[1]).toFixed(2);
        $scope.DKK = (islkr[1]/islkr[3] *$scope.EUR).toFixed(2);
        $scope.NOK= (islkr[1]/islkr[4] *$scope.EUR).toFixed(2);
    };
    $scope.changeGBP = function() {
        $scope.USD = (islkr[2]/islkr[0] *$scope.GBP).toFixed(2);
       	$scope.EUR = (islkr[2]/islkr[1] *$scope.GBP).toFixed(2);
        $scope.ISK = ($scope.GBP*islkr[2]).toFixed(2);
        $scope.DKK = (islkr[2]/islkr[3] *$scope.GBP).toFixed(2);
        $scope.NOK= (islkr[2]/islkr[4] *$scope.GBP).toFixed(2);
        };
    $scope.changeISK = function() {

        $scope.USD = ($scope.ISK/islkr[0]).toFixed(2);
        $scope.EUR = ($scope.ISK/islkr[1]).toFixed(2);
        $scope.GBP = ($scope.ISK/islkr[2]).toFixed(2);
        $scope.DKK = ($scope.ISK/islkr[3]).toFixed(2);
        $scope.NOK = ($scope.ISK/islkr[4]).toFixed(2);

        
    };

     $scope.changeDKK = function() {
        $scope.USD = (islkr[3]/islkr[0] *$scope.DKK).toFixed(2);
        $scope.EUR = (islkr[3]/islkr[1] *$scope.DKK).toFixed(2);
        $scope.ISK = ($scope.DKK*islkr[3]).toFixed(2);
        $scope.GBP = (islkr[3]/islkr[2] *$scope.DKK).toFixed(2);
        $scope.NOK= (islkr[3]/islkr[4] *$scope.DKK).toFixed(2);
    };

     $scope.changeNOK = function() {
        $scope.USD = (islkr[4]/islkr[0] *$scope.NOK).toFixed(2);
        $scope.EUR = (islkr[4]/islkr[1] *$scope.NOK).toFixed(2);
        $scope.ISK = ($scope.NOK*islkr[4]).toFixed(2);
        $scope.GBP = (islkr[4]/islkr[2] *$scope.NOK).toFixed(2);
        $scope.DKK = (islkr[4]/islkr[3] *$scope.NOK).toFixed(2);
    };
}


