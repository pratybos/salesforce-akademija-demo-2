/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement, track} from 'lwc';

export default class HelloWorldTrack extends LightningElement {
    @track person = {name: ''}


    handleName(event) {
        this.person.name = event.target.value;
    }
}