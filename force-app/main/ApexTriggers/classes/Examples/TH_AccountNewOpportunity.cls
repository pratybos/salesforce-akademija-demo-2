/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_AccountNewOpportunity
{
	public static final String DEFAULT_OPPORTUNITY_STAGENAME = 'Prospecting';
	List<Account> accounts = new List<Account>();

	public void addAccounts(List<Account> accountsToAdd)
	{
		for (Account acc : accountsToAdd)
		{
			accounts.add(acc);
		}
	}

	public void createOpportunities()
	{
		List<Opportunity> opportunitiesToInsert = new List<Opportunity>();

		for (Account acc : accounts)
		{
			Opportunity newOpp = new Opportunity();
			newOpp.Name = acc.Name + ' Initial Opportunity';
			newOpp.StageName = DEFAULT_OPPORTUNITY_STAGENAME;
			newOpp.CloseDate = Date.today().addDays(1);
			newOpp.AccountId = acc.Id;

			opportunitiesToInsert.add(newOpp);
		}


		insert opportunitiesToInsert;
	}
}