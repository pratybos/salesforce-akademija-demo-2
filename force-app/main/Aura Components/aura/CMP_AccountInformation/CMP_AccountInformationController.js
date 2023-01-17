/**
 * Created by JurgitaG on 1/17/2023.
 */

({
    handleCreateContact:function (component, event, helper){
        let action = component.get('c.insertContact');
        let newContact = component.get('v.newContact');
        newContact.AccountId = component.get('v.recordId');
        action.setParams({
            "aContact" : newContact
        });
        action.setCallback(this, function (response){
            let state = response.getState();
            if (state ==="SUCCESS"){
                helper.showToast(component, event, state, "Created Successfully!");
                let insertedContact =response.getReturnValue();
                console.log(insertedContact);
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": insertedContact.Id,
                    "slideDevName": "related"
                });
                navEvt.fire();
            }else if (state ==="ERROR"){
                helper.showToast(component, event, state, "Contact cannot be saved!");
            } else {
                helper.showToast(component, event, state, "Unknown Error");
            }
        });
        $A.enqueueAction(action);
    }
});