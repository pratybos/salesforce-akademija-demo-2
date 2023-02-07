/**
 * Created by vytautas on 2022-12-04.
 */

public with sharing class DummyClass {

    public static final String world = 'world';

    /**
     * does nothing
     */
    public static void doNothing() {
        System.debug('Hello ' + world);
    }
}