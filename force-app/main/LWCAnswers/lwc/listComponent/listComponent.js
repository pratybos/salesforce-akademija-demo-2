/**
 * Created by Armandas on 2023-01-18.
 */

import {LightningElement, track} from 'lwc';

export default class ListComponent extends LightningElement {
    @track items = [];
    input = '';

    handleInput(event) {
        this.input = event.target.value;
    }

    addItem() {
        this.items.push(this.input);
    }
}