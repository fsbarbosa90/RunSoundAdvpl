# RunSoundAdvpl
Classe em advpl para emitir som / audio / musica no protheus, através de uma DLL C++ — 


#Descrição
Fonte em c++, e advpl, para poder emitir de forma facil som no prothues,
sem precisar executar via bat.

Os Fontes do c++ estão em anexo, mas para uso didatico, pois basta deixar a dll
em local de possivel acesso pela aplicação, normalmente dentro da pasta smartclient
da estação, e ajustar a classe RunSound.PRW para apontar para o caminho da DLL, e pronto.
Muito simples!!!


#Exemplo de Uso

User Function RunSoundC()
*************************
Local cSound	   := "C:\SOM\NOTIFY.MP3"

Local oSound       := RunSound():New()


//INSTANCIA PARA ABRIR A DLL

If !oSound:Instance()

    MsgStop(oSound:GetWarning())
	
    Return	
	
EndIf

//SOM CRIADOS COMO PADRÃO DENTRO DA CLASSE

If !oSound:ErrorOne() // EMITE UM BIP DE ERRO  

	MsgStop(oSound:GetWarning())

EndIf

If !oSound:TheEnd()  // SOM DE FINAL DE PROCESSO
  	
	MsgStop(oSound:GetWarning())

EndIf

//PASSANDO COMO PARAMETRO UM ARQUIVO DE AUDIO

If !oSound:Execute(cSound) 	

	MsgStop(oSound:GetWarning())

EndIf

//FECHA E LIBERA A DLL

If !oSound:Distroy()

	MsgStop(oSound:GetWarning())

EndIf

Return
