/**
 * Created by Armandas on 2022-12-15.
 */

public without sharing class AccountCreator implements INT_SObjectInterface
{
	public SObject getNewSObject()
	{
		return new Account(Name = 'test1');
	}
}