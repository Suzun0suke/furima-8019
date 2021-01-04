function commission (){
  priceInput = document.getElementById("item-price")
  priceInput.addEventListener('input',() => {
    const inputValue = priceInput.value
    const tax = document.getElementById("add-tax-price")
    addPrice = inputValue * 0.1
    tax.innerHTML = `${Math.floor(addPrice)}`
  })
}
window.addEventListener('load', commission)
