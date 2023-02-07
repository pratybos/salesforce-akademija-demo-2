/**
 * Created by vytautas on 2023-02-07.
 */

public with sharing class BoredAPI {

    private static final Integer STATUS_OK = 200;

    public String sendRequest()
    {
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');

        String url = 'https://www.boredapi.com/api/activity';
        req.setEndpoint(url);

        req.setHeader('Content-Type', 'application/json; charset=utf-8');

        req.setTimeout(120000); // max 2 min

        Http aHttp = new Http();
        HttpResponse aHttpResponse = aHttp.send(req);


        Integer responseCode = aHttpResponse.getStatusCode();
        if (responseCode == STATUS_OK)
        {
            String responseBody = aHttpResponse.getBody();
            return responseBody;
        }

        // TODO Throw exception
        return null;
    }
}