/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class DAL_AccountOpportunitiesCheck
{
	public List<Opportunity> getOpportunitesByAccountIds(Set<Id> accountIds)
	{
		return [SELECT Id, AccountId FROM Opportunity WHERE AccountId IN :accountIds];
	}
}