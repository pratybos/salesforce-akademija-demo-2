/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';
import {ShowToastEvent} from "lightning/platformShowToastEvent";

export default class HelloNotificationParent extends LightningElement {
    handleSubmit(event) {
        const fullName = event.detail;
        const message = `Hello, ${fullName}!`;
        const toastEvent = new ShowToastEvent({
            title: 'Welcome',
            message: message,
            variant: 'success',
        });
        this.dispatchEvent(toastEvent);
    }
}