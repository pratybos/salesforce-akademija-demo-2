/**
 * Created by vytautas on 2023-02-07.
 */

public with sharing class BoredAPIService {


    public BoredAPIResponse doSomethingBoring() {
        BoredAPI aBoredAPI = new BoredAPI();

        String responseString = aBoredAPI.sendRequest();

        BoredAPIResponse aBoredAPIResponse = (BoredAPIResponse) JSON.deserialize(responseString, BoredAPIResponse.class);

        System.debug(aBoredAPIResponse);

        return aBoredAPIResponse;
    }


    public class BoredAPIResponse {
        String activity;
        String type;
        Integer participants;
        Decimal price;
        String link;
        String key;
        Decimal accessibility;
    }
}