/**
 * Created by JurgitaG on 1/17/2023.
 */

({
    showToast : function(component, event, state, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": state,
            "message": message
        });
        toastEvent.fire();
    }
});