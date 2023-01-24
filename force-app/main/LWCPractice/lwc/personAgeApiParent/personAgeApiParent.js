/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement, track} from 'lwc';

export default class PersonAgeApiParent extends LightningElement {
    @track person = {
        name: 'John Doe',
        age: 25
    }

    handleClick() {
        this.person.age += 1;
    }
}