/**
 * Created by JurgitaG on 1/17/2023.
 */

public class TH_OpportunityStock
{
	public static final String STAGE_CLOSED_WON = 'Closed Won';
	public static final String STAGE_CLOSED_LOST = 'Closed Lost';
	public static final String STOCK_STATUS_INSTALLED = 'Installed';
	public static final String STOCK_STATUS_INSTOCK = 'In Stock';
	public static final String STOCK_STATUS_RESERVED = 'Reserved';

	List<Stock__c> stockToUpdate = new List<Stock__c>();
	Set<Id> accountIds = new Set<Id>();

	public void checkOpportunitiesWithStock(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldOppMap)
	{
		for (Opportunity newOpp : newOpportunities)
		{
			if (!oldOppMap.containsKey(newOpp.Id))
			{
				if (newOpp.Stock__c != null)
				{
					addStockForUpdate(newOpp, STOCK_STATUS_RESERVED);
					accountIds.add(newOpp.AccountId);
				}
				continue;
			}
			Opportunity oldOpp = oldOppMap.get(newOpp.Id);

			if (newOpp.StageName == STAGE_CLOSED_WON && newOpp.StageName != oldOpp.StageName)
			{
				handleOpportunityWon(newOpp);
				accountIds.add(newOpp.AccountId);
				continue;
			}
			if (newOpp.StageName == STAGE_CLOSED_LOST && newOpp.StageName != oldOpp.StageName)
			{
				addStockForUpdate(newOpp, STOCK_STATUS_INSTOCK);
				accountIds.add(newOpp.AccountId);
				continue;
			}
			if (newOpp.Stock__c != oldOpp.Stock__c)
			{
				if (newOpp.Stock__c != null)
				{
					addStockForUpdate(newOpp, STOCK_STATUS_RESERVED);
				}
				else {
					addStockForUpdate(oldOpp, STOCK_STATUS_INSTOCK);
				}
				accountIds.add(newOpp.AccountId);
			}

		}
	}

	public void handleOpportunityDelete(List<Opportunity> opportunities)
	{
		for (Opportunity newOpp : opportunities)
		{
			if (newOpp.Stock__c != null)
			{
				addStockForUpdate(newOpp, STOCK_STATUS_INSTOCK);
			}
			accountIds.add(newOpp.AccountId);
		}
	}
	private void addStockForUpdate(Opportunity opp, String status)
	{
		stockToUpdate.add(new Stock__c(
				Id = opp.Stock__c,
				Status__c = status
		));
	}
	private void handleOpportunityWon(Opportunity opp)
	{
		if (opp.Stock__c == null || opp.AccountId == null)
		{
			return;
		}
		stockToUpdate.add(new Stock__c(
				Id = opp.Stock__c,
				Status__c = STOCK_STATUS_INSTALLED,
				Installed_Date__c = Date.today(),
				Account__c = opp.AccountId
		));
	}
	public void updateStock(){
		update stockToUpdate;
		BLL_AccountStockUpdate.updateAccounts(accountIds);
	}
}