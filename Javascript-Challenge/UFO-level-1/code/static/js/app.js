// from data.js
var tableData = data;

var tbody = d3.select("tbody")

tableData.forEach(([time]) => {
    var row = tbody.append("tr"); 

    row.append("td").text(time); 
    // row.append("td").text("city"); 
    // row.append("td").text("state"); 
    // row.append("td").text("country"); 
    // row.append("td").text("shape"); 
    // row.append("td").text("duration"); 
    // row.append("td").text("comments"); 

});
