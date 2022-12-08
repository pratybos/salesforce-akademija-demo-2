/**
 * Created by vytautas on 2022-12-08.
 */

@IsTest
private class DummyClassTest {
    @IsTest
    static void test_good() {
        System.assert(true);
    }

    @IsTest
    static void test_failing_test() {
        System.assertEquals('hello', DummyClass.world, 'Dummy error message on failed test');
    }

    @IsTest
    static void test_doNothing()
    {
        DummyClass.doNothing();
    }
}