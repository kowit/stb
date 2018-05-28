$(document).ready(function() {
  // get the nodes
  var employeeItemNames = $('.employee-item-name');
  // var dashEmployeeItemName = $('.dash-employee-item-name');
  // console.log(dashEmployeeItemName);
  for (var i = 0; i < employeeItemNames.length; i++) {
    // $('.dash-employee-item-name').append("employeeItemNames[i]");
    console.log(employeeItemNames[i]);
  }

  var employeeItemPrices = $('.employee-item-price');
  // var dashEmployeeItemPrice = $('.dash-employee-item-price');
  // console.log(dashEmployeeItemPrice);
  for (var j = 0; j < employeeItemPrices.length; j++) {
    // $('.dash-employee-item-price').append("employeeItemPrices[j]");
    console.log(employeeItemPrices[j]);
  }

  // console.log(employeeItemNames);
});

