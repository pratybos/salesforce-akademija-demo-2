/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class HelloNotificationChild extends LightningElement {
    firstName;
    lastName;

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

    handleSubmit() {
        const fullName = `${this.firstName} ${this.lastName}`;
        const submitEvent = new CustomEvent('submit', { detail: fullName });
        this.dispatchEvent(submitEvent);
    }
}