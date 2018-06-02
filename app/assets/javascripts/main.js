$(document).ready(function() {

  var itemType = document.getElementById('order_status');
  console.log(itemType);

  // gets pending first element in selected array
  var pendingValue = itemType.options[itemType.selectedIndex].value;
  var pendingText = itemType.options[itemType.selectedIndex].text;
  console.log(pendingValue + " -> " + pendingText);

  var completedValue = itemType.options[itemType.selectedIndex + 1].value;
  var completedText = itemType.options[itemType.selectedIndex + 1].text;
  console.log(completedValue + " -> " + completedText);

  var orderStatus = document.getElementById("order_status")[0].value;
  var orderStatusText = document.getElementById("order_status")[0].text;
  console.log(orderStatus);
  console.log(orderStatusText);
  
  var orderRow = document.querySelectorAll(".order-row");

  // if order status is selected completed
  if (orderStatusText === "Completed") {
  }

  function myFunction() {
      var x = document.getElementById("#order-row");

      if (x.style.display === "none") {
          x.style.display = "block";
      } else {
          x.style.display = "none";
      }
  }

  // get the nodes
  // var employeeItemNames = $('.employee-item-name');
  // // var dashEmployeeItemName = $('.dash-employee-item-name');
  // // console.log(dashEmployeeItemName);
  // for (var i = 0; i < employeeItemNames.length; i++) {
  //   // $('.dash-employee-item-name').append("employeeItemNames[i]");
  //   console.log(employeeItemNames[i]);
  // }

  // var employeeItemPrices = $('.employee-item-price');
  // // var dashEmployeeItemPrice = $('.dash-employee-item-price');
  // // console.log(dashEmployeeItemPrice);
  // for (var j = 0; j < employeeItemPrices.length; j++) {
  //   // $('.dash-employee-item-price').append("employeeItemPrices[j]");
  //   console.log(employeeItemPrices[j]);
  // }

  // console.log(employeeItemNames);
});

