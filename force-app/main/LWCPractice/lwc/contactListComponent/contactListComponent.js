/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement, track} from 'lwc';
import getContacts from '@salesforce/apex/LwcController.getContacts';

export default class ContactListComponent extends LightningElement {
    @track contacts;

    get hasContacts() {
        return this.contacts && this.contacts.length > 0;
    }

    async loadContacts() {
        try {
            this.contacts = await getContacts({firstName: 'test'});
        } catch (error) {
            console.log(error);
        }
    }
}