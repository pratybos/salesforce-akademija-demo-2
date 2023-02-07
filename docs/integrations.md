# Integrations

## SF services

### Autorizacija

#### Slaptažodis scratch org

Nusistatykite savo scratch org prisijungimui slaptažodį, pasinaudodami instrukcijomis iš puslapio
https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs_passwd.htm
ir komandomis:

 ```bash
 sfdx force:user:display

 sfdx force:user:password:generate
 ```


#### Connected app

Instrukcijos pagal https://www.sfdcstop.com/2019/01/how-to-connect-to-salesforce-with.html.

1. Atsidaryti scratch org Setup
1. Paieškoje kairėje surasti "Manage Apps"
1. Sukurti nauja "Connected app" - paspausti `New Connected App`
1. Įrašyti savo pavadinimą, identifikatorių, email - Testavimui, nesvarbu, kas įrašyta
1. uždėti varnelę "Enable OAuth Settings"
1. Nustatyti "Callback URL"  `sfdc://oauth/restapi/success`
1. Pasirinkti "Selected OAuth Scopes" reikšmes
   1. `Manage user data via APIs (api)`
   1. `Full access (full)`
1. Isšsaugoti
1. Paspausti `Manage Consumer Details`
1. Išsisaugoti "Consumer Key" ir "onsumer Secret" 

#### Postman

1. Įsidiekite postman
1. Atidarykite [Akademijos Postman kolekciją](./Akademija.postman_collection.json)
1. Užpildykite kolekcijos nustatymus 

### Standartiniai Servisai

https://trailhead.salesforce.com/content/learn/projects/quick-start-connect-postman-to-salesforce

### Custom REST service

[Custom REST service pavyzdys](../force-app/main/integrations/rest/classes/REST_GetAccounts.cls)

### Savarankiško darbo užduotis

Sukurti REST servisą, kuris grąžintų bendrą Accountų skaičių ir paskutinį accountą 

## Callout

[Callout pavyzdys](../force-app/main/integrations/callout/classes/BoredAPI.cls)

[Callout panaudojimo pavyzdys](./BoredAPIService.apex)

###  Savarankiško darbo užduotis

Realizuoti vieną iš [List of Free APIs Without Key or Authentication] (https://apipheny.io/free-api/)

