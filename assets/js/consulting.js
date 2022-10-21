function updateList(region) {
    var vendor_list = document.getElementById('vendor_list');
    var all_lis = vendor_list.getElementsByTagName('li');
    var button_list = document.getElementById('regions');
    var all_buttons = button_list.getElementsByTagName('a');
    // All regions sets empty region
    if (region) {
        // First delete all the primary class from nav buttons
        for(var i = 0; i < all_buttons.length; i++) {
            all_buttons[i].classList.remove('primary');
        }
        // Set the primary class on the current region button
        document.getElementById(`${region}Region`).classList.add('primary');

        // First hide all of the items in the vendor list
        for(var i = 0; i < all_lis.length; i++) {
            all_lis[i].style.display = 'none';
        }

        // Show all the items in the list for the region
        var show_lis =
          document.getElementsByClassName(region);
        for (var i = 0; i < show_lis.length; i++) {
            show_lis[i].style.display = '';
        }
    }
    else {
        // First delete all the primary class from nav buttons
        for(var i = 0; i < all_buttons.length; i++) {
           all_buttons[i].classList.remove('primary');
        }
        // Set the primary class on the current region button (All Regions)
        document.getElementById('Region').classList.add('primary');

        // Show all the items in the vendor list
        for(var i = 0; i < all_lis.length; i++) {
            all_lis[i].style.display = '';
        }
    }
}
var regionNav = document.getElementById('regions');
var vendor_list = document.getElementById('vendor_list');
vendor_list.innerHTML = vendors;

// Display the number of all items in the vendor list
var sum = document.createElement("span");
sum.classList.add("badge");
sum.innerHTML = vendor_list.getElementsByTagName('li').length;
document.getElementById('Region').appendChild(sum);

for(var i = 0; i < regions.length; i++) {
    var region = regions[i];
    // The number of all items in the vendor list for the specific region
    var amount = document.getElementsByClassName(region).length;
    if (amount == 0) { continue; } // Don't display empty regions

    // Create a list item for the region
    var a = document.createElement("a");
    a.classList.add("button");
    a.id = `${region}Region`;
    a.setAttribute("href", "#");
    a.innerHTML = region;

    // Display the number of all items in the vendor list for the region
    var num = document.createElement("span");
    num.classList.add("badge");
    num.innerHTML = amount;
    a.appendChild(num);
    regionNav.appendChild(a);

    // Set up the event listener for the region, to change the list
    document.getElementById(`${region}Region`).addEventListener("click", function(event){
        event.preventDefault();
        event.stopPropagation();
        updateList(event.target.id.slice(0, -6));
    });
}
// Set up the event listener for all regions, to change the list
document.getElementById(`Region`).addEventListener("click", function(event){
    event.preventDefault();
    event.stopPropagation();
    updateList();
});
