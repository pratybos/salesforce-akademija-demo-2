/**
 * Created by JurgitaG on 1/12/2023.
 */

public with sharing class DAL_Opportunity
{
	public Opportunity getOpportunityById(String oppId)
	{
		return
		[
				SELECT Id, Name, CloseDate, StageName, Account.Name
				FROM Opportunity
				WHERE Id = :oppId
				LIMIT 1
		];
	}
	public List<OpportunityLineItem> getOpportunityProducts(String oppId){
		return
		[
				SELECT
						Id, Name, Quantity, UnitPrice, TotalPrice
				FROM OpportunityLineItem
				WHERE OpportunityId = :oppId AND Quantity > 1
		];
	}

}