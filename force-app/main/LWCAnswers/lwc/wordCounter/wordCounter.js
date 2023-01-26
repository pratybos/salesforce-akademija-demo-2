/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class WordCounter extends LightningElement {
    text = '';
    count = 0;

    handleText(event) {
        this.text = event.target.value;
    }

    countWords() {
        this.count = this.text.split(' ').length;
    }
}