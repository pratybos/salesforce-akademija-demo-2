/**
 * Created by Armandas on 2023-01-19.
 */

import {api, LightningElement} from 'lwc';

export default class ApiChildComponent extends LightningElement {
    @api childMessage;
}