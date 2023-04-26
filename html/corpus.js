
function init () {
    const button = document.getElementById("button");
   button.addEventListener('click', open);
    }

function open () {
    var content = document.querySelector(".toolbar");
    if (content.style.display === "block") {
        content.style.display = "none";
    } else {
        content.style.display = "block";
    }
};
document.addEventListener('DOMContentLoaded', init);