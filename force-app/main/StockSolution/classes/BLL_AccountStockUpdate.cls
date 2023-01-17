/**
 * Created by JurgitaG on 1/17/2023.
 */

public with sharing class BLL_AccountStockUpdate
{
	@Future
	public static void updateAccounts(Set<Id> accountIds) {
		List<AggregateResult> reservedStock = [
				SELECT SUM(Stock__r.Price__c) reservedPrice, COUNT(Stock__c) reservedCount, AccountId FROM Opportunity
				WHERE Stock__r.Status__c =:TH_OpportunityStock.STOCK_STATUS_RESERVED AND AccountId IN:accountIds GROUP BY AccountId
		];
		List<AggregateResult> installedStock = [
				SELECT MAX(Installed_Date__c) lastInstalled, COUNT(Id) countOfInstalled, Account__c FROM Stock__c
				WHERE Account__c IN:accountIds GROUP BY Account__c
		];
		Map<Id, Account> accountToUpdate = new Map<Id, Account>();
		for (AggregateResult result : reservedStock){
			String accountId = String.valueOf(result.get('AccountId'));
			if (accountToUpdate.containsKey(accountId))
			{
				Account updateAccount = accountToUpdate.get(accountId);
				updateAccount.Reserved_Price__c = (Decimal) result.get('reservedPrice');
				updateAccount.Stock_Reserved__c = (Decimal) result.get('reservedCount');
			}
			else {
				accountToUpdate.put(accountId, new Account(
						Id =accountId,
						Reserved_Price__c = (Decimal) result.get('reservedPrice'),
						Stock_Reserved__c = (Decimal) result.get('reservedCount')
				));
			}
		}
		for (AggregateResult result : installedStock){
			String accountId = String.valueOf(result.get('AccountId'));
			if (accountToUpdate.containsKey(accountId))
			{
				Account updateAccount = accountToUpdate.get(accountId);
				updateAccount.Last_Stock_Installed_Date__c = (Date) result.get('lastInstalled');
				updateAccount.Total_Owned_Stock__c = (Decimal) result.get('countOfInstalled');
			}
			else {
				accountToUpdate.put(accountId, new Account(
						Id =accountId,
						Last_Stock_Installed_Date__c = (Date) result.get('lastInstalled'),
						Total_Owned_Stock__c = (Decimal) result.get('countOfInstalled')
				));
			}
		}
		update accountToUpdate.values();
	}
}