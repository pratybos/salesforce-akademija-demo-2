/**
 * Created by Armandas on 2022-12-19.
 */

trigger TRG_Case on Case (before insert, before update)
{
	if (Trigger.isBefore)
	{
		if (Trigger.isInsert)
		{
			TH_ParentCaseFind parentCaseFind = new TH_ParentCaseFind();
			parentCaseFind.addCases(Trigger.new);
			parentCaseFind.changeCaseContacts();

			TH_CaseVipClients caseVipClients = new TH_CaseVipClients();
			caseVipClients.addCases(Trigger.new);
			caseVipClients.updateCases();

			TH_CurseWordCheck curseWordCheck = new TH_CurseWordCheck();
			curseWordCheck.addCases(Trigger.new);
			curseWordCheck.updateCases();
		}

		if (Trigger.isUpdate)
		{
			TH_CasePriorityChange casePriorityChange = new TH_CasePriorityChange();
			casePriorityChange.addCases(Trigger.oldMap, Trigger.new);
			casePriorityChange.updateCases();

			TH_CurseWordCheck curseWordCheck = new TH_CurseWordCheck();
			curseWordCheck.addCases(Trigger.new);
			curseWordCheck.updateCases();
		}
	}
}