function changeMessages(message, discountRate) {
    document.getElementById('message').textContent = message;
    document.getElementById("discount").textContent = discountRate;
}


let titleText = "Get a grip!",  // Unlike Python, variable names are written as camelCase.
    discount = 40,
    discountRate = "0.123abc"
    productName = "Hiking Boots",
    productRemovalYear = 2025;

discountRate = Number.parseFloat(discountRate)  // Variable updated.
var discountAvailable = !true  // 'var' is not used anymore. It has bugs.
let productId;  // undefined
productId = 612
productId = null  // value is wiped.
productId = undefined // undefined

const yearSold = 2022, // You have to set a constant to a value because 
      priceFrom_2021 = 39.99;  // declaration cannot be empty as 'let' above.
// initialPrice = 49.99  // Constant cannot be changed/updated anymore!

let discountText = `Up to ${discount}% off!`;  // Interpolation: Observe the backticks!
discountText = `Hey!


${discount}% off on ${productName.toUpperCase()}!`;

console.log(discountText, "with length:", discountText.length); 
/*
    html converts those new lines above to a whitespace but console log prints them.
*/

console.log(
    "'priceFrom_2021' variable type:", typeof priceFrom_2021,  // output: number
    "\nRemoval year:", ++productRemovalYear,  // productRemovalYear++ works as well but beware while using it.
    // ++yearSold  // Increment doesn't work for constants!
)

console.log(
    "The product was sold in " + yearSold.toString() + " before",
    `with the rate of ${discountRate}.`  // Note that "abc" is ignored while parsing above.
)

changeMessages(
    message = titleText,
    discount = discountText,
    );

let userProperties = {
    firstName: "Mert",
    lastName: "Gül",
    age: 33.02,
    isMale: true
}

console.log(
    `User name: ${userProperties.firstName}\n`,
    typeof userProperties  // output: object (SIMILAR to "dictionaries" in Python, "hashes" in Ruby)
);
// MDN (Mozilla Developer Network) is a good source for JS.