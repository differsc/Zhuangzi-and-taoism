const quotes =[
"Where lusts and desires are deep, the springs of the Heavenly are shallow.", "Fishes live and men die in the water. They are different in constitution,and therefore differ in their likes and dislikes.Hence it was that the ancient sages did not require (from all) the same ability, nor demand the same performances. They gave names according to the reality of what was done, and gave their approbation where it was specially suitable. This was what was called the method ofuniversal adaptation and of sure success. ", 
"(ZHUANGZI TO HUIZI) You, Sir, have a large tree and are troubled because it is of no use - why do you not plant it in a tract where there is nothing else, or in a wide and barren wild ? There you might saunter idly by its side, or in the enjoyment of untroubled ease sleep beneath it.Neither bill nor axe would shorten its existence; there would be nothing to injure it.What is there in its uselessness o cause you distress ? '"]

const button = document.getElementById('button');
button.addEventListener('click', generateQuote);

function generateQuote() {
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