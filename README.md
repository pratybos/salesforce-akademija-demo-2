# salesforce akademija

## Darbo aplinkos pasiruošimas

### Git

#### ubuntu

```bash
sudo apt install git
```

#### windows

Atsisiųsti iš https://git-scm.com/downloads, skaityti instrukcijas ir diegti vadojantis jomis

### SFDX

#### Ubuntu

```bash 
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt update
sudo apt install nodejs
sudo npm install -g sfdx-cli
```

#### Windows

Atsisiųsti iš https://developer.salesforce.com/tools/sfdxcli ir įdiegti vadovaujantis instrukcijomis.

### nebūtinas žingsnis - ssh key

#### ubuntu

Įsitikinkite, kad nesate atsidarę terminalo su sudo.

```bash
sshkey-gen 
```

#### windows

Pakankamai išsami instrukcija: https://phoenixnap.com/kb/generate-ssh-key-windows-10

## IDE

Rekomenduojame naudoti JetBrains WebStorm su IlluminatedCloud.
Įsidiegti galima per JetBrains Toolbox.

### Įsidiegti JetBrains Toolbox

Atsisiųsti JetBrains Toolbox :  https://www.jetbrains.com/toolbox-app/ ir diegti sekant instrukcijomis puslapyje.

### Įsidiegti JetBrains WebStorm

Paleisti JetBrains Toolbox.
Pasirinkti WebStorm ir įdiegti.

### Įsidiegti IlluminatedCloud

1. Paleisti `WebStorm` iš `Toolbox`.
1. Jei dar niekada nesinaudojote WebStorm - pirmą kartą prašys licenzijos.
    * Jei turite, įveskite
    * Jei neturite galite užsiregistruoti ir bandyti 30 dienų.
      * Registracijai naudokite tą naršyklę, kur atsidaro paspaudus login mygtuką.  
1. Jei dar niekada nebuvote atidarę jokio projekto su webstorm, jums rodys kitokį langą, nei įprastai, jame nėra `File`
   meniu. Tokiu atveju, sukurkite naują projektą, nesvarbu kokį, tai daroma tik tam, kad gautumėte įprastinį webstorm
   langą.
1. Atsidaryti meniu: `File` -> `Settings`.
1. Atsidaryti `Plugins`.
1. Paieškoje įvesti „IlluminatedCloud“
1. Paspausti `Install` prie „IlluminatedCloud 2“.

### Susiskonfigūruoti IlluminatedCloud

1. Spauskite betkurioje vietoje, tarkime ant projekto pavadinimo kairėje ir kontekstiniame meniu išsirinkite 
`Illuminated cloud` -> `Configure application`
1. Atsidariusiame lange pasirinkti `Salesforce DX`
1. Laukelyje `Salesforce CLI executable` įrašyti adresą, kur įdiegtas sfdx
   * Linux tai galima sužinoti parašius komandą `which sfdx`
   * Susirasti galima paspaudus aplanko ikonėlę `Salesforce CLI executable` laukelyje
1. Uždėkite visas varneles sekcijoje `Automatically push to server on` 

## Pasiruošimas darbui su projektu

### Užsiregistruoti github

Šis žingsnis daromas vieną kartą gyvenime.

Jei jau esate užsiregistravę, nesiregistruokite pakartotinai.
Jei nesate užsiregistravę - užsiregistruokite.

### Pasidaryti projekto kopiją (fork)

Šis žingsnis daromas tik šį kartą.

1. Atsidaryti šį projektą (salesforce-akademija-demo) github puslapyje.
1. Paspausti 'Fork' viršutiniame dešiniame kampe.
1. Atsidariusiame puslapyje paspausti 'Create fork'

### Atsisiųsti savo projektą iš git

Šis žingsnis daromas vieną kartą, pradedant dirbti su projektu.

Atsidaryti katalogą, kuriame laikysite visus savo projektus, tarkime, darbastalį.
Atsidarykite terminalą / Command prompt / git bash

```bash
git clone https://github.com/<JŪSŲ_GITHUB_VARDAS>/salesforce-akademija-demo.git
```

Repozitorijos adresą klonavimui nusikopijuokite paspaudę žalia mygtuką `Code`.

Pavyzdžiui:

```bash
git clone https://github.com/vytautasgermanavicius/salesforce-akademija-demo.git
```

### Atsidaryti projektą su webstorm

Šis žingsnis daromas kiekvieną kartą, dirbant su projektu.

```bash
cd salesforce-akademija-demo
webstorm .
```

Pirmą kartą atidarant direktoriją su projektu, reikia patvirtinti, kad pasitikite tuo projektu.
Paspauskite `Trust project`

### Prisijungti prie DevHub

Šis žingsnis daromas vieną kartą, pradedant dirbti su projektu.

1. Narsyklėje atsidarykite https://login.salesforce.com
1. Prisijunkite su savo dev org prisijungimo vardu ir slaptažodžiu.
1. Atidarykite `Setup`.
1. Paieškoje įvesite `Dev Hub`
1. `Enable Dev Hub` turi rodyti `enabled`
1. `Enable source tracking .....` turi rodyti `enabled`

Uždarykite naršyklė langą.

Grįžkite į projekto terminalą. Įvykdykite komandą:

```bash
sfdx force:auth:web:login --setalias sf-akademija-prod --instanceurl https://login.salesforce.com
```

Naršyklėje atsidarys Salesforce prisijungimo langas.
Jame prisijunkite su savo dev org prisijungimo vardu ir slaptažodžiu.

Paklaus, ar norite leisti programai pasiekti org, sutikite.

Uždarykite šį naršyklės langą.

### Susikurti scratchorg

Šis žingsnis daromas:

* būtinai, pradedant dirbti su projektu.
* pradedant naują užduotį, kuriai reikia užtikrinti, kad "nesipjautų" su ankstesne šio projekto užduotimi.
* darant ilgą užduoti, trunkančia ilgiau nei 30 dienų.
* grįžtant prie užduoties, praėjus daugiau nei 30 dienų nuo scratchorg suskūrimo.

Terminale paleisti komandą:

```bash
sfdx force:org:create -d 30 -s -f config/project-scratch-def.json -a sf-akademija-scratch -v sf-akademija-prod
```
