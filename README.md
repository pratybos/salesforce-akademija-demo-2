# salesforce akademija

## Darbo aplinkos pasiruošimas 

### Git 

#### ubuntu 

```bash
sudo apt install git
```

#### windows

Atsisiųsti iš https://git-scm.com/downloads skaityti instrukcijas ir diegti vadojantis jomis

### SFDX

Atsisiųsti iš https://developer.salesforce.com/tools/sfdxcli  ir diegti vadojantis jomis

### nebūtinas žingsnis - ssh key

#### ubuntu

Įsitikinkite kad nesate atsidarę terminalo su sudo. 

```bash
sshkey-gen
```
#### windows 

Pakankamai išsami instrukcija: https://phoenixnap.com/kb/generate-ssh-key-windows-10

## IDE 

Rekomenduojame naudoti JetBrains WebStorm su IlluminatedCloud.

### Įsidiegti JetBrains Toolbox 

Įsidiegti galima per JetBrains Toolbox :  https://www.jetbrains.com/toolbox-app/. Atsisiųsti ir diegti sekant instrukcijomis.

### Įsidiegti JetBrains WebStorm

Paleisti JetBrains Toolbox. Pasirinkti WebStorm ir įdiegti. 

### Įsidiegti IlluminatedCloud

* Paleisti WebStorm iš Toolbox. 
* Atsidaryti meniu: File -> Settings. 
* Atsidaryti Plugins. 
* Paieškoje įvesti IlluminatedCloud
* Įdiegti IlluminatedCloud.

## Pasiruošimas darbui su projektu

### Užsiregistruoti github 

Šis žingsnis daromas vieną kartą gyvenime.

Jei jau esate užsiregistravę, šį žingsnį praleiskite.
Jei nesate užsiregistravę - užsiregistruokite. 

### Pasidaryti projekto kopiją (fork) 

Šis žingsnis daromas tik šį kartą.

Atsidaryti šį projektą github. Paspausti 'Fork' viršutiniame dešiniame kampe.  
Atsidariusiame puslapyje paspausti 

### Atsisiųsti savo projektą iš git 

Šis žingsnis daromas vieną kartą, pradedant dirbti su projektu.

Atsidaryti katalogą, kuriame laikysite visus savo projektus, tarkime, darbastalį.
Atsidarykite terminalą / Command prompt / git bash

```bash
git clone https://github.com/<JŪSŲ_GITHUB_VARDAS>/salesforce-akademija-demo.git
```

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

### Prisijungti prie DevHub

Šis žingsnis daromas vieną kartą, pradedant dirbti su projektu.

```bash
sfdx force:auth:web:login --setalias sf-akademija-prod --instanceurl https://login.salesforce.com
```

### Susikuti scratchorg

Šis žingsnis daromas:

* būtinai, pradedant dirbti su projektu.
* pradedant naują užduotį, kuriai reikia užtikrinti, kad "nesipjautų" su ankstesne šio projekto užduotimi.
* darant ilgą užduoti, trunkančia ilgiau nei 30 dienų. 
* grįžtant prie užduoties, praėjus daugiau nei 30 dienų nuo scratchorg suskūrimo. 

Paleisti komandą:

```bash
sfdx force:org:create -d 30 -s -f config/project-scratch-def.json -a sf-akademija-scratch -v sf-akademija-prod
```













