/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_AccountOpportunitiesCheck
{
	List<Account> accountsToCheck = new List<Account>();
	Set<Id> accountIds = new Set<Id>();

	DAL_AccountOpportunitiesCheck repository = new DAL_AccountOpportunitiesCheck();

	public void addAccounts(List<Account> accountsList)
	{
		for (Account acc : accountsList)
		{
			accountsToCheck.add(acc);
			accountIds.add(acc.Id);
		}
	}

	public void checkAccounts()
	{
		List<Opportunity> opportunities = repository.getOpportunitesByAccountIds(accountIds);
		Map<Id, Opportunity> accountIdByOpportunityMap = getAccountIdByOpportunityMap(opportunities);

		for (Account acc : accountsToCheck)
		{
			Opportunity foundOpportunity = accountIdByOpportunityMap.get(acc.Id);
			if (foundOpportunity != null)
			{
				acc.addError('Cannot  delete Account, it has Opportunities');
			}
		}
	}

	private static Map<Id, Opportunity> getAccountIdByOpportunityMap(List<Opportunity> opportunities)
	{
		Map<Id, Opportunity> accountIdByOpportunityMap = new Map<Id, Opportunity>();
		for (Opportunity opp: opportunities)
		{
			accountIdByOpportunityMap.put(opp.AccountId, opp);
		}

		return accountIdByOpportunityMap;
	}
}