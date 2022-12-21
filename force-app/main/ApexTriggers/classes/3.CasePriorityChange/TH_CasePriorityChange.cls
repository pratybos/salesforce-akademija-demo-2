/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_CasePriorityChange
{
	public static final String CASE_STATUS_WORKING = 'Working';
	public static final String CASE_STATUS_ESCALATED = 'Escalated';
	public static final String CASE_PRIORITY_HIGH = 'High';

	List<Case> casesToUpdate = new List<Case>();

	public void addCases(Map<Id, Case> oldCaseMap, List<Case> newCases)
	{
		for (Case newCase : newCases)
		{
			Case oldCase = oldCaseMap.get(newCase.Id);
			if (oldCase.Status == CASE_STATUS_WORKING && newCase.Status == CASE_STATUS_ESCALATED)
			{
				casesToUpdate.add(newCase);
			}
		}
	}

	public void updateCases()
	{
		for (Case aCase : casesToUpdate)
		{
			aCase.Priority = CASE_PRIORITY_HIGH;
		}
	}
}