/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';
import getContacts from '@salesforce/apex/DAL_ApexInLwc.getContacts'

export default class ApexInLwc extends LightningElement {

    async loadContacts() {
        try {
            const contacts = await getContacts();
            console.log(JSON.stringify(contacts));
        } catch(error) {
            console.log(error);
        }
    }

}