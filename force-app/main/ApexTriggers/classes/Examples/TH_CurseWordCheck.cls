/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_CurseWordCheck
{
	private static final Set<String> CURSE_WORDS = new Set<String>
	{
			'žaltys',
			'rupūžė',
			'javascriptas'
	};

	List<Case> casesToCheck = new List<Case>();

	public void addCases(List<Case> casesToAdd)
	{
		for (Case aCase : casesToAdd)
		{
			if (String.isNotBlank(aCase.Description))
			{
				casesToCheck.add(aCase);
			}
		}
	}

	public void updateCases()
	{
		for (Case aCase : casesToCheck)
		{
			String newDescription = changeCurseWords(aCase);
			aCase.Description = newDescription;
		}
	}

	private static String changeCurseWords(Case aCase)
	{
		String newDescription = aCase.Description;
		for (String curseWord : CURSE_WORDS)
		{
			if (newDescription.containsIgnoreCase(curseWord))
			{
				newDescription = newDescription.replace(curseWord, '***');
			}
		}

		return newDescription;
	}
}