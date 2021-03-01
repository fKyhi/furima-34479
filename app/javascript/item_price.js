window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  
  const addTaxDom = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")
  const Tax = 0.1;
  const Tax_fee = inputValue * Tax;
  const Profit = inputValue - Tax_fee;
  addTaxDom.innerHTML =  Tax_fee;
  profitPrice.innerHTML = Profit;

  })
})