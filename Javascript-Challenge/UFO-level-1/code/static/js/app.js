// from data.js
var tableData = data;

var tbody = d3.select("tbody"); 

function populateTable(data) {
    tbody.html("")
    
    data.forEach(function(tableRow) {
        let row = tbody.append("tr")

        Object.values(tableRow)
        .forEach(function(value) {
            let data = row.append("td");
                data.text(value); 
        }); 
    }); 

}

function filterData() {
    d3.event.preventDefault()
    var date = d3.select("#datetime").property("value");
    let functionData = tableData; 

    if (date) {
        functionData = functionData.filter(tableRow => tableRow.datetime === date); 
    }; 
    populateTable(functionData);  
    console.log("User search for " + date) 
}

d3.selectAll("#filter-btn").on("click", filterData); 

populateTable(tableData); 
