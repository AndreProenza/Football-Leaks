# Digital Forensic Report

## Authors 
 
<p align="justify"> 
	
	• André Proença • Ana Albuquerque • Joel Russo
</p>

---

## Appendix

1. [Digital Forensics Report](#digital-forensics-report);
2. [Estrutura da investigação](#estrutura-da-investigação);
3. [Artefatos de evidência](#artefatos-de-evidência);
4. [Ferramentas externas usadas para análise de discos e obtenção de provas](#ferramentas-externas-usadas-para-análise-de-discos-e-obtenção-de-provas);
5. [Provas descobertas](#provas-descobertas);
6. [Análise do disco charlied e obtenção de provas](#análise-do-disco-charlied-e-obtenção-de-provas);
7. [Análise do disco backup e obtenção de provas](#análise-do-disco-backup-e-obtenção-de-provas);
8. [Itens auxiliares](#itens-auxiliares);
9. [Automatização de extração de provas](#automatização-de-extração-de-provas);

---

## Digital Forensics Report
 

**1. Do you find any traces of the Football Leaks files on Mr. Daniels’ computers?**

> <p align="justify">
> Sim, encontrámos. Através da análise do disco charlied destacaram-se dois ficheiros: ficheiro .bash_history, que 
> mostra os comandos recentes executados pelo Charlie na sua máquina, e o chat privado entre o Charlie e 'chapman13' 
> (que se encontra na diretoria home/charlied/irclogs/2021/EFNet/chapman13.10-16.log) 
> que ajuda a interpretar os acontecimentos antes e 
> após a publicação dos documentos confidenciais no blog do Charlie.
> <p align="justify">
> Estes dois ficheiros foram fundamentais para conseguirmos estabelecer uma ligação entre os acontecimentos.
> Resumidamente, 'chapman13' é responsável por obter os documentos confidenciais de modo ilegítimo, entregando-os a 
> Charlie numa pen drive. Charlie publica-os no seu blog, guarda uma cópia segura destes documentos confidenciais num zip 
> no seu computador de backup e remove-os de maneira segura do seu computador pessoal, para evitar deixar rasto no mesmo. 
> <p align="justify">
> Podemos encontrar informação detalhada sobre o processo de obtenção de provas nas secções número 6 e 7
> (ver appendix).
> <p align="justify">
> Dito isto, no disco charlied não é possível encontrar os documentos confidenciais, no entanto no disco de backup,
> encontramos um zip backup_1634412601.zip, que após desencriptado e extraído, confirma a existência dos documentos que 
> incriminam o Sr.Velluci.
	

**2. If so, can you track the source of these files and how they have been manipulated over time?
Establish a timeline of relevant events**

> <p align="justify"> 
> Com a análise efetuada aos ficheiros encontrados, podemos concluir que todos os acontecimentos ocorreram dia 16 Outubro de 2021. 
> <p align="justify"> 
> Numa tentativa de recriar uma linha temporal dos acontecimentos, verificámos que Charlie efetuou os seguintes backups:  
> <p align="justify"> 
> Criação do primeiro backup, backup_1634405485.zip, às 17:31:25h.  
><p align="justify"> 
> Criação do segundo backup, backup_1634412601.zip, às 19:30:01h, contendo este os ficheiros incriminadores do Sr. Velluci encontrados.
><p align="justify"> 
> Criação do terceiro e último backup, backup_1634414401.zip, às 20:00:01h.
><p align="justify"> 
> Antes do primeiro backup foi feito o download de wetransfer_obfuscator_2021-10-06_2110.zip, ficheiro esse que foi obtido através de um link wetransfer (https://we.tl/t-UA0iKwkxTa) enviado pela Abby (chapman) às 18:19 através do chat EFNet.  
><p align="justify"> 
> Foi feita de seguida a extração do mesmo e colocada na pasta /home/charlied/password_gen. Estes ficheiros foram usados posteriormente por Charlie para gerar a password dos ficheiros backup.  
><p align="justify"> 
> De seguida, foi criado um ficheiro backup.sh que faz uso das ferramentas mencionadas anteriormente e criado um ficheiro zip backup_1634412601.zip.  
><p align="justify"> 
> Entre os primeiro e o segundo backups, é possível observar que foi criado um cronjob com o comando “crontab –e", comando esse que é responsável por criar os backups (que se encontram na diretoria /home/carlied) num intervalo de 30 em 30 minutos (verificável pelas datas dos backups). Durante este período, foi feita a instalação de aplicações. Através do ficheiro .bash_history conseguimos verificar que foi inserida a pen drive de chapman1337 (Abby) em /media/charlied/CHAPMAN1337/ que continha todos os ficheiros incriminadores encontrados na pasta ~/rhfc/. Charlie analisou esses ficheiros (verificável pelo log de EFNet).
><p align="justify"> 
> Entre os segundo e o terceiro backups, é possível observar que o Charlie esteve já leu todos os documentos e que está surpreendido com o conteúdo (verificável pelo log de EFNet). Charlie apagou a pasta ~/rhfc/ de modo seguro do computador de Charlie com um comando obtido através de uma pesquisa no google. Esta ação foi aconselhada por Abby (verificável pelo log do canal EFNet). Foi também neste período que iniciou a criação da publicação no seu blogue wordpress.
> <p align="justify"> 
> Concluído o backup final, constatamos que a pasta foi realmente apagada de modo seguro. Foi também finalizada a publicação o artigo no seu blogue. 
> </p>
Na figura seguinte é possivel observar a linha temporal dos acontecimentos relevantes que ocorreram neste dia.

![timetable](https://user-images.githubusercontent.com/78174997/143694914-a498b23f-ba89-4e9d-9e4f-5602c22ff24b.png)



#
              
**3. Do you find any evidence of anti-forensic activity?**

> <p align="justify"> 
> Sim, foram encontradas várias instâncias onde ocorreram tentativas anti-forense, tais como: 
> <p align="justify"> 
> Os sucessivos backups da pasta charlie/home, enviados para um servidor remoto (backup-server), através da execução do bash script backup.sh encontrado na diretoria charlied_disk/home/cron_manager/
> <p align="justify"> 
> A utilização da ferramenta secure-delete para eliminação segura e definitiva da pasta que continha todas as provas incriminadoras do Sr. Velluci ~/rhfc/* com o comando: srm ~/rhfc/*
>
> Este comando foi encontrado através de uma pesquisa no google feita por charlie “https://www.google.com/searchchannel=fs&client=ubuntu&q=how+to+securely+delete+files+ubuntu” encontrado em /home/charlied/.mozilla/firefox/zmpu4nds.default-release/places.sqlite.
> </p>

#

**4. What can you tell about the identity of the person(s) involved in the leakage of the files?**
 
> <p align="justify"> 
> 	Ao longo da investigação efetuada, averiguamos a intervenção de duas pessoas, das quais: Charlie e "chapman13", nickname que identifica Abby (que
> aparenta ter algum tipo de relação amorosa com Charlie) como podemos verificar no ficheiro chapman13.10-16.log que pode ser encontrado em 
> charlied_disk/irclogs/2021/EFNet/chapman13.10-16.log.
> <p align="justify">
> A partir deste log, constatamos que Abby trabalha no departamento IT dos Red Hawks FC e que esta, demonstra ter consciência da ilegalidade que comete ao aceder aos documentos confidenciais que se encontravam no computador do Sr.Velluci. Abby demonstra
> ter conhecimento sobre as técnicas de ocultação de ficheiros que sugeriu a Charlie. 
> <p align="justify">
> Quanto a Charlie, foi possível encontrar o seu perfil de linkedin (https://www.linkedin.com/in/charles-daniels-355264222/?originalSubdomain=uk) em .thunderbird/largus1u.default-release/ImapMail/outlook.office365.com/INBOX. Deste documento conseguimos obter diversas informações, tais como, que trabalha Como News Reporter na Youths Against Soccer Corruption, que mora em Killamarsh, Inglaterra, Reino Unido, que estudou na universidade de Oxford, tendo um diploma em English Language and Literature no período 2012 a 2015. Conseguimos também encontrar também alguns dos interesses que tem, destacando-se de entre estes o jornalismo.
> <p align="justify">
> Foi "chapman13" (Abby), que ocultou os documentos confidenciais, colocou-os numa pen drive, e entregou-a em mãos a Charlie, no Jake's cybercafé, para que este os partilhasse no seu seu blogue.
> Embora não exista nenhuma evidência que demonstre que Abby não quer comprometer o seu lugar no departamento de IT dos Red Hawks FC, acreditamos que, de modo a evitar que tal aconteça, Abby pede a Charlie que use ferramentas seguras de maneira a impedir que os documentos sejam perdidos ou interceptados por alguém.
> <p align="justify">
> Em suma, é possivel afirmar que tanto Charlie como Abby agiram de forma incorreta, Abby vasculhou e obteve os documentos de forma ilegal, sem qualquer mandato que autorizasse que o computador do Sr.Velluci fosse revistado, e Charlie, expôs a situação ao mundo, no seu blogue, sem mencionar as suas fontes. Abby foi cúmplice de Charlie.
	
---

## Estrutura da investigação

Organizámos a investigação por diretorias. 
Todas as provas descobertas são guardadas na diretoria `Evidences/`.
Todas as ferramentas usadas para a descobertas de provas (scripts, programas, etc...) são guardadas na diretoria `Tools/`.

**Visualização gráfica do ambiente de investigação:**
        
```
csf-lab2-artifacts
       └─── Evidences
		└─── charlied_disk
			└─── cron_manager
				└─── backup.sh
			└─── irclogs
				└─── 2021-EFNet-chapman13.10-16.log
			└─── password_gen
				└─── obfuscator
				└─── seeds.txt
			└─── INBOX
                        └─── places.sqlite
			└─── bash_history.txt
	
		└─── backup_disk
			└─── bash_history.txt
			└─── backup_1634405485_extracted (1)
			└─── backup_1634412601_extracted (1)
			└─── backup_1634414401_extracted (1)
			└─── backup_1634405485.zip (1)
			└─── backup_1634412601.zip (1)
			└─── backup_1634414401.zip (1)
		
		└─── rhfc (Red Hawks Footbal Club)
			└─── * Todos os ficheiros confidenciais

	└─── Tools
		└─── generateEvidences.sh
		└─── extract-disk.sh
		└─── obfuscator
		└─── obfuscator.py
		└─── unobfuscator.py
		└─── zipcracker-ng
		└─── seeds.txt
		└─── backup.sh
		└─── crack_zip.py

	└─── backup_disk.img (2)
	└─── charlied_disk.img (2)
	
	Nota (1): Ficheiro gerado quando executado o ficheiro de automatização generateEvidences.sh
	
	Nota (2): Não estão incluídos no zip. 
	      	  Devem ser incluídos para correr os ficheiros de automatização.

```        

---

## Artefatos de evidência

| Artefacto                        | MD5                                 |
|:--------------------------------:|:-----------------------------------:|
| bank_statement.pdf               | 33bd1f8ed5f5692c5bf1e5a87d6110b2    | 
| chapman_extract.sh               | 5f7033bf6cf9d788f52605accdb749be    |
| club_statement.pdf               | e02839232a2283ac0843de8ecfc980a0    | 
| club_memo.pdf                    | f0882eedb95122f39e692a9397c1f5c5    |
| extract_instructions.txt         | 09a47fb7b3317fc81285d784cdb19b9e    | 
| extract_tool.py                  | b5fb77662fac053d801b28de826def47    |
| James_Santos_profile.pdf         | 44d015d11ecd0ec4ecaa6cb350032d17    |
| secure_delete_commands.txt       | 3fcefdb42ce1ead9b14aff7b7ca99fa3    |
| supporters_statement.pdf         | 2be65457105ca324381952538fc94de7    |
| 2021-EFNet-chapman13.10-16.log   | 6de001cd9a5042649e4d075673ba9afa    |
| INBOX                            | cc1b8903fada999e9761c65e845bd66a    |
| bash_history.txt                 | 0f50cc7b81f81344840c09e008ec894a    |
| backup.sh                        | 00c4155996496ed94488d7f37feb5ce3    |
| obfuscator                       | 8c682b97daf72a9a555758d6a8c85f8e    |
| seeds.txt                        | 1192989e7df0e4701d9d97beba5338bf    |
	
---

## Ferramentas externas usadas para análise de discos e obtenção de provas

 • `TSK sleuthkit`  • `decompile3`  • `cracker-ng`


---

## Provas descobertas

|   Imagens Dadas    | Evidencias				       | Diretório
|:------------------:|:----------------------------------------------: | :---------------------------------------------------------------------:
| charlied_disk.img  | Chat entre Abby e Charlie                       | /home/charlied/irclogs/2021/EFNet/chapman13.10-16.log
| charlied_disk.img  | Blog pessoal de Charles Daniels                 | home/charlied/.mozilla/firefox/zmpu4nds.default-release/places.sqlite
| charlie_disk.img   | Comandos executados por Charles                 | /home/charlied/.bash_history
| backup_disk.img    | Diretoria rhfc/ com evidências                  | /home/charlied/rhfc


---

## Análise do disco charlied e obtenção de provas

### 🔍 Visualização das partições do disco `charlied_disk.img`

**Ferramenta**: `sleuthkit mmls`

O objetivo é exibir o layout das partições do disco `charlied_disk.img`

```
$ mmls charlied_disk.img

DOS Partition Table
Offset Sector: 0
Units are in 512-byte sectors

      Slot      Start        End          Length       Description
000:  Meta      0000000000   0000000000   0000000001   Primary Table (#0)
001:  -------   0000000000   0000002047   0000002048   Unallocated
002:  000:000   0000002048   0001050623   0001048576   Win95 FAT32 (0x0b)
003:  -------   0001050624   0001052671   0000002048   Unallocated
004:  Meta      0001052670   0020969471   0019916802   DOS Extended (0x05)
005:  Meta      0001052670   0001052670   0000000001   Extended Table (#1)
006:  001:000   0001052672   0020969471   0019916800   Linux (0x83)
007:  -------   0020969472   0020971519   0000002048   Unallocated
```


Observamos que existem diferentes partições:
- Primary Table (#0), DOS Extended (0x05), Extended Table (#1)  (metadados sobre a estrutura do disco)
- 3 Unallocated
- Win95 FAT32 (0x0b)
- Linux (0x83)

---

### 🔍 Inspeção da partição `Win95 FAT32 (0x0b)`

**Ferramenta**: `sleuthkit fls`

Lista os ficheiros e diretorias em uma imagem de um disco.

Observando o resultado do comando `mmls` acima, vamos inspecionar a partição `Win95 FAT32 (0x0b)`
através do **offset 2048** 
```
002:  000:000   0000002048   0001050623   0001048576   Win95 FAT32 (0x0b)
```

Listamos então os ficheiros dentro do **offset 2048**
```
$ fls -o 2048 charlied_disk.img

v/v 16743939:    $MBR
v/v 16743940:    $FAT1
v/v 16743941:    $FAT2
V/V 16743942:    $OrphanFiles
```

Analisando cada um dos inodes de `$MBR`, `$FAT1`, `$FAT2` e `$OrphanFiles` com o comando `fls` não é possível retirar qualquer informação relevante. No entanto observando com o comando `icat` é possível verificar que `$MBR` contêm informação normal de um MBR:  
```
$ icat -o 2048 charlied_disk.img 16743939 | strings

mkfs.fat
NO NAME    FAT32
This is not a bootable disk.  Please insert a bootable floppy and
press any key to try again ....7
```
e os restantes `$FAT1`, `$FAT2` e `$OrphanFiles` contêm bytes nulos e informação irrelevante.

---

### 🔍 Inspeção da partição `Linux (0x83)`

**Ferramentas**: `sleuthkit fls`, `sleuthkit icat` 

Começámos por listar o conteúdo da partição com offset 1052672: 
```
fls -o 1052672 charlied_disk.img
```

Desta lista identificámos que o **inode 393218** corresponde à diretoria **`home/`**, portanto inspecionámos a diretoria com o seguinte comando:
```
fls -o 1052672 charlied_disk.img 393218. 
```
Listando o **inode 393218**, encontrámos o **inode 434942** que corresponde à diretoria **`home/charlied/`**.  
Inspecionámos a diretoria com o seguinte comando: 
```
fls -o 1052672 charlied_disk.img 434942
```
onde encontrámos os seguintes ficheiros e diretotorias que parecem relevantes:

```
...
r/r 395585:	.bash_history
...
d/d 419631:	firefox_cache
d/d 420001:	password_gen
d/d 419601:	cron_manager
r/r 422939:	.viminfo
r/r 397712:	.selected_editor
r/r 420225:	francesinha.html
d/d 434894:	.irssi
d/d 434895:	irclogs
d/d 434898:	rhfc
r/r * 422939(realloc):	.viminfo.tmp
```
Aqui, chamou-nos à atenção as diretorias: `password_gen`, `cron_manager` , `irclogs` e `rhfc`.
Explorámos mais detalhadamente cada uma delas:

**Inspecionando a diretoria `password_gen`**:
```
$ fls -o 1052672 charlied_disk.img 420001

r/r 557188:	seeds.txt
r/r 264702:	obfuscator
```

Esta diretoria apresenta dois ficheiros relevantes, e o seu conteúdo aparenta ser algo relacionado a geração de passwords.
O ficheiro `obfuscator` é um python script que gera um password através do ficheiro `seeds.txt`, que contém uma semente em cada linha.
	

**Inspecionando a diretoria `cron_manager`**:
```
$ fls -o 1052672 charlied_disk.img 419601

r/r 423847:	backup.sh
r/r * 397777:	ziPO8cfK
r/r * 397777:	backup_1634414401.zip
r/r * 397448(realloc):	backup.sh~

```
Reparamos que existe um ficheiro backup.sh que parece ser relevante.
```
$ icat -o 1052672 charlied_disk.img 423847
```
O ficheiro `backup.sh` cria um zip da diretoria **home/charlied**, encriptado com uma password gerada pela ferramenta `obfuscator`, e envia-o para o seu computador de backup através de uma ligação remota (rsync), e por fim remove o zip da diretoria do seu computador.
	

**Inspecionando a diretoria `irclogs`**:
```
$ fls -o 1052672 charlied_disk.img 434897
	
r/r 422314:	auth.10-16.log
r/r 422315:	#lrh.10-16.log
r/r 404770:	chapman13.10-16.log
```
Verificámos EFNet logs de duas conversas, um chat privado, com apenas uma pessoa, e um chat de grupo.
O chat privado apresenta conteúdo sensivel para investigação.
	
✔️ Utilização da rede **EFNet** 

Ficheiro `champman13.10-16.log`, chat privado, encontrado em **home/charlied/irclogs/2021/EFNet/**

`$ icat -o 1052672 charlied_disk.img 404770` 
	
```
18:14 <chapman13> Hehehehehe, your mind is gonna blow up if I tell you!
18:14 <charlied> oh pls tell me
18:15 <chapman13> You know how I've been working in the IT department of Red Hawks FC right?
18:15 <charlied> right
18:15 <chapman13> You know how I love tinkering with stuff right?
18:15 <charlied> right
18:15 <chapman13> You know how much a boomer Red Hawks FC president is right?
18:15 <charlied> right... get on with it abby 
18:15 <chapman13> I got some stuff from his computer that you would love to get your hands on 😉
```
Neste excerto reúne-se evidências suficientes para se afirmar que foi Abby, que trabalha no departamento de IT do clube Red Hawks, quem descobriu os documentos que incriminam o Sr.Velucci (encontrados na fase passada), através de um acesso ilegítimo ao seu computador.

```
18:17 <chapman13> Wanna meetup at Jake's cybercafé for coffee? We can hand you over the USB drive here?
18:17 <charlied> you can count on it
18:17 <charlied> let me just change clothes
18:18 <chapman13> Okay. I'll hide these files in the meantime then.
18:18 <charlied> okok
18:19 <chapman13> By the way, download this tool so you can get access to this files without anyone suspecting of you.
18:19 <chapman13> https://we.tl/t-UA0iKwkxTa
18:19 <charlied> done
18:20 <chapman13> Amazing!
18:20 <chapman13> You just unzip the tool on the ir-ssame directory as the red hawks files.
18:20 <chapman13> And then you run the script chapman_extract.sh
18:20 <chapman13> Pretty simple right?
18:20 <charlied> ye
18:20 <chapman13> Then for the chants file open it up using ghex.
18:20 <chapman13> Then you go to edit->insert mode
18:20 <chapman13> And you add onto the header of the file %PDF-
18:20 <chapman13> Amazing! I'll see you in a bit. xo
18:20 <charlied> xo
```
A pen encontrada anteriormente pela equipa forense, (mencionada na entrega 1) estava na posse de chapman13, Abby, que escondeu os ficheiros que incriminam o Sr.Velluci, através de uma ferramenta, permitindo assim que não fosse possível saber quem acedeu aos ficheiros. O script chapman_extract.sh deve conter todos os comandos sobre como extrair os documentos que estavam escondidos nos diferentes ficheiros (.wav, .jpg, etc).
Neste excerto percebemos também que Abby entregou a pen drive em mãos, ao charlie através de um encontro no Jake's cybercafé.

```
20:04 <chapman13> Baby, there is just this one thing.
20:04 <charlied> what? 
20:04 <chapman13> Please, delete the files that were hidden within the Daft Punk album covers.
20:05 <charlied> you mean all the pdfs i extracted?
20:05 <chapman13> Yes
20:06 <chapman13> I mean, hidden within all files I sent you...
20:07 <charlied> how can I do it?
20:07 <chapman13> It's super easy! Just google it
20:07 <charlied> gotcha
```
No seguimento do mesmo raciocinio, Abby pede a Charlie que apague todos os pdfs extraídos de maneira segura e não deixar rastro, para evitar que algo seja descoberto.

		
**Inspecionando a diretoria `rhfc`**:
```
$ fls -o 1052672 charlied_disk.img 434898

r/r * 404856:	drqoid.xsd
r/r * 397778:	extract_instructions.txt
r/r * 397780:	extract_tool.py
r/r * 398254:	hawks_fc.zip
r/r * 398255:	chants.zip
r/r * 399244:	daft_punk.gif
r/r * 404851:	discovery.jpg
r/r * 404852:	hbfs.wav
r/r * 404853:	homework.jpg
r/r * 404854:	ram.jpg
r/r * 404855:	SNA_Football_Lyrics.mp4
r/r * 404856:	ticket.jpg
r/r * 397777:	mydxwzfivvvaloc.zv
r/r * 404860:	club_statement.pdf
r/r * 404861:	data.zip
r/r * 404862:	James_Santos_profile.pdf
r/r * 419418:	chant2
r/r * 419448:	chant1.wav
r/r * 419456:	supporters_statement.pdf
r/r * 419418:	club_memo.pdf
r/r * 404857:	ozgivkdthslzms.nbv
r/r * 422938:	secure_delete_commands.txt
```

Esta diretoria aparenta ter as provas de que andamos à procura. No entanto os ficheiros foram todos removidos, sendo por isso difícil recuperá-los neste computador.

	
#### 🔍 Inspecionando o `.bash_history.txt`

```
$ icat -o 1052672 charlied_disk.img 395585
	
...
cd Downloads/
unzip wetransfer_obfuscator_2021-10-06_2110.zip 
rm wetransfer_obfuscator_2021-10-06_2110.zip 
mkdir /home/charlied/password_gen
mv seeds.txt obfuscator /home/charlied/password_gen
...
mkdir cron_manager
cd cron_manager/
...
./backup.sh 
...
cd /media/charlied/CHAPMAN1337/
...
cp /media/charlied/CHAPMAN1337/hawks_fc.zip ~/rhfc/
cd rhfc/
...
unzip hawks_fc.zip 
chmod 777 chapman_extract.sh 
./chapman_extract.sh 
unzip chants.zip 
./chapman_extract.sh
...
sudo apt install secure-delete
srm -vz ~/rhfc/*
...
```
Depois de interpretar a conversa privada entre a Abby e o Charlie visível no ficheiro `champman13.10-16.log`, torna-se mais fácil entender os comandos executados na máquina do charlie, comandos esses registados no `.bash_history`
Aqui, podemos observar as instruções mais recentes executadas pelo charlie no seu computador. Verificamos que fez download de um link recomendado pela Abby que contêm as ferramentas `obfuscator` e o ficheiro `seeds.txt`. 

Após isso, moveu-os para a diretoria **password_gen/**. Criou a diretoria **cron_manager/** e executou o `backup.sh`, que como explicado acima, cria um zip da diretoria **home/charlied/**, encriptado com uma password gerada pela ferramenta `obfuscator`, e envia-o para o seu computador de backup através de uma ligação remota (rsync), e por fim remove o zip da diretoria do seu computador. 
	
Copiou o zip `hawks_fc.zip`, da pen drive obtida da Abby, para a diretoria **rhfc/** (que possivelmente significa Red Hawks Football CLub). Fez unzip da pasta, e reparou em vários ficheiros (.wav, .jpg, etc) que escondem os pdfs. Executou o script `./chapman_extract.sh` que extraíu os pdfs escondidos nos ficheiros, que incriminam o Sr.Velluci.
	
De seguida instalou na sua máquina a ferramenta `secure-delete`, (remove ficheiros de maneira segura e irrecuperável) e executou o comando: `srm -vz ~/rhfc/*` para remover todo o conteúdo da diretoria `rhfc/`.

Para podermos confirmar esta hipótese, temos que verificar se realmente a diretoria **rhfc/** do computador de backup, contêm estes documentos que foram removidos deste computador. Analisaremos o backup mais adiante.
	
	
Para uma análise mais profunda e detalhada extraímos a diretoria `charlied/home/` recorrendo a um script.

#### 🔍 Extração da diretoria **charlied/home/** para análise detalhada

**Item Auxiliar**: `extract-disk.sh` 

Criámos um bash script `extract-disk.sh` que automatiza o processo de extração de uma determinada diretoria de um sistema de ficheiros.

Comando que gera um cópia exata da diretoria **charlied/home/**, subdiretorias e ficheiros recuperáveis através do inode e do offset da partição.
Neste caso, **offset: 1052672**, e **inode 434942**.
```
bash extract-disk.sh charlied_disk.img 1052672 434942
```
Para mais informação sobre este **item**, consultar o menu de `Itens auxiliares` mais abaixo do relatório.

	
	
Após a extração da diretoria **charlied/home/**, encontrámos ainda outras evidências relevantes:
	
✔️ Emails trocados entre Abby e Charlie em `.thunderbird/largus1u.default-release/ImapMail/outlook.office365.com/` no ficheiro **INBOX**

```
(...)
From: chapmanabby1337 <chapmanabby1337@protonmail.com>

Wake up dummy! You know e-mail is not that secure right?

Love you,

xoxo,

Abby


Sent with ProtonMail Secure Email.
```

Encontrámos também na caixa **INBOX** informação que nos levou ao perfil de linkedin de Charlie.

✔️ LinkedIn de Charles Daniels

https://www.linkedin.com/in/charles-daniels-355264222/?originalSubdomain=uk
	
✔️ Blog pessoal de Charles Daniels em `/home/charlied/.mozilla/firefox/zmpu4nds.default-release/places.sqlite`

![image](https://user-images.githubusercontent.com/72214330/139063030-3da6ccea-1120-4b6c-b5d4-4bcca76563f6.png)

Através do link https://truthinfootball.wordpress.com/ é possivel averiguar a exposição da Corrupção acerca do desvio de dinheiro feita por parte do jornalista.
	

---

## Análise do disco backup e obtenção de provas

### 🔍 Visualização das partições do disco `backup_disk.img`

**Ferramenta**: `sleuthkit mmls`

O objetivo é exibir o layout das partições do disco `backup_disk.img`

```
$ mmls backup_disk.img 

DOS Partition Table
Offset Sector: 0
Units are in 512-byte sectors

      Slot      Start        End          Length       Description
000:  Meta      0000000000   0000000000   0000000001   Primary Table (#0)
001:  -------   0000000000   0000002047   0000002048   Unallocated
002:  000:000   0000002048   0014776319   0014774272   Linux (0x83)
003:  -------   0014776320   0014778367   0000002048   Unallocated
004:  Meta      0014778366   0016775167   0001996802   DOS Extended (0x05)
005:  Meta      0014778366   0014778366   0000000001   Extended Table (#1)
006:  001:000   0014778368   0016775167   0001996800   Linux Swap / Solaris x86 (0x82)
007:  -------   0016775168   0016777215   0000002048   Unallocated
``` 

Observamos que existem diferentes partições:
- Primary Table (#0), DOS Extended (0x05), Extended Table (#1)  (metadados sobre a estrutura do disco)
- 3 Unallocated
- Linux (0x83)
- Linux Swap / Solaris x86 (0x82)

---

### 🔍 Inspeção da partição `Linux (0x83)`

**Ferramentas**: `sleuthkit fls`, `sleuthkit icat` 

Começámos por listar o conteúdo da partição com offset 2048: `fls -o 2048 backup_disk.img`.
Desta lista identificámos que o **inode 12** corresponde à diretoria **home/**, por esse motivo inspecionámos a diretoria com o seguinte comando:
`fls -o 2048 backup_disk.img 12`. 

Listando o **inode 12**, encontrámos o **inode 168820** que corresponde à diretoria **home/charlied/**.  
Inspecionámos a diretoria com o seguinte comando: `fls -o 2048 backup_disk.img 168820` onde encontrámos os seguintes ficheiros que parecem relevantes:

```
...
r/r 136657:	.bash_history
...
r/r 168635:	backup_1634405485.zip
r/r 168617:	francesinha.html
r/r 168638:	.dmrc
r/r * 168650(realloc):	.backup_1634414401.zip.sF7OoH
r/r 168646:	backup_1634412601.zip
r/r 168650:	backup_1634414401.zip
```

Observamos que todos estes ficheiros têm os seus metadados allocated, menos o ficheiro `.backup_1634414401.zip.sF7OoH` que foi reallocated para um novo ficheiro `(realloc)`, ou seja, aparece como unallocated, no entanto os seus metadados estão allocated pelo que é possível extrair este e os outros ficheiros com o comando `icat`, não sendo por isso necessário recorrer a técnicas de carving de ficheiros.

#### 🔍 Extração dos backup zips utilizando a ferramenta `icat`:

Extrair **inode 168635** para o ficheiro: `backup_1634405485.zip`
```
icat -o 2048 backup_disk.img 168635 > backup_1634405485.zip
```

Extrair **inode 168646** para o ficheiro: `backup_1634412601.zip`
```
icat -o 2048 backup_disk.img 168646 > backup_1634412601.zip
```

Extrair **inode 168650** para o ficheiro: `backup_1634414401.zip`
```
icat -o 2048 backup_disk.img 168650 > backup_1634414401.zip
```

#### 🔍 Extração do `.bash_history` utilizando a ferramenta `icat`:

```
icat -o 2048 backup_disk.img 136657 > bash_history.txt
```

#### 🔍 Inspecionando o `.bash_history.txt`

```
icat -o 2048 backup_disk.img 136657
ifconfig
rsync
ssh
sudo apt-get install openssh-server
exit
ifconfig
sudo apt-get install openssh-server
sudo service ssh status
ls
ls -lah
ls -lah 
ls -lah
ls -lah
```

Reparamos que nada de relevante foi executado no terminal.

Vamos então observar o conteúdo dos zips extraídos. Verificámos que os zips estavam encriptados com uma password.
Para entender o modo de encriptação tivémos que obter o código fonte da ferramenta `obfuscator`, responsável por gerar a password.
	
#### 🔍 Decode da ferramenta obfuscator

**Ferramenta**: `github.com/rocky/python-decompile3`  

Para originar o source code do executável obfuscator, usámos a ferramenta decompile3.
O nome de obfuscator foi alterado para obfuscator.pyc e de seguida foi descompilado para um ficheiro obfuscator.py

**Decode**
```bash
mv obfuscator obfuscator.pyc
decompyle3 obfuscator.pyc > obfuscator.py
```

Descompilada a ferramenta e entendida a ferramenta,seguimos o processo de desencriptação que se apresenta de seguida.

#### 🔍 Extração do conteúdo dos backup zips encriptados com password

**Ferramentas**: `zipcracker-ng`
**Items auxiliares**: `unobfuscator.py`

Funcionamento e modo de utilização destas ferramentas podem ser consultadas na secção `Items auxiliares`.

De modo a extraírmos o conteúdo de cada backup, criámos um script python que cria todas as passwords possíveis para o backup.zip e armazena-as num ficheiro `wordlist.txt`. Depois usámos a ferramenta `zipcracker-ng` para fazer o crack da password, e obter a password correta de entre as milhares de passwords da `wordlist.txt`

Geração de password wordlist para o ficheiro: `backup_1634405485.zip`:
```
python3 unobfuscator.py 1634405485
```

Descobrir password:
```
./zipcracker-ng -f backup_1634405485.zip -w wordlist.txt
```

password: `8c34a71b8ae5c67a2ee309622f4ae28bdcc838f76cf924c994b8b9d719d684ae`

----------------------------------------------------

Geração de password wordlist para o ficheiro: `backup_1634412601.zip`: 
```
python3 unobfuscator.py 1634412601
```

Descobrir password:
```
./zipcracker-ng -f backup_1634412601.zip -w wordlist.txt
```
password: `0b70142bc4d6bb1a78a0466c4986d18b5e2383f69d0a017f280a5d16c1177a9b`

----------------------------------------------------

Geração de password wordlist para o ficheiro: `backup_1634414401.zip`: 
```
python3 unobfuscator.py 1634414401
```

Descobrir password:
```
./zipcracker-ng -f backup_1634414401.zip -w wordlist.txt
```
password: `e64b1b6ba974f1b1097d767175ff7adaad0cb17caff3f71683cfa7362764ebe4`

----------------------------------------------------
	
### 🔍 Inspeção dos backups

Extraídos e analisados os ficheiros zip's, chegámos à conclusão que alguns não tinham informação tão relevante quanto outros. E, por isso, apenas apresentámos neste relatório a análise do zip que considerámos ter mais evidências. Iremos analisá-las nesta secção.


#### 🔍 Inspecionando `backup_1634412601`

✔️ Cópia das evidências encontradas na diretoria: **rhfc/**
	
Observando a diretoria **rhfc/** verificamos que todos os ficheiros removidos do computador do charlie, da diretoria **rhfc/**, estão aqui presentes também na diretoria **rhfc/**.

Nesta diretoria existe o zip `1337_tools.zip` que contêm o ficheiro `chapman_extract.sh` e `extract_tool.py` que corresponde ao zip enviado pela Abby para o charlie, de modo a que charlie consiga recuperar os pdfs, escondidos nos ficheiros (.wav, .jpg, etc...).

Existe também o zip hawks_fc.zip que foi copiado da pen drive da Abby para o computador do charlie, extraído, e depois enviado para o computador de backup.

----------------------------------------------------


## Itens auxiliares

• `generateEvidences.sh`
Bash script que automatiza todo o processo de obtenção de provas das imagens dos discos dadas. Com apenas um comando é possível extrair todo o conteúdo dos discos por diretorias, e fazer unzip dos backup_zips protegidos com password.
Além disso é ainda possível instalar as ferramentas necessárias para a obtenção das provas.
  
 **Modo de utilização:** [^6] [^7]
  ```bash
  bash generateEvidences.sh <arg>
  bash generateEvidences.sh -y 
  bash generateEvidences.sh -n
  ```
 
• `extract-disk.sh`

Bash script que extraí todo o conteúdo recuperável de uma imagem de um disco, dada um offset e uma partição.
Extraí ficheiros e diretorias com recurso ao comando `icat`.

**Modo de utilização:**
  ```bash
  bash extract-disk.sh <disk image> <offset to extract> <inode of directory>
  
  Example: bash extrach-disk.sh charlied_disk.img 1052672 393218
  Example extracts /home from charlie_disk.img
  ```

• `backup.sh`
	
Bash script que cria um zip da diretoria **home/charlied**, encriptado com uma password gerada pela ferramenta `obfuscator`, e envia-o para o seu computador de backup através de uma ligação remota (rsync), e por fim remove o zip da diretoria do seu computador.
  
• `obfuscator.py`

Python script que gera um password através do ficheiro `seeds.txt`

• `seeds.txt`

ficheiro que guarda em cada linha uma semente que alimenta o script `obfuscator.py` para geração de passwords.

• `unobfuscator.py`

Python script que, dada a data de um `backup_data.zip`, abre o ficheiro `seeds.txt`, lê cada linha do ficheiro e para cada linha concatena com a data passada por parametro gerando assim uma password. Escreve cada uma dessas passwords geradas no `wordlist.txt` (Uma por linha).

**Modo de utilização:**
  ```bash
  Usage: python3 unobfuscator.py <zip_data_number>
  Example: python3 unobfuscator.py 1635117278
  ```
 output: `wordlist.txt`
 
• `wordlist.txt`

Wordlist em que cada linha do ficheiro contêm uma password para desencriptar os backup zips protegidos com password.
 
• `zipcracker-ng` `https://github.com/search?l=C%2B%2B&q=zip+cracker&type=Repositories`

Programa que faz o crack do zip usando uma wordlist, obtendo a sua password.

**Modo de utilização:**
  ```bash
  Usage:
	zipcracker-ng -f <file> [-w <wordlist>] [-fp <word>...]
	generator | zipcracker-ng -f <file> -
  Where generator could be cat, crunch, john, jot or whatever you want.
  ```
• `crack_zip.py`
	
Python Script que faz o unzip automático de um zip encriptado com password.
	
**Modo de utilização:**
  ```bash
  Usage:
	python3 crack_zip.py <zip_data_number>
	Example: python3 crack_zip.py 1634412601
  ```

 ## Automatização de extração de provas

**Nota**: Para correr o script de automatização, é necessário que a estrutura do projeto seja igual á mencionada em `Visualização gráfica do ambiente de investigação`. Ou seja, é necessário que os ficheiros dados estejam presentes, nomeadamente os discos backup_disk.img, e charlied_disk.img. Recomenda-se ainda que a diretoria `Evidences/` esteja vazia.

De modo a automaticamente extrair todo o conteúdo dos discos,  basta correr o seguinte bash script `generateEvidences.sh`.

Correr na diretoria `Tools/`.

 **Modo de utilização:** [^6] [^7]
        
  ```bash
  bash generateEvidences.sh <arg>
  bash generateEvidences.sh -y 
  bash generateEvidences.sh -n 
  ```  

 [^6]: -y instala as ferramentas e extrai todas as provas para a diretoria `Evidences/`
 [^7]: -n Assume que já têm as ferramentas instaladas e extrai todas as provas para a diretoria `Evidences/`
        
 Após a execução deste comando, todas as evidências e provas serão armazenadas na diretoria `Evidences/`

   ---
  
  <h4 align="center"> • Grupo 47 • Ana Albuquerque 102209 • André Proença 102327 • Joel Russo 102098 •
</h4>

 ---
