/**
 * Created by Armandas on 2023-01-19.
 */

import {api, LightningElement} from 'lwc';
import getContactById from '@salesforce/apex/DAL_Contact.getContactById';

export default class ContactById extends LightningElement {
    @api contactId;
    contact = {FirstName: '', LastName: ''};

    async connectedCallback() {
        this.contact = await getContactById({contactId: this.contactId});
    }
}