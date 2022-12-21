/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_ParentCaseFind
{
	List<Case> casesWithoutParent = new List<Case>();
	Set<Id> caseContactIds = new Set<Id>();
	DAL_ParentCaseFind repository = new DAL_ParentCaseFind();

	public void addCases(List<Case> casesToAdd)
	{
		for (Case aCase : casesToAdd)
		{
			if (aCase.ContactId != null)
			{
				caseContactIds.add(aCase.ContactId);
			}

			if (aCase.ParentId == null)
			{
				casesWithoutParent.add(aCase);
			}
		}
	}

	public void changeCaseContacts()
	{
		List<Case> parentCases = repository.getCasesByContactIds(caseContactIds);
		Map<Id, Id> contactIdsByCaseIds = getContactIdsByCaseIdsMap(parentCases);

		for (Case aCase : casesWithoutParent)
		{
			Id parentCaseId = contactIdsByCaseIds.get(aCase.ContactId);
			aCase.ParentId = parentCaseId;
		}
	}

	private static Map<Id, Id> getContactIdsByCaseIdsMap(List<Case> parentCases)
	{
		Map<Id, Id> contactIdsByCaseIds = new Map<Id, Id>();

		for (Case aCase : parentCases)
		{
			contactIdsByCaseIds.put(aCase.ContactId, aCase.Id);
		}

		return contactIdsByCaseIds;
	}
}