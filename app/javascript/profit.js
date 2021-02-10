if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
function profit (){
  priceInput = document.getElementById("item-price")
  priceInput.addEventListener('input',() => {
    const inputValue = priceInput.value
    const profit = document.getElementById("profit")
    profitPrice = inputValue * 0.9
    profit.innerHTML = `${Math.floor(profitPrice)}`
  })
}
window.addEventListener('load', profit)
}