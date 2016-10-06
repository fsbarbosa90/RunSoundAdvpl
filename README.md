# RunSoundAdvpl
Classe em advpl para emitir no protheus, através de uma DLL C++


#Descricao
Classe para emitir o som de forma simples no prothues.



#Exemplo de Uso

//FUNÇÃO PARA EMITIR SOM
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