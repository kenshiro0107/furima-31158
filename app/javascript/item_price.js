window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const taxEl = document.getElementById("add-tax-price");
  const profitEl = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = Math.floor(inputValue * 0.1);
    const addProfitDom = Math.floor(inputValue * 0.9);
    
    taxEl.textContent = addTaxDom;
    profitEl.textContent = addProfitDom;

  })
});


// priceInput.addEventListener("input", () => {
//   const inputValue = priceInput.value;
//   console.log(inputValue);
//   const addTaxDom = document.getElementById("add-tax-price = Math.floor(item-price / 10)");
//   addTaxDom.innerHTML = "profit = Math.floor(item-price - add-tax-price)"
// })
// });

