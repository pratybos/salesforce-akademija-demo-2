/**
 * Created by JurgitaG on 1/17/2023.
 */

trigger TRG_OpportunityV2 on Opportunity (after insert, after update, after delete)
{
	if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate))
	{

		TH_OpportunityStock oppHandler = new TH_OpportunityStock();
		oppHandler.checkOpportunitiesWithStock(Trigger.new, Trigger.oldMap);
		oppHandler.updateStock();
	}
	if (Trigger.isAfter && Trigger.isDelete)
	{
		TH_OpportunityStock oppHandler = new TH_OpportunityStock();
		oppHandler.handleOpportunityDelete(Trigger.old);
		oppHandler.updateStock();
	}
}