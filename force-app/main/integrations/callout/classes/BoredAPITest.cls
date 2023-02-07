/**
 * Created by vytautas on 2023-02-07.
 */

@IsTest
private class BoredAPITest {
    @IsTest
    static void test_sendRequest() {

        String testResponseBody = '{"activity":"Go to a music festival with some friends","type":"social","participants":4,"price":0.4,"link":"","key":"6482790","accessibility":0.2}';

        BoredApiHttpCalloutMock aBoredApiHttpCalloutMock = new BoredApiHttpCalloutMock();

        HttpResponse testResponse = new HttpResponse();
        testResponse.setBody(testResponseBody);
        testResponse.setStatusCode(200);

        aBoredApiHttpCalloutMock.addResponse('https://www.boredapi.com/api/activity', testResponse);

        Test.setMock(HttpCalloutMock.class, aBoredApiHttpCalloutMock);

        BoredAPI aBoredAPI = new BoredAPI();

        String responseBody = aBoredAPI.sendRequest();

        System.assertEquals(testResponseBody, responseBody);

    }
}