/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_AccountContactsCheck
{
	private List<Account> accountsToCheck = new List<Account>();
	private Set<Id> accountIds = new Set<Id>();
	private DAL_AccountContactsCheck repository = new DAL_AccountContactsCheck();

	public void addAccounts(List<Account> contactList)
	{
		for (Account acc : contactList)
		{
			accountsToCheck.add(acc);
			accountIds.add(acc.Id);
		}
	}

	public void checkAccounts()
	{
		List<Contact> contacts = repository.getContactsByAccountIds(accountIds);
		Map<Id, Contact> accountIdByContactMap = getAccountIdByContactMap(contacts);

		for (Account acc : accountsToCheck)
		{
			Contact foundContact = accountIdByContactMap.get(acc.Id);
			if (foundContact != null)
			{
				acc.addError('Cannot delete Account, it has contacts.');
			}
		}
	}

	private static Map<Id, Contact> getAccountIdByContactMap(List<Contact> contacts)
	{
		Map<Id, Contact> accountIdByContactMap = new Map<Id, Contact>();
		for (Contact aContact : contacts)
		{
			accountIdByContactMap.put(aContact.AccountId,aContact);
		}

		return accountIdByContactMap;
	}
}