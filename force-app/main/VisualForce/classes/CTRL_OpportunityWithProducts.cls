/**
 * Created by JurgitaG on 1/12/2023.
 */

public with sharing class CTRL_OpportunityWithProducts
{
	private final Opportunity opportunity;
	private final List<OpportunityLineItem> opportunityProducts;
	private DAL_Opportunity dalService = new DAL_Opportunity();

	public CTRL_OpportunityWithProducts(){
		String opportunityId =ApexPages.currentPage().getParameters().get('id');
		this.opportunity = dalService.getOpportunityById(opportunityId);
		this.opportunityProducts = dalService.getOpportunityProducts(opportunityId);
	}


	public Opportunity getOpportunity(){
		return this.opportunity;
	}

	public List<OpportunityLineItem> getOpportunityProducts(){
		return this.opportunityProducts;
	}

	public String getGreeting(){
		return 'Sveiki';
	}
}