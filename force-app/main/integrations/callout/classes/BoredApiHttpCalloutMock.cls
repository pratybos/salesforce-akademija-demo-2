/**
 * Created by vytautas on 2020-09-17.
 */

@IsTest
global class BoredApiHttpCalloutMock implements HttpCalloutMock {
    private Map<String, HttpResponse> responses;

    public BoredApiHttpCalloutMock() {
        responses = new Map<String, HttpResponse> ();
    }

    public void addResponse(String requestBody, HttpResponse newResponse) {
        responses.put(requestBody, newResponse);
    }

    global HttpResponse respond(HttpRequest req) {
        String requestKey;
        if (req.getMethod() == 'GET') {
            requestKey = req.getEndpoint();
        }
        else {
            requestKey = req.getBody();
        }
        System.debug('requestKey = ' + requestKey);
        HttpResponse response = responses.get(requestKey);

        System.assertNotEquals(null, response, 'No response for: [' + requestKey + ']');

        return response;
    }
}