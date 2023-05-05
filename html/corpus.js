"use strict";
function init () {
  const button = document.getElementById("button");
  button.addEventListener('click', open);
}
function open () {
  // Three states: 1) explicit "block", 2) explicit "none", or
  //   3) nothing specified, which is implicit "block"
  // Test for "none" so that block plus nothing are treated
  //   the same way as the "else" condition
  var content = document.querySelector(".toolbar");
  if (content.style.display === "none") {
    content.style.display = "block";
  } else {
    content.style.display = "none";
  }
}
document.addEventListener('DOMContentLoaded', init);