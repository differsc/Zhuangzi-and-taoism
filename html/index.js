const quotes =[ "Happiness is the absence of striving for happiness.", 
"There is a limit to our life, but to knowledge there is no limit.", 
"There is no thing that is not 'that', and there is no thing that is not 'this'."];
     // The source for the quotes.

const button = document.getElementById('button');
 button.addEventListener('click', generateQuote);
    
function generateQuote(){
    const randomnum = Math.floor(Math.random() * quotes.length);
    // The "generateQuote" function uses the Math.random() method to generate a random number between 0 and the length of the "quotes" array, which should be preferably in a file later. 
    // The Math.floor() method rounds down the generated number to the nearest integer.
    const randomQuote = quotes[randomnum];
    // This is a intermediate vatiable to store the quote.
    const quoteDisplay = document.querySelector("#quote");
    // The "quoteDisplay" variable uses the document.querySelector() method to select the HTML element with the id "quote-container".
    quoteDisplay.innerHTML = randomQuote;
    // The "quoteDisplay.innerHTML" property fills the quote into the element with the id "quote-container" that we made for it.
}

// xml processer
var xmlFile = "quote.xml";
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    var xmlDoc = this.responseXML;
    var quotes = xmlDoc.getElementsByTagName("quote");
};
xhttp.open("GET", xmlFile, true);
xhttp.send();










  
