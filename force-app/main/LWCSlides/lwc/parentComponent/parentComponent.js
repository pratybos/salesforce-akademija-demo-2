/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class ParentComponent extends LightningElement {
    handleMyEvent(event) {
        console.log(event.detail.message);
    }
}