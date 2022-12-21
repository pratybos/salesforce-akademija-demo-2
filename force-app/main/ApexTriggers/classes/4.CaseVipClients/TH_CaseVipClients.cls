/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_CaseVipClients
{
	public static final String VIP_ACCOUNT_NAME = 'Vip Clients';
	public static final String VIP_CASE_SUBJECT = 'VIP';

	List<Case> casesToAssign = new List<Case>();
	DAL_CaseVipClients repository = new DAL_CaseVipClients();

	public void addCases(List<Case> casesToAdd)
	{
		for (Case aCase : casesToAdd)
		{
			if (aCase.Subject.contains('VIP') && aCase.AccountId == null)
			{
				casesToAssign.add(aCase);
			}
		}
	}

	public void updateCases()
	{
		Account vipAccount = repository.findAccountByName(VIP_ACCOUNT_NAME);
		if (vipAccount == null)
		{
			return;
		}

		for (Case aCase : casesToAssign)
		{
			aCase.AccountId = vipAccount.Id;
		}
	}
}