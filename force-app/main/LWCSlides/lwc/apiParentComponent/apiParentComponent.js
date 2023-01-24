/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class ApiParentComponent extends LightningElement {
    parentMessage = 'Initial message';

    changeValue() {
        this.parentMessage = 'New message';
    }
}