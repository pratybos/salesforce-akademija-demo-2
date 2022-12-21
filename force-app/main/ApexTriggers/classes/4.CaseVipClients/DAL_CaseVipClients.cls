/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class DAL_CaseVipClients
{
	public Account findAccountByName(String accName)
	{
		List<Account> accounts = [SELECT Id FROM Account WHERE Name = :accName];
		if (accounts.size() > 0)
		{
			return accounts.get(0);
		}
		else
		{
			return null;
		}
	}

}