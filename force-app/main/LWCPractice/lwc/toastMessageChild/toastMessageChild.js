/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class ToastMessageChild extends LightningElement {
    message;

    handleChange(event) {
        this.message = event.target.value;
    }

    handleClick() {
        const messageEvent = new CustomEvent('message', { detail: this.message });
        this.dispatchEvent(messageEvent);
    }
}