/**
 * Created by JurgitaG on 12/22/2022.
 */

public class BATCH_AccountDeactivation implements Database.Batchable<Sobject>
{
	Integer countAccount =0;

	public Database.QueryLocator start(Database.BatchableContext param1)
	{
		return Database.getQueryLocator([
				SELECT Id, Active__c
				FROM Account
//				WHERE Active_Until__c <= TODAY
//				AND Active__c = 'Yes'
		]);
	}

	public void execute(Database.BatchableContext param1, List<Account> accountList)
	{
		for (Account anAccount : accountList)
		{
//			anAccount.Active__c ='No';
		}
		countAccount += accountList.size();
		update accountList;
	}

	public void finish(Database.BatchableContext param1)
	{
		System.debug('Deaktyvuota accountų: ' + countAccount);
	}
}