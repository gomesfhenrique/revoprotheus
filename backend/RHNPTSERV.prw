#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWIZARD.CH"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FILEIO.CH"
#INCLUDE "AP5MAIL.CH"

//Declara��o das STRS
#define STR0001 "MEU RH - Diagn�stico do ambiente"
#define STR0002 "Verifica��o e an�lise do ambiente do MEU RH"
#define STR0003 "Checagem de dados e servi�os necess�rios para o funcionamento do MEU RH"
#define STR0004 "Ser� realizada uma an�lise da configura��o do usu�rio e do ambiente conforme os dados informados informados em tela. Ao final do processamento ser� gerado um log com as informa��es validadas, incluindo alertas e n�o-conformidades, al�m de fornecer orienta��es para auxiliar na solu��o das situa��es encontradas."
#define STR0005 "Selecione o tipo de an�lise que ser� efetuada"
#define STR0006 "Ser�o avaliadas as configura��es do ambiente e a base de dados"
#define STR0007 "Dados do Usu�rio"
#define STR0008 "Dados do Servidor"
#define STR0009 "Servi�os Meu RH"
#define STR0010 "Informe de Rendimentos"
#define STR0011 "Recibo de Pagamento"
#define STR0012 "Gest�o de F�rias"
#define STR0013 "Informe o CPF e a Senha do funcion�rio"
#define STR0014 "CPF"
#define STR0015 "SENHA"
#define STR0016 "Confirmar"
#define STR0017 "Fechar"
#define STR0018 "SELECIONE O SERVI�O"
#define STR0019 "OK"
#define STR0020 "Existe n�o-conformidade!"
#define STR0021 "Desabilitada"
#define STR0022 "Habilitada"
#define STR0023 "SERVI�O REST"
#define STR0024 "Porta REST"
#define STR0025 "Seguran�a do Servi�o"
#define STR0026 "Habilitado"
#define STR0027 "Desabilitado"
#define STR0028 "SERVER -"
#define STR0029 "A pasta com os arquivos do Meu RH n�o est� na raiz do Protheus. Isso afeta o funcionamento da rotina 'Esqueci minha senha'."
#define STR0030 "PROPERTIES_JSON -"
#define STR0031 "A porta do servi�o REST"
#define STR0032 "n�o est� contido na URL do atributo 'baseUrl'."
#define STR0033 "O atributo 'rootContext' n�o est� informado dentro de duas barras (//)."
#define STR0034 "O atributo 'rootContext' n�o est� informado ou n�o possui conte�do v�lido."
#define STR0035 "A empresa indicada no atributo 'rootContext'"
#define STR0036 "est� divergente de"
#define STR0037 "indicada sess�o:"
#define STR0038 "do arquivo APPSERVER.INI"
#define STR0039 "Nenhuma inst�ncia do Meu RH foi encontrada nesse ambiente!"
#define STR0040 "N�o foi poss�vel obter os dados. Verifique se o arquivo existe ou se os dados est�o corretos."
#define STR0041 "O complemento da URL no atributo 'baseUrl'
#define STR0042 "Inst�ncias Meu RH:"
#define STR0043 "Status"
#define STR0044 "URL do Servi�o Meu RH"
#define STR0045 "URL do Servi�o REST."
#define STR0046 "Pasta Raiz do Protheus"
#define STR0047 "Pasta Arquivos Meu RH"
#define STR0048 "Arquivo Properties.json"
#define STR0049 "de"
#define STR0050 "O execut�vel 'printer.exe' n�o foi localizado na pasta do APPSERVER. Isso afeta a gera��o de todos os arquivos PDF (Informes, Recibos e Espelho de Ponto)."
#define STR0051 "In�cio do LOG"
#define STR0052 "N � O - C O N F O R M I D A D E S"
#define STR0053 "A L E R T A S"
#define STR0054 "Observa��o: N�o-conformidades impedem o funcionamento do sistema!"
#define STR0055 "Observa��o: Alertas podem n�o impedir o funcionamento do sistema, mas podem impactar no resultado esperado."
#define STR0056 "DADOS DO AMBIENTE"
#define STR0057 "Vers�o"
#define STR0058 "Build"
#define STR0059 "Build DBA"
#define STR0060 "Build LIB"
#define STR0061 "Environment/Release"
#define STR0062 "Par�metros verificados no Meu RH"
#define STR0063 "Data de rotinas utilizadas no Meu RH"
#define STR0064 "T�rmino do LOG"
#define STR0065 "Normal"
#define STR0066 "Transferido"
#define STR0067 "Demitido"
#define STR0068 "Afastado"
#define STR0069 "F�rias"
#define STR0070 "PARTICIPANTE -"
#define STR0071 "N�o existe o campo (RD0_FILRH) no Cadastro de Participantes."
#define STR0072 "Funcion�rio n�o possui v�nculo no Cadastro de Participantes."
#define STR0073 "O campo"
#define STR0074 "A filial do campo"
#define STR0075 "no Cadastro de Participantes � diferente da filial do funcion�rio"
#define STR0076 "N�o existe o campo"
#define STR0077 "USUARIO_PORTAL -"
#define STR0078 "O usu�rio:"
#define STR0079 "informado no Cadastro de Participantes n�o possui Usu�rio Interno informado na tabela de usu�rios do SIGATCF - Campo"
#define STR0080 "PERMISSAO -"
#define STR0081 "N�o existe nenhuma permiss�o habilitada para o usu�rio"
#define STR0082 "na tabela de permiss�es do Meu RH (Tabela RJD)"
#define STR0083 "Apenas os servi�os essenciais est�o dispon�veis. Se n�o estiver correto, verifique as permiss�es do usu�rio"
#define STR0084 "A tabela de permiss�es do Meu RH n�o existe no M�dulo SIGATCF (Tabela RJD)""
#define STR0085 "V�nculo:"
#define STR0086 "Dados do funcion�rio"
#define STR0087 "Filial"
#define STR0088 "Matr�cula"
#define STR0089 "C�digo Participante"
#define STR0090 "Situa��o do Funcion�rio"
#define STR0091 "Resultado"
#define STR0092 "Cadastro Participantes"
#define STR0093 "Cadastro Usu�rios"
#define STR0094 "Login Meu RH"
#define STR0095 "Cadastro Permiss�es"
#define STR0096 "Servi�os habilitados para este funcion�rio"
#define STR0097 "Nenhum funcion�rio localizado com o CPF:"
#define STR0098 "N�o informado"
#define STR0099 "da Tabela AI3"
#define STR0100 "n�o est� informado no Cadastro de Participantes"
#define STR0101 "Porta HTTP"
#define STR0102 "A porta HTTP n�o est� contida na URL da inst�ncia do Meu RH"
#define STR0103 "A URL da inst�ncia do Meu RH n�o possui complemento ap�s a porta HTTP"
#define STR0104 "informado no Cadastro de Participantes n�o foi localizado na tabela de usu�rios do SIGATCF - Tabela AI3"
#define STR0105 "Servi�o ainda n�o dispon�vel!"
#define STR0106 "Aten��o"
#define STR0107 "Se��o E-mail"
#define STR0108 "Se��o E-mail n�o encontrada no seu AppServer.Ini"
#define STR0109 "Dados de E-mail"
#define STR0110 "Par�metro MV_EMCONTA n�o est� configurado"
#define STR0111 "Par�metro MV_EMSENHA n�o est� configurado"
#define STR0112 "Par�metro MV_RELSERV n�o est� configurado"
#define STR0113 "O Documento a seguir orienta na configura��o dos e-mails/workflows"
#define STR0114 "O par�metro MV_RELAUTH est� habilitado. Nesse caso o servidor SMTP usar� autentica��o"
#define STR0115 "O par�metro MV_RELAUTH est� desabilitado. Nesse caso o servidor SMTP n�o usar� autentica��o"
#define STR0116 "Email Para:"
#define STR0117 "N�o foi poss�vel enviar o email para o destinat�rio."
#define STR0118 "Informe o email de destino."
#define STR0119 "N�o foi poss�vel se conectar no servidor SMTP. Verifique se o usu�rio(Email) e senha est�o corretos."
#define STR0120 "Teste de email enviado com sucesso."
#define STR0121 "Testando conex�o SMTP e evio de email."
#define STR0122 "Par�metro existe na base de dados."
#define STR0123 "Par�metro n�o existe na base de dados."
#define STR0124 "Documenta��o: "
#define STR0300 "Dados de Workflow"
#define STR0301 "O sistema ir� avaliar se est� correto o v�nculo do funcion�rio e o respectivo participante ao qual ele est� relacionado. Ser� verificado tamb�m se existe alguma inconsist�ncia no Cadastro do Participante para acesso ao Meu RH."
#define STR0302 "O sistema ir� avaliar a configura��o do Servidor REST e verificar se existe alguma inconsist�ncia nas inst�ncias do servi�o do Meu RH. Ser�o avaliados tamb�m os arquivos de configura��o de cada inst�ncia (PROPERTIES.JSON)."
#define STR0303 "O sistema ir� executar uma valida��o de requisi��o para o servi�o selecionado, para verificar se existe alguma inconsist�ncia na requisi��o. Ser� necess�rio informar um usu�rio e senha v�lidos."
#define STR0304 "O sistema ir� avaliar a configura��o do Workflow e verificar se existe alguma inconsist�ncia nas inst�ncias do servi�o do Meu RH."


//Marcelo - Novas strings a partir do 200
#define STR0200 "Data/Hora:"
#define STR0201 "Grupo de empresa:"
#define STR0202 "Filial:"
#define STR0203 "O arquivo:"
#define STR0204 "N�o foi localizado no 'rootpath' desse ambiente."
#define STR0205 "Sem essa informa��o n�o ser� poss�vel criar o relacionamento entre o funcion�rio e o participante, e o acesso ao Meu RH n�o ser� poss�vel."
#define STR0206 "Para mais informa��es consulte o(s) link(s) abaixo:"
#define STR0207 "O v�nculo entre o funcion�rio e o participante n�o foi localizado na tabela 'Pessoas x Entidades' do Meu RH (Tabela RDZ)"
#define STR0208 "Dados do v�nculo Funcion�rio x Partipante"
#define STR0209 "Entidade"
#define STR0210 "C�digo da Entidade"
#define STR0211 "Filial da Entidade"
#define STR0212 "C�digo Usu�rio Portal"
#define STR0213 "C�digo Filial Usu�rio Portal"

//Fabio - Novas strings a partir do 300
#define STR0300 ""

//Elaine - Novas strings a partir do 400
#define STR0400 ""

/*/
{Protheus.doc} RHNPTSERV()
Fun��o principal respons�vel por apresentar o Wizard para diagn�stico do ambiente do Meu RH
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		
/*/
User Function RHNPTSERV()
Local oWizard, oPanel
Local nTipo   := 1
Local aTipos  := {OemToAnsi(STR0007), OemToAnsi(STR0008),OemToAnsi(STR0109), OemToAnsi(STR0009)} //"Dados do Usu�rio" # "Dados do Servidor" # "Servi�os Meu RH"
Private oSay
Private lClose       := .T.
Private lRelease25	:= GetRpoRelease() >= "12.1.025"
Private lRelease27   := GetRpoRelease() >= "12.1.027"
DEFINE WIZARD oWizard TITLE OemToAnsi(STR0001) ; //"MEU RH - Teste de Servi�os"
       HEADER OemToAnsi(STR0002) ; //"Verifica��o e teste dos servi�os do MEU RH"
       MESSAGE OemToAnsi(STR0003) ; //"Checagem de dados e dos servi�os necess�rios para o funcionamento do MEU RH"
       TEXT OemToAnsi(STR0004) ; //"Ser�o realizados testes de acesso e conectividade a partir dos dados informados e da configura��o do ambiente"
       NEXT {|| .T.} ;
       FINISH {|| .T. } ;
       PANEL

   // Segunda etapa
   CREATE PANEL oWizard ;
          HEADER OemToAnsi(STR0005) ; //"Selecione o Tipo de an�lise que ser� efetuada"
          MESSAGE OemToAnsi(STR0006) ; //"Ser�o avaliados a configura��o do ambiente e a base de dados"
          BACK {|| .T. } ;
          NEXT {|| .F. } ;
          FINISH {|| U_RHNPTLOG(nTipo), lClose } ;
          PANEL
   oPanel := oWizard:GetPanel(2)
   @ 30,20 RADIO oTipo VAR nTipo ITEMS aTipos[1],aTipos[2],aTipos[3],aTipos[4] SIZE 65,8 ;
      PIXEL OF oPanel ON CHANGE fGetDetail(oPanel,nTipo)
   fGetDetail(oPanel,nTipo)
ACTIVATE WIZARD oWizard CENTERED
Return
/*/
{Protheus.doc} fGetDetail()
Fun��o Respons�vel por exibir um texto com os detalhes que cada tipo de execu��o ir� processar
@author:	Marcelo Silveira
@since:		18/01/2021
@param:		oDlg - Objeto principal
            nOpc - C�digo da opera��o que est� sendo validada
/*/
Static Function fGetDetail(oDlg,nOpc)
Local cText := ""
Local oFont := TFont():New('Arial',,-11,.T.)

   If nOpc == 1
      cText := OemToAnsi(STR0301)
   ElseIf nOpc == 2
      cText := OemToAnsi(STR0302)
   ElseIf nOpc == 3
      cText := OemToAnsi(STR0303)
   Else
      cText := OemToAnsi(STR0304)
   EndIf
   //Elimina o objeto do �ltimo label
   FreeObj(oSay)
   //Exibe o label atual
   oSay:= TSay():Create(oDlg,{|| cText },80,20,,oFont,,,,.T.,,,260,60)
   //Alinha o texto do label (H = 3 justificado, V = 0 Topo)
   oSay:SetTextAlign(3, 0)
Return
/*/
{Protheus.doc} RhNpTLog()
Fun��o Respons�vel por executar a chamada para cada opera��o que est� sendo validada
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		nOperation - C�digo da opera��o que est� sendo validada
/*/
User Function RhNpTLog(nOperation)
Local oButton1    := Nil
Local oButton2    := Nil
Local nService    := 0
Local cCPF        := Space(30)
Local cPwd        := Space(30)
Local cEmailTo    := Space(100)
Local aServices   := {OemToAnsi(STR0010), OemToAnsi(STR0011), OemToAnsi(STR0012)} //"Informe de Rendimentos" # "Recibo de Pagamento" # "Gest�o de Ferias"

DEFAULT nOperation   := 1
//Valida dados do Usu�rio
If nOperation == 1
   DEFINE DIALOG oDlg TITLE OemToAnsi(STR0013) FROM 0,0 TO 150,400 PIXEL //"Informe o CPF e a Senha do funcion�rio"
   @ 10,15 SAY OemToAnsi(STR0014) SIZE 25,8 PIXEL OF oDlg //"CPF"
   @ 20,15 MSGET cCPF PICTURE "@R 999.999.999-99" SIZE 80,10 PIXEL OF oDlg

   @ 35,15 SAY OemToAnsi(STR0015) SIZE 25,8 PIXEL OF oDlg //"SENHA"
   @ 45,15 MSGET cPwd PASSWORD SIZE 80,10 PIXEL OF oDlg

   @ 20,120 BUTTON oButton1 PROMPT "&"+OemToAnsi(STR0016) ; //Confirmar
   ACTION ( GETFUNDATA(cCPF,cPwd), oDlg:End() ) SIZE 70,15 OF oDlg  PIXEL WHEN (!Empty(cCPF))

   @ 40,120 BUTTON oButton2 PROMPT "&"+OemToAnsi(STR0017) ; //"Fechar"
   ACTION (oDlg:End(), lClose := .F. ) SIZE 70,15 OF oDlg  PIXEL

   ACTIVATE DIALOG oDlg CENTER

//Valida a configura��o do ambiente
ElseIf nOperation == 2

   GETSRVDATA()
// Valida dados do servidor de e-mail.
ElseIf nOperation == 3
   DEFINE DIALOG oDlg TITLE OemToAnsi(STR0118) FROM 0,0 TO 150,400 PIXEL //"Informe o email de destino.

   @ 35,15 SAY OemToAnsi(STR0116) SIZE 25,8 PIXEL OF oDlg //"EMAIL"
   @ 45,15 MSGET cEmailTo SIZE 80,10 PIXEL OF oDlg

   @ 20,120 BUTTON oButton1 PROMPT "&"+OemToAnsi(STR0116) ; //Email Para:
   ACTION ( fMRhMail(cEmailTo), oDlg:End() ) SIZE 70,15 OF oDlg  PIXEL WHEN (!Empty(cEmailTo))

   @ 40,120 BUTTON oButton2 PROMPT "&"+OemToAnsi(STR0017) ; //"Fechar"
   ACTION (oDlg:End(), lClose := .F. ) SIZE 70,15 OF oDlg  PIXEL

   ACTIVATE DIALOG oDlg CENTER
//Valida os servi�os do MEU RH
Else
   lClose := .F.
   DEFINE DIALOG oDlg TITLE OemToAnsi(STR0013) FROM 0,0 TO 300,410 PIXEL //"Informe o CPF e a Senha do funcion�rio"
   @ 10,15 SAY OemToAnsi(STR0014) SIZE 25,8 PIXEL OF oDlg //"CPF"
   @ 20,15 MSGET cCPF PICTURE "@R 999.999.999-99" SIZE 80,10 PIXEL OF oDlg

   @ 35,15 SAY OemToAnsi(STR0015) SIZE 25,8 PIXEL OF oDlg //"SENHA"
   @ 45,15 MSGET cPwd PASSWORD SIZE 80,10 PIXEL OF oDlg

   @ 65,15 TO 140, 190 LABEL OemToAnsi(STR0018) OF oDlg PIXEL //"SELECIONE O SERVICO"

   @ 85,35 RADIO oTipo VAR nService ITEMS aServices[1],aServices[2],aServices[3] SIZE 65,8 PIXEL OF oDlg

   @ 20,120 BUTTON oButton1 PROMPT "&"+OemToAnsi(STR0016) ; //"Confirmar"
   ACTION ( MsgInfo( OemToAnsi(STR0105), OemToAnsi(STR0106)) ) SIZE 70,15 OF oDlg  PIXEL //"Servi�o ainda n�o dispon�vel!" # "Aten��o"
   @ 40,120 BUTTON oButton2 PROMPT "&"+OemToAnsi(STR0017) ; //"Fechar"
   ACTION (oDlg:End(), lClose := .F. ) SIZE 70,15 OF oDlg  PIXEL

   ACTIVATE DIALOG oDlg CENTER

EndIf

RETURN

/*/{Protheus.doc} GetSrvData()
- Fun��o Respons�vel por validar os dados do Servidor
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		
/*/
Static Function GetSrvData()

Local cRootCnt    := ""
Local cCompURL    := ""
Local cURLREST    := ""
Local cPath       := ""
Local cURL        := ""
Local cStatus     := ""
Local cRestPort   := ""
Local cHttPort    := ""
Local cTempURL    := ""
Local cSecurity   := ""
Local cCnt        := ""
LOCAL cOk         := OemToAnsi(STR0019) //"OK"
LOCAL cErr        := OemToAnsi(STR0020) //"Existe n�o-conformidade!"
Local cPrint      := "printer.exe"
Local nX          := 0
Local nY          := 0
Local nCnt        := 0
Local nCont       := 0
Local nPos        := 0
Local nCol        := 0
Local nNumInst    := 0
Local lArqProp    := .T.
Local aArqProp    := {}
Local aIdREST     := {}
Local aEnvREST    := {}
Local aIdSession  := {}
Local aSession    := {}
Local aInfoINI    := {}
Local aLog        := {}
Local aLogG       := {}
Local aErr        := {}
Local aErrG       := {}
Local aWarn       := {}
Local aWarnG      := {}
Local cRoot       := GetSrvProfString("RootPath", '')

aInfoINI := fGetAppInfo()

//Identifica e avalia os environments REST
For nX := 1 To Len(aInfoINI)
   
   //Obtem a Porta do servi�o HTTP
   If "[HTTP]" == UPPER(aInfoINI[nX,1]) 
      If UPPER(aInfoINI[nX,2]) == "PORT"
         cHttPort := aInfoINI[nX,3]
      EndIf
   EndIf

   //Obtem dados do servi�o REST
   If "HTTPREST" $ UPPER(aInfoINI[nX,1]) 
      
      //Obtem os environments
      If "URIS" $ UPPER(aInfoINI[nX,2]) 
         aIdREST := STRTOKARR( aInfoINI[nX,3], "," )
      EndIf

      //Obtem a Porta REST
      If UPPER(aInfoINI[nX,2]) == "PORT"
         cRestPort := aInfoINI[nX,3]
      EndIf

      If UPPER(aInfoINI[nX,2]) == "SECURITY"
         cSecurity := aInfoINI[nX,3]
      EndIf
   EndIf
Next nX

For nX := 1 To Len(aIdREST)
   
   For nY := 1 To Len(aInfoINI)
      
      If UPPER(aIdREST[nX]) $ UPPER(aInfoINI[nY,1]) .And. (UPPER(aInfoINI[nY,2]) == "URL" .Or. UPPER(aInfoINI[nY,2]) == "PREPAREIN")
         
         nPos	:= aScan( aEnvREST, {|x| x[1] == UPPER(aInfoINI[nY,1])} )
         nCol  := If( UPPER(aInfoINI[nY,2]) == "URL", 2, 3 )

         //Considera a URL e somente o grupo do PREPAREIN
         If nPos > 0
            aEnvREST[nPos,nCol] := If( nCol == 3, StrTokArr(aInfoINI[nY,3], "," )[1], aInfoINI[nY,3] )
         Else
            aAdd( aEnvREST, { UPPER(aInfoINI[nY,1]), "", "" } )
            aEnvREST[Len(aEnvREST),nCol] := If( nCol == 3, StrTokArr(aInfoINI[nY,3], "," )[1], aInfoINI[nY,3] )
         EndIf
      EndIf

   Next nY

Next nX
//Identifica e avalia as se��es do Meu RH
For nX := 1 To Len(aInfoINI)
   If UPPER(aInfoINI[nX,2]) == "INSTANCENAME" .And. UPPER(aInfoINI[nX,3]) == "MEURH"
      aAdd( aIdSession, UPPER(aInfoINI[nX,1]) )
   EndIf
Next nX

For nX := 1 To Len(aIdSession)
   
   For nY := 1 To Len(aInfoINI)
      
      If UPPER(aInfoINI[nY,1]) == aIdSession[nX] .And. (UPPER(aInfoINI[nY,2]) == "PATH" .Or. UPPER(aInfoINI[nY,2]) == "ENABLE")
         nPos	:= aScan( aSession, {|x| x[1] == UPPER(aInfoINI[nY,1])} )
         nCol  := If( UPPER(aInfoINI[nY,2]) == "PATH", 2, 3 )
         If nPos > 0
            aSession[nPos,nCol] := aInfoINI[nY,3]
         Else
            aAdd( aSession, { UPPER(aInfoINI[nY,1]), "", "" } )
            aSession[Len(aSession),nCol] := aInfoINI[nY,3]
         EndIf
      EndIf

   Next nY

Next nX

nNumInst := Len(aSession)

If nNumInst > 0

   cSecurity := If( Empty(cSecurity) .Or. cSecurity == "0", OemToAnsi(STR0021), OemToAnsi(STR0022) ) //"Desabilitada" # "Habilitada"
   aAdd( aLog, { "" })
   aAdd( aLog, { OemToAnsi(STR0023) }) //"SERVI�O REST"
   aAdd( aLog, { OemToAnsi(STR0101) + Replicate(".", 24-Len(STR0101)) + ": " + cHttPort }) //Porta HTTP
   aAdd( aLog, { OemToAnsi(STR0024) + Replicate(".", 24-Len(STR0024)) + ": " + cRestPort }) //Porta REST
   aAdd( aLog, { OemToAnsi(STR0025) + Replicate(".", 24-Len(STR0025)) + ": " + cSecurity }) //Seguran�a do servi�o

   For nX := 1 To nNumInst

      lArqProp := .T.
      nCnt     := 0
      cURL     := SubStr( aSession[nX,1], 2, Len(aSession[nX,1])-2 )
      cStatus  := If( aSession[nX,3] == "1", OemToAnsi(STR0026), OemToAnsi(STR0027) ) //"Habilitado" # "Desabilitado"

      If nX > 1
         aAdd( aLog, { "" })
         aAdd( aLog, { Replicate(".", 27) }) //"........................... "
      Else
         aAdd( aLog, { "" })
      EndIf
      //Verifica se o local dos arquivos do Meu RH est�o dentro do rootpath
      If !(cRoot $ aSession[nX,2])
         //"SERVER -" # "A pasta com os arquivos do Meu RH n�o est� na raiz do Protheus. Isso afeta o funcionamento da rotina 'Esqueci minha senha'."
         aAdd( aWarn, {OemToAnsi(STR0028) +" "+ OemToAnsi(STR0029)} )
      EndIf

      //Verifica se existe algum erro na URL da inst�ncia do Meu RH
      If !Empty(cHttPort)

         cTempURL := fRemStr( AllTrim(aSession[nX,1]), "[]")
         nCont    := AT(cHttPort, cTempURL) + Len(cHttPort)
         //Verifica se a porta HTTP est� contida na URL
         If !cHttPort $ aSession[nX,1]
            //"SERVER -" # "A porta HTTP n�o est� contida na URL da inst�ncia do Meu RH."
            aAdd( aWarn, { OemToAnsi(STR0028) +" "+ OemToAnsi(STR0102) +" ("+ cTempURL +")."  })
         EndIf

         //Verifica se existe complemento ap�s a porta HTTP (Ex.: 127.0.0.1:1234/T1 - Aqui o complemento � /T1)
         If Empty( SubStr(cTempURL, nCont) )
            //"SERVER -" # "A URL da inst�ncia do Meu RH n�o possui complemento ap�s a porta HTTP"
            aAdd( aWarn, { OemToAnsi(STR0028) +" "+ OemToAnsi(STR0103) +" ("+ cTempURL +")."  })
         EndIF
      EndIf      
      //Obt�m os dados do arquivo Properties.json
      aArqProp := fGetProp(aSession[nX,2])
      //Valida poss�veis diverg�ncias entre a URL do PROPERTIES.JSON e o Appserver.ini
      If !Empty(aArqProp)
         cURLREST := aArqProp[1] //URL Servico REST
         cRootCnt := aArqProp[2]
         //Identifica a URL correspondente ao ambiente que est� sendo avaliado
         nPos := aScan( aEnvREST, { |x| x[2] ==  SubStr( cURLREST, (Len(cURLREST)-Len(x[2])) + 1 ) } ) 
         //Verifica se a porta do servi�o REST est� contida na URL do Arquivo Properties.json
         If !(cRestPort $ cURLREST)
            lArqProp := .F.
            aAdd( aErr, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0031) +" ("+ cRestPort + ") "+ OemToAnsi(STR0032) }) //"PROPERTIES_JSON -" # "A porta do servi�o REST" # "n�o est� contido na URL do atributo 'baseUrl'."
         EndIf

         If !Empty(cRootCnt)

            //Valida a quantidade de barras do atributo
            For nY := 1 To Len(cRootCnt)
               nCnt += If( Substr(cRootCnt, nY, 1) == "/", 1, 0)
            Next nY

            If nCnt < 2
               lArqProp := .F.
               aAdd( aErr, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0033) }) //"PROPERTIES_JSON -" # "O atributo 'rootContext' n�o est� informado dentro de duas barras (//)."
            EndIf
            
            //Verifica se existe conte�do valido al�m das barras
            cCnt := StrTran(cRootCnt, "/", "")
            If Empty( cCnt )
               aAdd( aWarn, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0034) }) //"PROPERTIES_JSON -" # "O atributo 'rootContext' nao esta informado ou n�o possui conte�do valido."
            Else
               //Verifica se o contexto do arquivo corresponde ao que esta indicado no appserver
               If nPos > 0 .And. !(cCnt == aEnvREST[nPos,3])
                  //"PROPERTIES_JSON -" # "A empresa indicada no atributo 'rootContext'" # "est� divergente de" # "indicada sess�o: # "do arquivo APPSERVER.INI"
                  aAdd( aWarn, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0035) + " (" + cCnt + ") " + OemToAnsi(STR0036) +" (" + aEnvREST[nPos,3] + ") " + OemToAnsi(STR0037) +" "+  aEnvREST[nPos,1] +" "+ OemToAnsi(STR0038) })
               EndIf
            EndIf
         Else
            aAdd( aWarn, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0034) }) //"PROPERTIES_JSON -" # "O atributo 'rootContext' n�o est� informado ou n�o possui conte�do v�lido."
         EndIf
      Else
         lArqProp := .F.
         aAdd( aErr, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0040) }) //"PROPERTIES_JSON -" # "N�o foi poss�vel obter os dados. Verifique se o arquivo existe ou se os dados est�o corretos."
      EndIf
      
      //Checa se existe diverg�ncia entre o complemento da URL REST com a URL do ambiente
      If nPos > 0
         cCompURL := SubStr( cURLREST, (Len(cURLREST)-Len(aEnvREST[nPos,2])) + 1 )
         If !cCompURL == aEnvREST[nPos,2]
            lArqProp := .F.
            //"PROPERTIES_JSON -" #O complemento da URL no atributo 'baseUrl'" # "est� divergente de" # "indicada sess�o:" # "do arquivo APPSERVER.INI"
            aAdd( aErr, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0041) +" ("+ cURLREST +") "+ OemToAnsi(STR0036) +" ("+ aEnvREST[nPos,2] +") "+ OemToAnsi(STR0037) +" "+ AllTrim(aEnvREST[nPos,1]) +" "+ OemToAnsi(STR0038) })
         EndIf
      Else
         lArqProp := .F.
         //"PROPERTIES_JSON -" # "O complemento da URL no atributo 'baseUrl'" # "est� divergente de" # "indicada sess�o:" # "do arquivo APPSERVER.INI"
         aAdd( aErr, { OemToAnsi(STR0030) +" "+ OemToAnsi(STR0041) +" ("+ cURLREST +") "+ OemToAnsi(STR0036) +" ("+ aEnvREST[nX,2] +") "+ OemToAnsi(STR0037) +" "+ AllTrim(aEnvREST[nX,1]) +" "+ OemToAnsi(STR0038) })
      EndIf
      aAdd( aLog, { OemToAnsi(STR0042) +" "+ cValToChar(nX) +" "+ OemToAnsi(STR0049) +" "+ cValToChar(nNumInst) }) //"Inst�ncias Meu RH: " # "de"
      aAdd( aLog, { "" })
      aAdd( aLog, { OemToAnsi(STR0043) + Replicate(".", 24-Len(STR0043)) + ": " + cStatus }) //"Status"
      aAdd( aLog, { OemToAnsi(STR0044) + Replicate(".", 24-Len(STR0044)) + ": " + cURL }) //"URL do Servi�o Meu RH"
      aAdd( aLog, { OemToAnsi(STR0045) + Replicate(".", 24-Len(STR0045)) + ": " + cURLREST }) //"URL do Servi�o REST"
      aAdd( aLog, { OemToAnsi(STR0046) + Replicate(".", 24-Len(STR0046)) + ": " + cRoot }) //"Pasta Raiz do Protheus"
      aAdd( aLog, { OemToAnsi(STR0047) + Replicate(".", 24-Len(STR0047)) + ": " + aSession[nX,2] }) //"Pasta Arquivos Meu RH"
      aAdd( aLog, { OemToAnsi(STR0048) + Replicate(".", 24-Len(STR0048)) + ": " + If( lArqProp, cOK, cErr) }) //"Arquivo Properties.json"

   Next nX
   //Verifica se o execut�vel da impressora est� na pasta do AppServer
   getAppPath(@cPath)

   If !File( cPath + "\" + cPrint )
      aAdd( aWarn, { OemToAnsi(STR0028) +" "+ OemToAnsi(STR0050) }) //"SERVER -" # "O execut�vel 'printer.exe' n�o foi localizado na pasta do APPSERVER. Isso afeta a gera��o de todos os arquivos PDF (Informes, Recibos e Espelho de Ponto)."
   EndIf

Else
   aAdd( aLog, { "" })
   aAdd( aLog, { "*** " + OemToAnsi(STR0039) + " ***" }) //Nenhuma inst�ncia do Meu RH foi encontrada nesse ambiente!
EndIf

aAdd( aLogG, {aLog} )
aAdd( aErrG, {aErr} )
aAdd( aWarnG, {aWarn} )

//Imprime o LOG
IMPLOG(aLogG, aWarnG, aErrG)

Return

/*/{Protheus.doc} GetFunData()
- Fun��o Respons�vel por validar os dados do funcion�rio a partir do CPF e senha do Meu RH
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		cIdFunc - CPF do funcion�rio
            cPwdFunc - Senha do Meu RH
/*/
Static Function GetFunData(cIdFunc, cPwdFunc)

Local nX             := 0
Local nY             := 0
Local nNumSRA        := 0

Local cMsg           := ""
Local cTitCpo        := ""
Local cUser          := ""
Local cUserID        := ""
Local cUserAI3       := ""
Local cFilAI3        := ""
Local cMsgErr        := ""
Local cSituacao      := ""
Local cOk            := OemToAnsi(STR0019) //"OK"
Local cErr           := OemToAnsi(STR0020) //"Existe n�o-conformidade!"
Local cPPAccess      := GetMv("MV_ACESSPP",,"")
Local cArqRDZ        := "MSRELRDZ.INI"
Local cPath          := GetSrvProfString("RootPath", '')

Local aRDZ           := {}
Local aFunc          := {}
Local aLog           := {}
Local aErr           := {}
Local aWarn          := {}
Local aLogG          := {}
Local aErrG          := {}
Local aWarnG         := {}
Local aServices      := {}

Local lDefault       := .F.
Local lCpoRD0        := .F.
Local lPwdOk         := .F.
Local lOkRD0         := .F.
Local lOkRJD         := .F.
Local lOkAI3         := .F.
Local lOkRDZ         := .F.

DEFAULT cIdFunc      := ""
DEFAULT cPwdFunc     := ""

lClose   := .T.
cIdFunc  := AllTrim(cIdFunc)
cPwdFunc := AllTrim(cPwdFunc)
If !File( cPath + "\" + cArqRDZ )
   cMsg := OemToAnsi(STR0070) +" "+ OemToAnsi(STR0203) +" '"+ cArqRDZ +"' " + OemToAnsi(STR0203) + " " //"O arquivo:" # "N�o foi localizado no 'rootpath' desse ambiente."
   cMsg += OemToAnsi(STR0205) //"Sem essa informa��o n�o ser� poss�vel criar o relacionamento entre o funcion�rio e o participante, e o acesso ao Meu RH n�o ser� poss�vel."
   cMsg += OemToAnsi(STR0206) //"Para mais informa��es consulte o(s) link(s) abaixo:"
   cMsg += CRLF
   cMsg += "=> https://tdn.totvs.com/x/ZMimHQ""
   cMsg += CRLF
   cMsg += "=> https://centraldeatendimento.totvs.com/hc/pt-br/articles/360059317533-MP-PORTAL-GCH-Arquivo-MSRELRDZ-ini"
   aAdd( aErr, { OemToAnsi(cMsg) }) 

EndIf

//Obtem os dados do Funcionario
aFunc := GetSRA(cIdFunc, cPwdFunc)

nNumSRA := Len(aFunc)

If nNumSRA > 0

   aAreaAtu := GetArea()

   lCpoRD0 := RD0->(ColumnPos("RD0_FILRH")) > 0

   For nX := 1 To nNumSRA

      cFilUSER := aFunc[nX, 1]
      cMatUSER := aFunc[nX, 2]
      //Situa��o do v�nculo
      Do Case
         Case Empty(aFunc[nX, 5]) .Or. aFunc[nX, 5] == " "
            cSituacao := OemToAnsi(STR0065) //"Normal"
         Case aFunc[nX, 5] == "T"
            cSituacao := OemToAnsi(STR0066) //"Transferido"
         Case aFunc[nX, 5] == "D"
            cSituacao := OemToAnsi(STR0067) //"Demitido"
         Case aFunc[nX, 5] == "A"
            cSituacao := OemToAnsi(STR0068) //"Afastado"
         Case aFunc[nX, 5] == "F"
            cSituacao := OemToAnsi(STR0069) //"F�rias"
      EndCase
      //Busca informa��es do Cadastro de Participantes
      dbSelectArea("RD0")
      RD0->( dbSetOrder(6) ) //RD0_FILIAL+RD0_CIC+RD0_CODIGO
      
      If RD0->( dbSeek( xFilial("RD0", cFilUSER) + cIdFunc ) )
         cFilAI3     := RD0->RD0_FILIAL
         cCodRD0     := RD0->RD0_CODIGO
         cLoginRD0   := AllTrim(RD0->RD0_LOGIN)
         cUserAI3    := RD0->RD0_PORTAL
         lOkRD0      := .T.

         If Empty( cUserAI3 )
            
            cTitCpo := fGetTitle("RD0_PORTAL")
            //"PARTICIPANTE -" # "O campo" # "n�o est� informado no Cadastro de Participantes"
            aAdd( aErr, { OemToAnsi(STR0070) +" "+ OemToAnsi(STR0073) +" '"+ cTitCpo +"' (RD0_PORTAL) " + OemToAnsi(STR0100) })
            lOkRD0 := .F.
         EndIf
      Else
         aAdd( aErr, { OemToAnsi(STR0070) +" "+ OemToAnsi(STR0072) }) //"PARTICIPANTE -" # "Funcion�rio n�o possui vinculo no Cadastro de Participantes"
         lOkRD0 := .F.
      EndIf

      //Verifica os dados da tabela RDZ
      If lOkRD0
         fGetRDZ(cFilUSER, cMatUSER, cCodRD0, @aRDZ)
         If Empty(aRDZ)
            //"PARTICIPANTE -" # "O v�nculo entre o funcion�rio e o participante n�o foi localizado na tabela 'Pessoas x Entidades' do Meu RH (Tabela RDZ)"
            aAdd( aErr, { OemToAnsi(STR0070) +" "+ OemToAnsi(STR0207) })
         Else
            lOkRDZ := .T.
         EndIf
      EndIf

      //Verifica a Filial do usuario do Portal que esta informada no cadastro de Participantes
      If lRelease27
         If lCpoRD0
            cFilAI3 := RD0->RD0_FILRH

            If Empty(RD0->RD0_FILRH)

               cTitCpo := fGetTitle("RD0_FILRH")

               //"PARTICIPANTE -" # "O campo" # "n�o est� informado no Cadastro de Participantes"
               aAdd( aWarn, { OemToAnsi(STR0070) +" "+  OemToAnsi(STR0073) +" '"+ cTitCpo +"' (RD0_FILRH) " + OemToAnsi(STR0100) })

            ElseIf !(cFilAI3 == cFilUSER)
               
               cTitCpo := fGetTitle("RD0_FILRH")
               //"PARTICIPANTE -" # "A filial do campo" # "no Cadastro de Participantes � diferente da filial do funcion�rio"
               aAdd( aWarn, { OemToAnsi(STR0070) +" "+ OemToAnsi(STR0074) +" '"+ cTitCpo +"' (RD0_FILRH = "+ AllTrim(cFilAI3) +") " + OemToAnsi(STR0075) + " ("+ AllTrim(cFilUSER) +")" })
            
            EndIf
         Else
            //"PARTICIPANTE -" # "N�o existe o campo (RD0_FILRH) no Cadastro de Participantes."
            aAdd( aWarn, { OemToAnsi(STR0070) +" "+ OemToAnsi(STR0071) })
         EndIf
      EndIf
      //Busca informa��es do usu�rio do portal
      If !Empty(cUserAI3)  
         dbSelectArea("AI3")
         AI3->(dbSetOrder(1))
         
         If !lCpoRD0
            If AI3->( dbSeek( xFilial("AI3") + cUserAI3) )
               cUserID := UsrRetName(AI3->AI3_USRSIS)
               lOkAI3  := .T.
            EndIf
         Else
            If AI3->( dbSeek( xFilial("AI3", cFilAI3) + cUserAI3) )
               cUserID := UsrRetName(AI3->AI3_USRSIS)
               lOkAI3  := .T.
            EndIf
         EndIf

         //Verifica se existe usu�rio interno do Protheus no usu�rio que est� vinculado ao participante
         If lOkAI3
            If Empty( cUserID )
               
               cTitCpo := fGetTitle("AI3_USRSIS")
               
               //"USUARIO_PORTAL -" # "O usu�rio" # "informado no Cadastro de Participantes n�o possui Usu�rio Interno informado na tabela de usu�rios do SIGATCF - Campo" # "da Tabela AI3"
               aAdd( aErr, { OemToAnsi(STR0077) +" "+ OemToAnsi(STR0078) +" ("+ cUserAI3 +") "+ OemToAnsi(STR0079) +" '"+ cTitCpo +"' (AI3_USRSIS) " + OemToAnsi(STR0099) })
               lOkAI3 := .F.
            Else
               //Verifica se o login foi realizado com sucesso
               cUser := If( !Empty(cLoginRD0), AllTrim(cLoginRD0), cIdFunc )
               UnifiedLoginRH(@lPwdOk, cUser, cPwdFunc, "2", cPPAccess, .T. ,,, @cMsgErr)
               If !lPwdOk
                  aAdd( aErr, { "LOGIN - " + cMsgErr })
               EndIf
            EndIf
         Else
            //"PARTICIPANTE -" # "O usu�rio" # "informado no Cadastro de Participantes n�o foi localizado na tabela de usu�rios do SIGATCF - Tabela AI3"
            aAdd( aErr, { OemToAnsi(STR0070) +" "+ OemToAnsi(STR0078) +" ("+ cUserAI3 +") "+ OemToAnsi(STR0104) })
            lOkRD0 := .F.
         EndIf
      EndIf

      //Busca informacoes de permiss�o das rotinas do Meu RH
      If lRelease25
         If AliasInDic("RJD") 
         
            If !Empty(cUserAI3)

               //Carrega lista de permissionamentos do usu�rio
               aServices := fAvalPermission(cFilUSER, cLoginRD0, cCodRD0)
               lOkRJD    := .T.

               If Empty(aServices)                  
                  //"PERMISSAO -" # "N�o existe nenhuma permiss�o habilitada para o usu�rio" # "na tabela de permiss�es do Meu RH (Tabela RJD)"
                  aAdd( aErr, { OemToAnsi(STR0080) +" "+ OemToAnsi(STR0081) +" ("+ cUserAI3 +") " + OemToAnsi(STR0082) })
                  lOkRJD := .F.
               EndIf
               //Verifica se foram carregados somente os servi�os b�sicos
               If lOkRJD .And. Len(aServices) == 3

                  For nY := 1 To Len(aServices)
                     If ( lDefault := !aServices[nY,1] $ "absenceManager||payment||annualReceipt" )
                        Exit                        
                     EndIf
                  Next nY

                  If lDefault
                     //"PERMISSAO -" # "Apenas os servi�os essenciais est�o dispon�veis. Se n�o estiver correto, verifique as permiss�es do usu�rio" # "na tabela de permiss�es do Meu RH (Tabela RJD)"
                     aAdd( aWarn, { OemToAnsi(STR0080) +" "+ OemToAnsi(STR0083) +" ("+ cUserAI3 +") "+ OemToAnsi(STR0082)  })
                  EndIf
               EndIf

            EndIf
         Else
            //"PERMISSAO -" # "A tabela de permiss�es do Meu RH n�o existe no M�dulo SIGATCF (Tabela RJD)""
            aAdd( aErr, { OemToAnsi(STR0080) +" "+ OemToAnsi(STR0084) })
            lOkRJD := .F.
         EndIf
      EndIf

      If nX > 1
         aAdd( aLog, { "" })
         aAdd( aLog, { Replicate(".", 30) }) //"..........................."
      EndIf

      aAdd( aLog, { "" })
      aAdd( aLog, { OemToAnsi(STR0085) +" "+ cValToChar(nX) +" "+ OemToAnsi(STR0049) +" "+ cValToChar(nNumSRA) }) //"V�nculo: " # "de"
      aAdd( aLog, { "" })
      aAdd( aLog, { "*** " + OemToAnsi(STR0086) }) //"Dados do funcion�rio"
      aAdd( aLog, { Replicate(".", 30) }) //"..........................."
      aAdd( aLog, { OemToAnsi(STR0087) + Replicate(".", 30-Len(STR0087)) + ": " + cFilUSER }) //"Filial"
      aAdd( aLog, { OemToAnsi(STR0088) + Replicate(".", 30-Len(STR0088)) + ": " + cMatUSER }) //"Matr�cula"
      aAdd( aLog, { OemToAnsi(STR0090) + Replicate(".", 30-Len(STR0090)) + ": " + cSituacao }) //Situa��o do Funcion�rio
      aAdd( aLog, { OemToAnsi(STR0089) + Replicate(".", 30-Len(STR0089)) + ": " + cCodRD0 }) //"C�digo Participante"
      aAdd( aLog, { OemToAnsi(STR0212) + Replicate(".", 30-Len(STR0212)) + ": " + cUserAI3}) //"C�digo Usu�rio Portal"

      If lCpoRD0
         aAdd( aLog, { OemToAnsi(STR0213) + Replicate(".", 30-Len(STR0213)) + ": " + cFilAI3}) //"C�digo Filial Usu�rio Portal"
      EndIf

      If lOkRDZ
         aAdd( aLog, { "" })
         aAdd( aLog, { "*** " + OemToAnsi(STR0208) }) //"Dados do v�nculo funcion�rio x Partipante"
         aAdd( aLog, { OemToAnsi(STR0209) + Replicate(".", 30-Len(STR0209)) + ": " + aRDZ[2] }) //"Entidade"
         aAdd( aLog, { OemToAnsi(STR0210) + Replicate(".", 30-Len(STR0210)) + ": " + aRDZ[3] }) //"C�digo da Entidade"
         aAdd( aLog, { OemToAnsi(STR0211) + Replicate(".", 30-Len(STR0211)) + ": " + aRDZ[4] }) //"Filial da Entidade"
      EndIf

      aAdd( aLog, { "" })
      aAdd( aLog, { "" })

      aAdd( aLog, { "*** " + OemToAnsi(STR0091) }) //"Resultado"
      aAdd( aLog, { Replicate(".", 27) }) // "..........................."
      aAdd( aLog, { OemToAnsi(STR0092) + Replicate(".", 30-Len(STR0092)) + ": " + If( lOkRD0, cOK, cErr) }) //"Cadastro Participantes"
      If lOkRD0
         aAdd( aLog, { OemToAnsi(STR0093) + Replicate(".", 30-Len(STR0093)) + ": " + If( lOkAI3, cOK, cErr) }) //"Cadastro Usu�rios"
      EndIf
      If lOkRDZ
         aAdd( aLog, { OemToAnsi(STR0095) + Replicate(".", 30-Len(STR0095)) + ": " + If( lOkRDZ, cOK, cErr) }) //Cadastro Funcionario x Participantes"
      EndIf      
      If lOkRD0 .And. lOkAI3
         aAdd( aLog, { OemToAnsi(STR0094) + Replicate(".", 30-Len(STR0094)) + ": " + If( lPwdOk, cOK, cErr) }) //"Login Meu RH"
      EndIf
      If lOkAI3
         aAdd( aLog, { OemToAnsi(STR0095) + Replicate(".", 30-Len(STR0095)) + ": " + If( lOkRJD, cOK, cErr) }) //Cadastro Permiss�es"
      EndIf
      
      If lOkAI3 .And. lOkRJD
         aAdd( aLog, { "" })
         aAdd( aLog, { "" })
         aAdd( aLog, { "*** " + OemToAnsi(STR0096) }) //"Servi�os habilitados para este funcion�rio"
         aAdd( aLog, { Replicate(".", 30) }) // "..........................."
         For nY := 1 To Len(aServices)
            aAdd( aLog, { "-> " + AllTrim(aServices[nY, 4]) })
         Next nY
      EndIf

      aAdd( aLogG, {aLog} )
      aAdd( aErrG, {aErr} )
      aAdd( aWarnG, {aWarn} )

      aLog  := {}
      aErr  := {}
      aWarn := {}

   Next nX

   RestArea(aAreaAtu)
Else
   aAdd( aLog, { "" })
   aAdd( aLog, { "*** " + OemToAnsi(STR0097) + Transform( cIdFunc, "@R 999.999.999-99" ) + " ***" }) //"Nenhum funcion�rio localizado com o CPF:"

   aAdd( aLogG, {aLog} )
   aAdd( aErrG, {aErr} )
   aAdd( aWarnG, {aWarn} )
EndIf

//Imprime o LOG
IMPLOG(aLogG, aWarnG, aErrG)

RETURN

/*/{Protheus.doc} fGetArq()
- Fun��o Respons�vel por retornar as datas das rotinas usadas no Meu RH
@author:	Marcelo Silveira
@since:		31/12/2020
@param:
/*/
User Function fGetArq()

Local nX       := 0
Local aRet     := {}
Local aTemp    := {}
Local aArqsMHR := {}

aArqsMHR := {  "GPEM580.PRX", ;
               "IMPIRPF.PRX", ;
               "PONXAPO.PRX", ;
               "PONXFUN.PRX", ;
               "RHNP01.PRW", ;
               "RHNP02.PRW", ;
               "RHNP03.PRW", ;
               "RHNP04.PRW", ;
               "RHNP04A.PRW", ;
               "RHNP05.PRW", ;
               "RHNP05A.PRW", ;
               "RHNP06.PRW", ;
               "RHNP06F.PRW", ;
               "RHNP07.PRW", ;
               "RHNP08.PRW", ;
               "RHNP09.PRW", ;
               "RHNPJOB.PRW", ;
               "RHNPLIB.PRW", ;
               "RHNPMEURH.PRW", ;
               "TCFA006.PRW", ;
               "TCFA040.PRW", ;
               "WSAPD014.PRW", ;
               "WSCLIENT_WSORGSTRUCTURE.PRX", ;
               "WSCLIENT_WSRHPAYMENTRECEIPTS.PRX", ;
               "WSCLIENT_WSRHREQUEST.PRX", ;
               "WSCFG034.PRX", ;
               "WSGPE010.PRW", ;
               "WSGPE020.PRW", ;
               "WSGPE030.PRW", ;
               "WSGPE040.PRW", ;
               "WSGPE080.PRW", ;
               "WSORG010.PRW", ;
               "WSPORTAL01.PRX", ;
               "APIGETSTRUCTURE.PRW" }

For nX := 1 To Len(aArqsMHR)
   aTemp := GetApoInfo(aArqsMHR[nX])
   If Len(aTemp) > 0
      aAdd( aRet, { ;
                     UPPER(aTemp[1]), ;
                     Transform( dToS(aTemp[4]), "@R 9999/99/99" ), ;
                     aTemp[5] } )
   EndIf
Next nX

Return( aRet )

/*/{Protheus.doc} fGetPar()
- Fun��o Respons�vel por retornar os dados de par�metros usados no Meu RH
@author:	Marcelo Silveira
@since:		31/12/2020
@param:
/*/
User Function fGetPar(cFilPar)

Local nX       := 0
Local cTemp    := ""
Local aRet     := {}
Local aParsMHR := {}
Local lRet     := .T.

//Parametro, Valor Default
aParsMHR := {  {"MV_ACESSPP",  "", "https://tdn.totvs.com/x/dNlc"}, ; //https://tdn.totvs.com/x/dNlc
               {"MV_DABERTO",   0, "https://tdn.totvs.com/x/cXBGIQ"}, ; //https://tdn.totvs.com/x/cXBGIQ
               {"MV_HASHVLD",  60, ""}, ; //N�o encontrei
               {"MV_POLSEG",    0, "https://tdn.totvs.com/x/7InUIQ"}, ; //https://tdn.totvs.com/x/7InUIQ
               {"MV_NVLAPR",  .F., "https://tdn.totvs.com/x/a6yGIQ"}, ; //https://tdn.totvs.com/x/a6yGIQ
               {"MV_TCFVREN", "N", "https://tdn.totvs.com/x/2lh9Ig"}, ; //https://tdn.totvs.com/x/2lh9Ig
               {"MV_MCIGUAL", "N", ""}, ;
               {"MV_HORASDE", "N", ""}, ;
               {"MV_PONMES",   "", ""}, ;
               {"MV_PAPONTA",  "", ""}, ;
               {"MV_DSOLFER",  30, ""}, ;
               {"MV_MRHFERP", .T., ""}, ; 
               {"MV_GETMAUT", "S", ""}, ;  
               {"MV_ORGCFG",  "0", ""}, ;
               {"MV_SOLICRP", "0", ""}, ;
               {"MV_DESPMIN", "0", ""}, ;
               {"MV_TCFBHVL", .F., ""}, ;
               {"MV_TCF013A", "01.02.03.04.05", ""}, ;
               {"MV_TCFDADT", "0", ""}, ;
               {"MV_TCFDFOL", "0", ""}, ;
               {"MV_TCFD131", "0", ""}, ;
               {"MV_TCFD132", "0", ""}, ;
               {"MV_TCFDEXT", "0", ""}, ; 
               {"MV_RELSERV", "", ""}, ;
               {"MV_EMCONTA", "", ""}, ;
               {"MV_EMSENHA", "", ""} }

For nX := 1 To Len(aParsMHR)
   
   cTemp := cValToChar( SuperGetMv(aParsMHR[nX,1],,aParsMHR[nX,2], cFilPar) )
   cTemp := If( Empty(cTemp), OemToAnsi(STR0098), cTemp ) //"N�o informado"
   lRet  := fMRhChkMv(aParsMHR[nX,1], cFilPar)
   aAdd( aRet, { ;
                  UPPER(aParsMHR[nX,1]), ;
                  cTemp, ;
                  Iif(lRet, OemToAnsi(STR0122), OemToAnsi(STR0123)), ;
                  aParsMHR[nX,3] } )
Next nX

Return( aRet )

/*/{Protheus.doc} fGetAppInfo()
- Fun��o Respons�vel por retornar os dados do arquivo de configura��o AppServer.ini
@author:	Marcelo Silveira
@since:		31/12/2020
@param:
/*/
Static function fGetAppInfo()

Local nX          := 0
Local nRet        := 0
Local nCont       := 0
Local cSession    := ""
Local cStrAux     := ""
Local cLines      := ""
Local cPath       := ""
Local cAsc        := ""
Local cNewLine    := ""
Local aSessions   := {}
Local lDeleted    := .F.
Local lIniSession := .F.
 
nRet := getAppPath(@cPath)

If nRet == 0

   cLines := MemoRead( cPath + "\" + GetADV97() )

   For nX := 1 To Len(cLines)
      
      cStrAux := SubStr(cLines, nX, 1)
      cAsc := Asc(cStrAux)

      If cStrAux == ";"
         lDeleted := .T.
      EndIf
      //N�o considera linhas deletadas e o retorno da linha
      If !lDeleted 
         
         If ( !(cAsc == 10) .And. !(cAsc == 13) )
            If cStrAux == "["            
               lIniSession := .T.
               cSession := cStrAux
            Else
               If lIniSession               
                  cSession += cStrAux

                  If cStrAux == "]"
                     aAdd( aSessions, { cSession, "", "" } )
                     lIniSession := .F.
                  EndIf
               Else
                  cNewLine += cStrAux
               EndIf
            EndIf
         Else
            If !Empty(cNewLine)
               nCont := AT("=", cNewLine) 
               aAdd( aSessions, { cSession, ;
                                  SubStr( cNewLine, 1, nCont-1 ), ;
                                  SubStr( cNewLine, nCont+1 ) } )
               cNewLine := ""
            EndIf
         EndIf
      EndIf
      //Reinicia a vari�vel para poder avaliar a pr�xima linha
      If lDeleted .And. cAsc == 10
         lDeleted := .F.
      EndIf

   Next nX
   
EndIf

Return(aSessions)

/*/{Protheus.doc} fGetProp()
- Fun��o Respons�vel por ler o conte�do do arquivo properties.json
@author:	Marcelo Silveira
@since:		31/12/2020
@param:     @cPathFile
/*/
Static Function fGetProp( cPathFile )

Local cJsonStr       := Nil
Local oJson          := Nil
Local aProp          := {}
Local aRet           := {}
Local cErr           := ""
Local cBaseUrl       := ""
Local cRootContext   := ""
Local cFile          := "properties.json"

//Faz a leitura do arquivo Properties.json
cJsonStr := MemoRead(cPathFile + "\" + cFile)

If !Empty(cJsonStr)
   // Cria o objeto JSON e popula ele a partir da string
   oJson := JSonObject():New()
   cErr  := oJSon:fromJson(cJsonStr)

   If Empty(cErr)
      aProp        := oJson:GetJSonObject('PROPS')
      cBaseUrl     := aProp["baseUrl"]
      cRootContext := aProp["rootContext"]

      If !Empty(cBaseUrl) .And. !Empty(cRootContext)
         aAdd( aRet, cBaseUrl )
         aAdd( aRet, cRootContext )
      EndIf

      FreeObj(oJson)
   EndIf

EndIf

Return( aRet )

/*/{Protheus.doc} GetSRA()
- Fun��o Respons�vel por retornar os dados do funcion�rio
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		cIdFunc - CPF do funcionario
            cPwdFunc - Senha do Meu RH
/*/
Static Function GetSRA(cIdFunc, cPwdFunc)

Local __cSRAtab      := ""
Local cAliasSRA      := ""
Local aFunc          := {}

DEFAULT cIdFunc      := ""
DEFAULT cPwdFunc     := ""

lClose   := .T.
cIdFunc  := AllTrim(cIdFunc)
cPwdFunc := AllTrim(cPwdFunc)

//Valida dados do Usuario
__cSRAtab 	:= "%" + RetFullName("SRA", cEmpAnt) + "%"

cAliasSRA  := GetNextAlias()

BeginSql ALIAS cAliasSRA

   SELECT 
      RA_FILIAL, RA_MAT, RA_CIC, RA_DEPTO, RA_NOME, RA_EMAIL, RA_SITFOLH
   FROM %exp:__cSRAtab% SRA
   WHERE 
      RA_CIC = %Exp:cIdFunc% AND 
      SRA.%notdel%

EndSql

While !(cAliasSRA)->(Eof())

   aAdd( aFunc, ;
         { ;
            (cAliasSRA)->RA_FILIAL, ;
            AllTrim( (cAliasSRA)->RA_MAT), ;
            AllTrim( (cAliasSRA)->RA_CIC), ;
            AllTrim( (cAliasSRA)->RA_EMAIL), ;
            AllTrim( (cAliasSRA)->RA_SITFOLH) ;
         })

   (cAliasSRA)->(dbSkip())
End

(cAliasSRA)->( DBCloseArea() )

Return(aFunc)

/*/{Protheus.doc} ImpLOG()
- Fun��o Respons�vel por gerar os LOGS do processamento
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		aLogG - Array com o LOG geral
            aWarnG - Array com o LOG geral de Alertas
            aErrG - Array com o LOG geral de Erros
/*/
Static Function ImpLOG(aLogG, aWarnG, aErrG)

Local cPath    := ""
Local cFileLog := ""

Local nX       := 0
Local nY       := 0
Local nErr     := 0
Local nWarn    := 0

Local aDataEnv := {}
Local aDataArq := {}
Local aDataPar := {}
Local aInfo    := {}

fInfo( @aInfo, cFilAnt )

//------------------------//
//GERACAO DO LOG FINAL----//
//------------------------//

AutoGrLog( OemToAnsi(STR0201) +" "+ AllTrim(aInfo[2]) +" / "+ OemToAnsi(STR0202) +" "+ AllTrim(aInfo[1]) ) //"Grupo de empresa:" # "Filial:"
AutoGrLog( OemToAnsi(STR0200) +" "+ cValToChar(dDatabase) +" - "+ cValToChar(Time()) ) //"Data/Hora:" #
AutoGrLog("") 
AutoGrLog("") 
AutoGrLog( OemToAnsi(STR0051) ) //"In�cio do LOG"

For nX := 1 To Len(aLogG)

   nErr  := Len(aErrG[nX, 1])
   nWarn := Len(aWarnG[nX, 1])

   For nY := 1 To Len( aLogG[nX, 1])
      AutoGrLog( aLogG[nX, 1, nY, 1] )
   Next nY

   If nErr > 0
      AutoGrLog("") 
      AutoGrLog("") 
      AutoGrLog( "*** " + OemToAnsi(STR0052) + " ***" )  //"N � O - C O N F O R M I D A D E S"
      For nY := 1 To nErr
         AutoGrLog("") 
         AutoGrLog( aErrG[nX, 1, nY, 1] )
      Next nY         
      AutoGrLog("") 
      AutoGrLog( OemToAnsi(STR0054) ) //"Observa��o: N�o-conformidades impedem o funcionamento do sistema!"
   EndIf

   If nWarn > 0
      AutoGrLog("") 
      AutoGrLog("") 
      AutoGrLog( "*** " + OemToAnsi(STR0053) + " ***" )  //A L E R T A S
      For nY := 1 To nWarn
         AutoGrLog("") 
         AutoGrLog( aWarnG[nX, 1, nY, 1] )
      Next nY        
      AutoGrLog("") 
      AutoGrLog( OemToAnsi(STR0055) ) //"Observa��o: Alertas podem n�o impedir o funcionamento do sistema, mas podem impactar no resultado esperado."
   EndIf

Next nX

//Dados do Ambiente
//------------------
aDataEnv := GetAPOInfo("aplib050.prw")
aDataArq := U_fGetArq()
aDataPar := U_fGetPar(cFilAnt)

AutoGrLog("")
AutoGrLog("")
AutoGrLog( "*** " + OemToAnsi(STR0056) + " ***" ) //DADOS DO AMBIENTE
AutoGrLog("")
AutoGrLog( OemToAnsi(STR0057) + Replicate(".", 20-Len(STR0057)) + ": " + GetVersao() ) //"Vers�o"
AutoGrLog( OemToAnsi(STR0058) + Replicate(".", 20-Len(STR0058)) + ": " + GetBuild() ) //"Build"
AutoGrLog( OemToAnsi(STR0059) + Replicate(".", 20-Len(STR0059)) + ": " + TCGetBuild() +" - "+ TCSrvType() ) //"Build DBA"
AutoGrLog( OemToAnsi(STR0060) + Replicate(".", 20-Len(STR0060)) + ": " + DTOS(aDataEnv[4]) ) //"Build LIB"
AutoGrLog( OemToAnsi(STR0061) + Replicate(".", 20-Len(STR0061)) + ": " + GetEnvServer() +" / "+ GetRPORelease() ) //Environment/Release
AutoGrLog("")
AutoGrLog( OemToAnsi(STR0062) ) //"Par�metros verificados no Meu RH"
For nX := 1 To Len(aDataPar)
   AutoGrLog( aDataPar[nX,1] + " => " + aDataPar[nX,2] + " => " + aDataPar[nX,3] + " => " + OemToAnsi(STR0124) + aDataPar[nX,4])
Next nX

AutoGrLog("")
AutoGrLog( OemToAnsi(STR0063) ) //"Data de rotinas utilizadas no Meu RH"
For nX := 1 To Len(aDataArq)
   AutoGrLog( aDataArq[nX,1] +" => "+ aDataArq[nX,2] +" - "+ aDataArq[nX,3] )
Next nX

AutoGrLog("")
AutoGrLog( OemToAnsi(STR0064) ) //"Termino do LOG"

cFileLog := NomeAutoLog()

If cFileLog <> ""
   MostraErro(cPath,cFileLog)
EndIf

Return()

/*/{Protheus.doc} fGetTitle()
- Fun��o Respons�vel por retornar o t�tulo de um campo da tabela SX3 conforme o idioma
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		cCpoSX3 - campo da tabela SX3
/*/
Static Function fGetTitle( cCpoSX3 )

Local cTit     := ""
Local aAreaSX3 := {}

DEFAULT cCpoSX3 := ""

If !Empty(cCpoSX3)
   aAreaSX3 := SX3->( GetArea() )

   dbSelectArea("SX3")
   dbSetOrder(2)
   
   If SX3->( dbSeek( cCpoSX3 ) )
      cTit := AllTrim( X3Titulo() )
   EndIf

   RestArea( aAreaSX3 )
EndIf

Return( cTit )

/*/{Protheus.doc} fAvalPermission()
- Fun��o Respons�vel por pesquisar e avaliar as permiss�es do usu�rio
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		cFilUSER - Filial do usu�rio
            cLoginRD0 - Login do Usu�rio
            cCodRD0 - C�digo do Participante
/*/
Static Function fAvalPermission(cFilUSER, cLoginRD0, cCodRD0)

Local nZ          := 0
Local aRet        := {}
Local aServices   := {}

DEFAULT cFilUSER  := ""
DEFAULT cLoginRD0 := ""
DEFAULT cCodRD0   := ""

If !Empty(cFilUSER) .And. !Empty(cLoginRD0) .And. !Empty(cCodRD0)
   aServices := fPermission(cFilUSER, cLoginRD0, cCodRD0)

   For nZ := 1 To Len(aServices)
      If aServices[nZ, 2] == "1"
         aAdd( aRet, aServices[nZ] )
      EndIf
   Next nX
EndIf

Return( aRet )

/*/{Protheus.doc} fRemStr()
- Fun��o Respons�vel por remover de uma string uma cadeia de caracteres
@author:	Marcelo Silveira
@since:		31/12/2020
@param:		cBase - String completa
            cRemove - Caracteres que ser�o removidos da string
/*/
Static Function fRemStr( cBase, cRemove )

Local nX    := 0
Local cRet  := ""
Local cFind := ""
Local cAux  := ""

DEFAULT cBase    := ""
DEFAULT cRemove  := ""

cAux := cBase

If !Empty(cBase) .And. !Empty(cRemove)
   For nX := 1 To Len( cRemove )
      cFind := SubStr( cRemove, nX, 1 )
      cAux  := StrTran( cAux, cFind, "")
   Next nX
   cRet := cAux
EndIf

Return( cRet )

/*/{Protheus.doc} fMRhMail()
- Respons�vel por checar se as configura��es de e-mail est�o habilitadas.
@author:	Henrique Ferreira
@since:		21/01/2021
@param:		
/*/
Static Function fMRhMail(cEmailTo)

Local lOk   := .F.
Local lSendOk := .F.
Local nX    := 0
Local aInfoINI := {}
Local aLog  := {}
Local aErr  := {}
Local aWarn := {}
Local aLogG := {}
Local aErrG := {}
Local aWarnG:= {}
Local cMailConta	:= SUPERGETMV("MV_EMCONTA")
Local cMailServer	:= SUPERGETMV("MV_RELSERV")
Local cMailSenha	:= SUPERGETMV("MV_EMSENHA")
Local lMailAuth   := SUPERGETMV("MV_RELAUTH")
Local cUsuario		:= ""
Local cAssunto    := OemToAnsi("Teste de envio de email.")
Local cMensagem   := OemToAnsi("Email enviado.")
Local cAttach     := ""


//Verifica se existe o SMTP Server
If Empty(cMailServer)
   aAdd( aWarn, { OemToAnsi(STR0112) })
EndIf

//Verifica se existe a CONTA 
If Empty(cMailConta)
   aAdd( aWarn, { OemToAnsi(STR0110) })
EndIf

//Verifica se existe a Senha
If Empty(cMailSenha) 
   aAdd( aWarn, { OemToAnsi(STR0111) })
EndIf

If Len(aWarn) > 0
   aAdd(aWarn, { OemToAnsi(STR0113) }) // "O Documento a seguir orienta na configura��o dos e-mails/workflows"
   aAdd(aWarn, { "https://tdn.totvs.com/pages/releaseview.action?pageId=271166884"})
EndIf

If lMailAuth
   aAdd(aLog, { OemToAnsi(STR0114) }) // O par�metro MV_RELAUTH est� habilitado. Nesse caso o servidor SMTP usar� autentica��o
Else
   aAdd(aLog, { OemToAnsi(STR0115) }) // O par�metro MV_RELAUTH est� desabilitado. Nesse caso o servidor SMTP n�o usar� autentica��o
EndIf

// Testa conex�o SMTP.
aAdd(aLog, { OemToAnsi(STR0121) }) // Testando conex�o SMTP e evio de email.
If !Empty(cMailServer) .AND. !Empty(cMailConta) .AND. !Empty(cMailSenha)
   cUsuario := SubStr(cMailConta,1,At("@",cMailConta)-1)
   CONNECT SMTP SERVER cMailServer ACCOUNT cMailConta PASSWORD cMailSenha RESULT lOk
   If lOk     
      If lMailAuth
         If !MailAuth(cMailConta,cMailSenha)
            If !MailAuth(cUsuario, cMailSenha)
               aAdd( aErr, { OemToAnsi(STR0113) })
            EndIf
         EndIf
      EndIf                                                                     
         SEND MAIL FROM cMailConta;
               TO cEmailTo;
               BCC cEmailTo;					
               SUBJECT cAssunto;
               BODY cMensagem;  
               ATTACHMENT cAttach;					
               RESULT lSendOk 
      If !lSendOk
         aAdd(aErr, { OemToAnsi(STR0117) }) // "N�o foi poss�vel enviar o email para o destinat�rio."
      Else
         aAdd(aLog, { OemToAnsi(STR0120) }) // "Teste de email enviado com sucesso.
      EndIf
      DISCONNECT SMTP SERVER
   Else
      aAdd(aErr, { OemToAnsi(STR0119) }) // "N�o foi poss�vel se conectar no servidor SMTP. Verifique se o usu�rio(Email) e senha est�o corretos."
   EndIf
EndIf   

aInfoINI := fGetAppInfo()

If Len(aInfoINI) > 0
   If ( nPos := aScan(aInfoINI, {|x| x[1] == "[MAIL]"}) ) > 0
      aAdd( aLog, { OemToAnsi(STR0107) }) //"Se��o email"
      For nX := nPos To Len(aInfoINI)
         If aInfoINI[nX,1] == "[MAIL]" .And. !Empty(aInfoINI[nX,2]) .And. !Empty(aInfoINI[nX,3])
            aAdd( aLog, { aInfoINI[nX,2] + " : " + "Valor: " + aInfoINI[nX,3] } )
         EndIf
      Next nX
   Else
      aAdd( aWarn, { OemToAnsi(STR0107) }) //"Se��o email"
      aAdd( aWarn, { OemToAnsi(STR0108) }) // "Se��o E-mail n�o encontrada no seu AppServer.Ini"
      aAdd( aWarn, { OemToAnsi(STR0113) }) // "O Documento a seguir orienta na configura��o dos e-mails/workflows"
      aAdd( aWarn, {"https://tdn.totvs.com/x/aopc"})
   EndIf
EndIf

aAdd( aLogG, {aLog} )
aAdd( aErrG, {aErr} )
aAdd( aWarnG, {aWarn} )

//Imprime o LOG
IMPLOG(aLogG, aWarnG, aErrG)

Return .T.

/*/{Protheus.doc} fGetRDZ()
- Fun��o Respons�vel por remover de uma string uma cadeia de caracteres
@author:	Marcelo Silveira
@since:		21/01/2021
@param:		cBase - String completa
            cRemove - Caracteres que serao removidos da string
/*/
Static Function fGetRDZ( cFilSRA, cMatSRA, cParticipantID, aUser )

Local _TabRD0        := ""
Local _TabRDZ        := "" 
Local _TabSRA        := ""
Local cWhere			:= ""
Local cQuery			:= GetNextAlias()

cWhere := "%"
cWhere += " AND SRA.RA_MAT = '" + cMatSRA + "'"
cWhere += "%"

_TabRD0 := "%" + RetFullName("RD0", cEmpAnt) + "%"
_TabRDZ := "%" + RetFullName("RDZ", cEmpAnt) + "%" 
_TabSRA := "%" + RetFullName("SRA", cEmpAnt) + "%"

BEGINSQL ALIAS cQuery
   COLUMN RA_ADMISSA AS DATE
   
   SELECT
      RDZ_CODRD0,
      RDZ_CODENT,
      RDZ_FILENT,
      RDZ_ENTIDA
   FROM %Exp:_TabRD0% RD0
   INNER JOIN %Exp:_TabRDZ% RDZ
   ON RDZ.RDZ_CODRD0 = RD0.RD0_CODIGO
   INNER JOIN %Exp:_TabSRA% SRA
   ON RTRIM(RDZ.RDZ_CODENT) = RTRIM( SRA.RA_FILIAL + SRA.RA_MAT )
   WHERE 
      RD0.RD0_FILIAL = %xFilial:RD0% AND
      RD0.RD0_CODIGO = %exp:cParticipantID% AND
      RD0.%notDel% AND
      RDZ.%notDel% AND
      SRA.%notDel%
      %exp:cWhere%
ENDSQL	

While (cQuery)->(!EoF())
   aAdd(aUser, (cQuery)->RDZ_CODRD0) 	         //1 - Codigo Participante
   aAdd(aUser, AllTrim((cQuery)->RDZ_ENTIDA)) 	//2 - Entidade
   aAdd(aUser, AllTrim((cQuery)->RDZ_FILENT)) 	//3 - Filial da Entidade
   aAdd(aUser, (cQuery)->RDZ_CODENT) 	         //4 - Entidade (Filial + Matricula)
      
	(cQuery)->(DBSkip())
EndDo

(cQuery)->(DBCloseArea())

Return()

/*/{Protheus.doc} fMRhChkMv()
- Respons�vel por checar se os MVs existem na SX6
@author:	Henrique Ferreira
@since:		21/01/2021
@param:		
/*/
Static Function fMRhChkMv(cParametro, cFil)

Local aArea := GetArea()
Local lRet := .T.

DbSelectArea("SX6")
dbSetOrder(1)
If !( dbSeek( xFilial("SX6", cFil) + cParametro) )
   lRet := .F.
EndIf

RestArea(aArea)
Return lRet

