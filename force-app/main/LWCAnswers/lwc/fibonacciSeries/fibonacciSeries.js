/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class FibonacciSeries extends LightningElement {
    number = 0;
    fibonacciSeries = [];

    handleNumber(event) {
        this.number = event.target.value;
    }

    generateFibonacci() {
        this.fibonacciSeries = [0, 1];
        for (let i = 2; i < this.number; i++) {
            this.fibonacciSeries.push(this.fibonacciSeries[i - 1] + this.fibonacciSeries[i - 2]);
        }
    }
}