'use strict';

const payAmountBtn = document.querySelector('#payAmount');
const decrementBtn = document.querySelectorAll('#decrement');
const quantityElem= document.querySelectorAll('#quantity');
const incrementBtn= document.querySelectorAll('#increment');
const priceElem= document.querySelectorAll('#price');
const totalElem= document.querySelectorAll('#total');

for ( let i = 0; i< incrementBtn.length; i++) 
{
    incrementBtn[i].addEventListener('click', function () {
        let increment = Number(this.previusElementSibling.textContent);
        increment++;
        this.previusElementSibling.textContent = increment;
        totalCalc();
    });

    decrementBtn[i].addEventListener('click', function () {

        let decrement = Number(this.nextElementSibling.textContent);
        decrement <= 1 ? 1 : decrement--;
        this.nextElementSibling.textContent = decrement;

        totalCalc();
    });
    
}

const totalCalc = function () {
    let total = 0;

    for ( let i = 0; i < quantityElen.length; i++){

        total += Number(quantityElen[i].textContent) * Number(priceElem[i].textContent);
        totalElem.textContent = total.toFixed(2);
        payAmountBtn.textContent = total.toFixed(2);
    }
}