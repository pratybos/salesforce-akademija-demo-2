/**
 * Created by Armandas on 2023-01-19.
 */

import {LightningElement} from 'lwc';

export default class ChildComponent extends LightningElement {

    handleClick() {
        const myEvent = new CustomEvent('myevent',
            {
                detail: {message: 'Hello from child component!'}
            });

        this.dispatchEvent(myEvent);
    }
}