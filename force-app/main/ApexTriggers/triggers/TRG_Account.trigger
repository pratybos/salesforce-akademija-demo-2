/**
 * Created by Armandas on 2022-12-19.
 */

trigger TRG_Account on Account (before insert, after insert, before delete)
{
	if (Trigger.isBefore)
	{
		if (Trigger.isDelete)
		{
			TH_AccountContactsCheck accountContactsCheck = new TH_AccountContactsCheck();
			accountContactsCheck.addAccounts(Trigger.old);
			accountContactsCheck.checkAccounts();

			TH_AccountOpportunitiesCheck accountOpportunitiesCheck = new TH_AccountOpportunitiesCheck();
			accountOpportunitiesCheck.addAccounts(Trigger.old);
			accountOpportunitiesCheck.checkAccounts();
		}
	}

	if (Trigger.isAfter)
	{
		if (Trigger.isInsert)
		{
			TH_AccountNewOpportunity accountNewOpportunity = new TH_AccountNewOpportunity();
			accountNewOpportunity.addAccounts(Trigger.new);
			accountNewOpportunity.createOpportunities();
		}
	}
}