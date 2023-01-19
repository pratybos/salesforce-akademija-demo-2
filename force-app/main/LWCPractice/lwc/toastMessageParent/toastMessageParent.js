/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';
import {ShowToastEvent} from "lightning/platformShowToastEvent";

export default class ToastMessageParent extends LightningElement {
    handleMessage(event) {
        const message = event.detail;
        const toastEvent = new ShowToastEvent({
            title: 'New message received',
            message: message,
            variant: 'info',
        });
        this.dispatchEvent(toastEvent);
    }
}