# Digital Forensic Report

## Authors 

<p align="justify"> 
	
	• André Proença • Ana Albuquerque • Joel Russo
</p>

---

## Appendix

- Digital Forensics Report;
- Estrutura da investigação;
- Artefatos de evidência;
- Ferramentas externas usadas para obter as provas;
- Provas descobertas;
- Procedimentos para a obtenção das provas descobertas;
- Itens auxiliares;
- Automatização de extração de provas e inspeção de ficheiros;

---

## Digital Forensics Report



**1. Do you find any traces of the documents that Mr. Daniels claims to have in his possession? Present your findings explaining the procedure you followed to retrieve these documents.**

> <p align="justify"> 
> Através da análise realizada, adquirimos todas as 5 (cinco) provas que estavam escondidas. Das 5 (cinco) provas, apenas 3 (três) comprovam que de facto houve transferência de dinheiro.</p>
> </p>
> <p align="justify"> 
> O “Club Statement”, um ficheiro pdf que estava escondido na imagem ticket.jpg (obtido usado a ferramenta foremost) que evidencia que houve um acordo quando efetuada a transferência de 72,000,000€ (setenta e dois milhões de euros) ao clube. É de elevada importância reter que o Sr.Velucci assinou este documento mesmo tendo a direção relevado um enorme desagrado.
> </p>
> <p align="justify"> 
> Nos ficheiros hbfs.wav e chants1.wav estavam escondidas a quarta (4ª) e quinta (5ª) pistas descobertas: 2 ficheiros pdf. O primeiro descreve um extrato bancário em como no dia 09/06/2021 Levy Fran Velucci transferiu 3 milhões de euros para a sua conta bancária. O segundo é uma declaração em como o presidente do grupo The Red Hawks FC não concorda com a transferência do jogador. Este menciona a prestação de James Santos e relembra como este influencia positivamente o clube,
> </p>
> <p align="justify"> 
> Os detalhes à cerca das ferramentas usadas para obtenção das provas, as provas descobertas e os procedimentos para a obtenção das mesmas, podem ser encontradas no relatório nas respetivas secções. (Ver apêndice)
> </p>    
> Podemos então concluir que o Mr. Daniels tem em sua posse documentos que provam que houve desvio de dinheiro.
> </p>

#

**2.	In case you found any relevant documents, what can you learn from them at this point? Do they support the original hypothesis of Mr. Velucci's fraudulent actions put forth by Mr. Daniels?**
> <p align="justify"> 
> Embora nem todas as evidências provem que efetivamente houve desvio de dinheiro, todas as evidencias que encontrámos são relevantes. Conseguimos obter através do ficheiro daft_punk.gif o ficheiro James_Santos_profile.pdf que ilustra o perfil do jogador. Este mostra os detalhes da Premiere League Record, os Honours & Howards tanto da Young Player of the Season como da Premiere League Champion. Descobrimos ainda um documento confidencial cujo título é “Internal Comunication” que afirma que o jogador influencia positivamente o clube e que talvez o valor de pagamento duplique dentro de 3 a 6 meses. Descobriu-se também que a password do ficheiro chants.zip é “Wichita”. 
> </p>
> <p align="justify"> 
> Ao interpretar os ficheiros pdf obtidos com um script concluímos que o presidente do grupo The Red Hawks FC não pretendia que o jogador saísse do clube, devido à sua grandiosa prestação, e que houve efetivamente desvio de dinheiro (como pode ser comprovado pelo extrato bancário). O “Club Statement”, um ficheiro pdf que estava escondido na imagem ticket.jpg, evidencia que houve um acordo quando foi efetuada a transferência de 72,000,000€ (setenta e dois milhões de euros) ao clube. Significa que o presidente do clube assinou este documento, mesmo após a discordância de membros superiores da organização. 
> </p>
> <p align="justify"> 
> Em suma, as últimas 3 (três) provas, “Club Statement”, “STATEMENT OF ACCOUNT” e “Official Supporters Statement”, suportam a hipótese original de que houve indícios de ações fraudulentas.
> </p>

#
              
**3.	From the analysis of all provided artifacts, what else have you learned? Present every interesting insight you may have gained, e.g., about the potential identity of involved stakeholders, sources of leakage, skill level of the individuals responsible for the leakage, etc.**

> <p align="justify"> 
> Tendo em conta todas as pistas que encontramos é possível retirar algumas conclusões sobre o que aprendemos. Exercitámos técnicas de esteganografia que consiste em ocultar a existência de uma mensagem dentro de outra, desenvolvemos competências no que toca à interpretação perante a existência de várias provas nomeadamente qual a relação entre as mesmas, quais relevam efetivamente indícios de crime. Felizmente, o investigador Charles Daniels alegou e publicou no seu blogue a sua suspeita de que Sr.Velucci estava envolvido em ações fraudulentas. Devido à perspicácia deste investigador foi-nos possível ter acesso à sua pen drive e consequentemente ter acesso a todas as evidencias mencionadas em respostas anteriores. Os crimes deste tipo de ações são bastante frequentes, especialmente quando se trata de jogadores bastante bem qualificados como é o caso do jogador James Santos. </p>
> <p align="justify">  
> Podemos analisar com mais detalhe a estratégia do presidente do clube: este tentou, ilegalmente, com que o jogador fosse transferido para outro clube, ocultando a declaração que demonstra a satisfação com a prestação do jogador e o descontentamento com a aceitação da transferência do mesmo. Satisfatoriamente, nesta carta direcionada ao Sr.Velucci, é possível comprovar que a empresa irá lutar pelos seu direitos e não deixar que a ganância prevaleça em detrimento do ato correto.
> </p>

#

**4.	Based on your findings, suggest the next steps you would take to pursue this investigation.**
> <p align="justify"> 
> Comprovada a existência de documentos incriminadores do Sr.Velucci, é agora necessário investigar a veracidade dos mesmos. Por exemplo, investigando diretamente o Sr.Velluci, obtendo um mandato de um juiz caso este concorde que as provas obtidas são suficientes para que se proceda com o processo. Numa tentativa de obter mais evidências, seria uma boa ideia  procurar também provas de pessoas em redor do presidente. Uma vez que ainda nos encontramos numa fase inicial da investigação e tendo obtido recentemente os documentos referidos pelo Sr.Daniels é ainda muito cedo para incriminar o Sr.Velluci. Por estes motivos achamos que a investigação deve continuar.
> </p>
                
---

## Estrutura da investigação

Organizámos a investigação por diretorias. 
Todas as provas descobertas são guardadas na diretoria `Evidences/`.
Todas as ferramentas usadas para a descobertas de provas (scripts, programas, etc...) são guardadas na diretoria `Tools/`.

**Visualização gráfica do ambiente de investigação:**[^1]

        
```
csf-lab1-artifacts
       └─── Evidences
		└─── HexdumpFiles (Opcional, se correr o comando inspectFiles.sh)
			└─── *_hexdump.txt 

		└─── StringFiles (Opcional, se correr o comando inspectFiles.sh)
			└─── *_Strings.txt 

		└─── club_statement.pdf
		└─── chant1.wav
		└─── internal_comunication.pdf
		└─── chantsZipPassword.txt
		└─── James_Santos_profile.pdf
		└─── hbfs-lsb2-2.txt
		└─── chant1-lsb2-4.txt
		└─── statement_of_account.pdf	  
		└─── official_supporters_statement.pdf		

	└─── Tools
		└─── generateEvidences.sh
		└─── inspectFiles.sh
		└─── hbfsRecover.sh
		└─── chants1Recover.sh
		└─── crackChantsZip.py
		└─── recoverWav.py
		└─── SNA_Lyrics_words.txt
		└─── words.txt
		└─── tool
		└─── tool.py

	Nota: Não estão incluídos no zip. 
	      Devem ser incluídos para correr os ficheiros de automatização

	└─── chants.zip
	└─── daft_punk.gif
	└─── discovery.jpg
	└─── hbfs.wav
	└─── homework.jpg
	└─── ram.jpg
	└─── SNA_Football_Lyrics.mp4
	└─── ticket.jpg
```        
[^1]: O caractere * representa cada um dos ficheiros dados.

---

## Artefatos de evidência

| Artefacto                        | MD5                              | Descrição
|:--------------------------------:|:--------------------------------:|:--------------------------------:
|club_statement.pdf                | e02839232a2283ac0843de8ecfc980a0 | pdf extraído de ticket.jpg
|chant1.wav                        | 91a0fa4cf25edf1365a3cfece6bbf586 | wav extraído de chants.zip
|internal_comunication.pdf         | 50066842298a5d1e434e37dee372a48a | pdf extraído de chants.zip
|chantsZipPassword.txt             | bd38890d51f93f852bd86af2c59b8fe9 | password crakeada de chants.zip
|James_Santos_profile.pdf          | 44d015d11ecd0ec4ecaa6cb350032d17 | pdf extraído de daft_punk.gif
|statement_of_account.pdf          | 2be65457105ca324381952538fc94de7 | pdf extraído chant1.wav
|official_supporters_statement.pdf | 33bd1f8ed5f5692c5bf1e5a87d6110b2 | pdf extraído de hbfs.wav

---

## Ferramentas externas usadas para obter as provas

• `foremost` • `exiftool` • `fcrackzip` • `tool` • `strings` • `hexdump` • `decompile3` •


---

## Provas descobertas

`5/5` segredos encontrados

| Ficheiros Dados | Segredo
|:---------------:|:---------------------------------------:
|ticket.jpg       | club_statement.pdf    
|daft_punk.gif    | James_Santos_profile.pdf
|chants.zip       | internal_comunication.pdf, chant1.wav
|hbfs.wav         | official_supporters_statement.pdf
|chant1.wav       | statement_of_account.pdf

---

## Procedimentos para a obtenção das provas descobertas

Antes de iniciar qualquer procedimento inspecionámos cada ficheiro dado com o comando hexdump e strings.

Encontrámos artefactos relevantes para a investigação nos ficheiros que se seguem.

### 🔍 ticket.jpg

**Ferramenta**: `foremost`  
Extrai ficheiros escondidos dentro de outros ficheiros.
É um programa que recupera ficheiros com base nos seus cabeçalhos, rodapés e estruturas de dados internas.


**Modo de extração**
```bash
foremost -i ticket.jpg -o Evidences/ticket

-i corresponde ao input file
-o corresponde output file
``` 

Ao executar este comando foi criada uma pasta com o nome ticket dentro da diretoria Evidences/ticket que contém:

    > 2 sub pastas 
        > uma para as imagens com a extensão .jpg
        > outra para ficheiro com a extensão .pdf
    > 1 ficheiro audit.txt que contém as informações dos ficheiros obtidos 

Ao executar este comando foi extraído o ficheiro 00000154.pdf, que depois foi renomeado para club_statement.pdf e removida a diretoria Evidences/ticket
  
### 🔍 daft_punk.gif
 
**Ferramenta**: `exiftool`

Lê os metadados de um ficheiro  
Ex:
+ Geolocalização de uma imagem
+ Tamanho de um ficheiro

**Modo de extração**
```bash
exiftool -comment daft_punk.gif -b > Evidences/file.zip && unzip Evidences/file.zip

-[tag] dá como output apenas a tag escolhida, neste caso "comment"
-b fornece o output em formato binário para garantir a formatação
   quando fizer o redirecionamento (>) para um ficheiro 
&& unzip (extrai o .zip)
``` 
Ao executar este comando foi extraído o ficheiro pdf James_Santos_profile.pdf


### 🔍 chants.zip
 
**Ferramenta**: `fcrackzip`  
Faz a extração de um zip protegido com password

**Modo de extração**
```bash
fcrackzip -u -D -p Tools/SNA_Lyrics_words.txt chants.zip

-u tenta extrair com a password da wordlist
-D seleciona a extração por wordlist
-p corresponde à wordlist a usar na extração
``` 
A password do ficheiro **chants.zip** é descoberta através de uma wordlist criada com todas as palavras da música **Seven Nation Army** dos **The White Stripes**. 

Foi criado o ficheiro **SNA_Lyrics_words.txt** na diretoria `Tools/` que contêm todas as palavra da música uma palavra por linha do ficheiro.
Em alternativa podia ter sido usado o ficheiro **words.txt** da diretoria `Tools/` que contêm 479k palavras do alfabeto inglês para crakear a password.

Usando qualquer um dos ficheiros acima mencionados descobrimos a password.

Ao fazer unzip obtemos dois ficheiros na diretoria `Evidences/chant2` e `Evidences/chant1.wav`. O ficheiro chant2 foi renomeado para internal_comunication.pdf

**Password** = `Wichita`

### 🔍 hbfs.wav

**Ferramenta**: `strings`  
Imprime a sequência de caracteres printable de ficheiros.

**Inspeção do ficheiro**
```bash
strings hbfs.wav
```
Ao inspecionarmos este ficheiro wav verificámos que a última string era um hyperlink para a ferramenta `tool`, útil para
a descoberta de ficheiros escondidos em ficheiros wav.

**string** = `https://bit.ly/39jit4x`

**Ferramenta**: `tool`  
Ciber-Segurança Forense - Instituto Superior Técnico / Universidade Lisboa  
LSB steganography tool: hide files within least significant bits of mono (1 channel) wav sound files.  

```bash
./tool hide <wav_file> <payload_file> <n_lsb> [password]

<wav_file> o ficheiro wav onde esconder
<payload_file> o ficheiro a esconder
<n_lsb> o número associado ao lsb onde a mensagem foi escondida
[password] (opcional) No caso de ser opcional a password é "0"
```

### 🔍 Decode da tool

**Ferramenta**: `github.com/rocky/python-decompile3`  

Para originar o source code do executável tool, usámos a ferramenta decompile3.
O nome da tool foi alterado para tool.pyc e de seguida foi descompilado para um ficheiro tool.py

**Decode**
```bash
mv tool tool.pyc
decompyle3 tool.pyc > tool.py
```

Deste modo foi possível analisar o source code da ferramenta tool.


### 🔍 Extração de payload de hbfs.wav

**Ferramenta**: `recoverWav.py` 

Sabemos que foi usada a tool para esconder um ficheiro pdf usando os parametros: n_lsb = 2[^3] e password = 2[^3].

[^3]: Sabemos que n_lsb = 2 e password = 2, através de força bruta com o script **hbfsRecover.sh**.

Através do script recoverWav.py recuperámos o ficheiro pdf escondido, executando o script recoverWav.py com os seguintes parametros:
```bash
python3 recoverWav.py recover hbfs.wav 2 2
```
Originou um ficheiro lsb2-2.txt
De seguida usámos a ferramenta `foremost` para extrair qualquer documento presente no ficheiro lsb2-2.txt, e encontrámos o ficheiro statement_of_account.pdf.

**Modo de extração**
```bash
python3 recoverWav.py recover hbfs.wav 2 2
mv lsb2-2.txt hbfs-lsb2-2.txt
foremost -i hbfs-lsb2-2.txt -o hbfs-lsb2-2
``` 


### 🔍 Extração de payload de chant1.wav

**Ferramenta**: `recoverWav.py` 

Sabemos que foi usada a tool para esconder um ficheiro pdf usando os parametros: n_lsb = 2[^4] e password = 4[^4].

[^4]: Sabemos que n_lsb = 2 e password = 4, através de força bruta com o script **chant1Recover.sh**.

Através do script recoverWav.py recuperámos o ficheiro pdf escondido, executando o script recoverWav.py com os seguintes parametros:
```bash
python3 recoverWav.py recover chant1.wav 2 4
```
Originou um ficheiro lsb2-4.txt
De seguida usámos a ferramenta `foremost` para extrair qualquer documento presente no ficheiro lsb2-4.txt, e encontrámos o ficheiro official_supporters_statement.pdf.

**Modo de extração**
```bash
python3 recoverWav.py recover chant1.wav 2 4
mv lsb2-4.txt chant1-lsb2-4.txt
foremost -i chant1-lsb2-4.txt -o chant1-lsb2-4
``` 

---

## Itens auxiliares

• `generateEvidences.sh`
- Bash script que automatiza todo o processo de obtenção de segredos. Com apenas um comando é possível extrair o pdf do ficheiro ticket.jpg,
  o pdf James_Santos_profile.pdf do ficheiro daft_punk.gif, crackear o zip com a wordlist SNA_Lyrics_words.txt, fazer unzip do ficheiro chants.zip com a password descoberta, 
  e recuperar os ficheiros escondidos dentro dos ficheiros hbfs.wav e chant1.wav.
  Além disso é ainda possível instalar as ferramentas necessárias para a obtenção das provas.
  
 **Modo de utilização:** [^6] [^7]
  ```bash
  bash generateEvidences.sh <arg>
  bash generateEvidences.sh -y 
  bash generateEvidences.sh -n
  ```

• `inspectFiles.sh`
- Bash script que automatiza o processo de inspeção de ficheiros. Para cada ficheiro dado são aplicados os comandos `hexdump` e `strings`
  e são guardados os outputs nas respetivas diretorias `Evidences/HexdumpFiles/` e `Evidences/StringsFiles/`
  
  Para cada ficheiro são executados os seguintes comandos:
  
  ```bash
  hexdump -C file > Evidences/HexdumpFiles/file_hexdump.txt
  
  Strings file > Evidences/StringFiles/file_strings.txt
  ```
 
  Deste modo, a inspeção de ficheiros torna-se mais eficaz e organizada.
 
  **Modo de utilização:**
  ```bash
  bash inspectFiles.sh
  ```
  
• `crackChantsZip.py`
- Um script modelizado em Python que abre e extrai automaticamente o ficheiro **chants.zip** e o seu conteúdo para a diretoria `Evidences/` usando a password[^5] guardada no ficheiro `Evidences/chantsZipPassword.txt`

  [^5]: A password foi descoberta através da ferramenta `fcrackzip` e guardada no ficheiro `Evidences/chantsZipPassword.txt`

• `recoverWav.py`
- Python Script usado para extrair os segredos dos ficheiros wav.
  
  **Modo de utilização:**
  ```bash
  python3 recoverWav.py recover <wav_file> <n_lsb> [password]
  ```

• `tool`
- Ciber-Segurança Forense - Instituto Superior Técnico / Universidade Lisboa  
  LSB steganography tool: hide files within least significant bits of mono (1 channel) wav sound files.
  
• `tool.py`
- Source code da tool

• `hbfsRecover.sh`
- Bash script que recupera os ficheiros escondidos de hbfs.wav. Testa com força bruta todos os n_lsb e passwords possíveis de modo a extraír os ficheiros escondidos.
  O bash corre todas as combinações de n_lsb e passwords possíveis no script recoverWav.py
  
• `chants1Recover.sh`
- Bash script que recupera os ficheiros escondidos de chant1.wav. Testa com força bruta todos os n_lsb e passwords possíveis de modo a extraír os ficheiros escondidos.
  O bash corre todas as combinações de n_lsb e passwords possíveis no script recoverWav.py

• `words.txt`
- Wordlist que contêm 479k palavras do alfabeto inglês.

• `SNA_Lyrics_words.txt`
- Wordlist que contêm todas as palavra da música **Seven Nation Army** dos **The White Stripes** uma palavra por linha do ficheiro.

---

## Automatização de extração de provas e inspeção de ficheiros

**Nota**: Para correr os ficheiros seguintes de automatização, é necessário que a estrutura do projeto seja igual á mencionada em `Visualização gráfica do ambiente de investigação`. Ou seja, é necessário que os ficheiros dados estejam presentes.

De modo a automaticamente extrair todos os segredos e evidências dos ficheiros dados basta correr o seguinte bash script `generateEvidences.sh`.

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
 
 Para inspecionar automaticamente todos os ficheiros dados de uma só vez,  basta correr o seguinte bash script `inspectFiles.sh`
 
 Correr na diretoria `Tools/`.
 
  **Modo de utilização:**
  ```bash
  bash inspectFiles.sh
  ```
  Após a execução deste comando, para cada ficheiro dado são aplicados os comandos `hexdump` e `strings`
  e guardados os outputs nas respetivas diretorias `Evidences/HexdumpFiles/` e `Evidences/StringsFiles/`.
  
---
