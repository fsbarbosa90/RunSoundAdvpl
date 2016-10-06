#Include 'Protheus.ch'


/*------------------------------------------------------------------------------+
| FONTE : RunSound         |AUTHOR: FERNANDO BARBOSA        | DATA:06/07/2016   |
+-------------------------------------------------------------------------------+
| DESCRICAO | REALIZAR A EMISSAO DE SOM NO PROTHEUS                             |
|           |                                                                   |
|           |                                                                   |
|           |                                                                   |
+-------------------------------------------------------------------------------+
|ALTERACOES |                                                                   |
|           |                                                                   |
|           |                                                                   |
|           |                                                                   |
+-------------------------------------------------------------------------------+*/

#Define SOUNDERRO1 'erro.wav'
#Define SOUNDERRO2 'erro2.wav'
#Define SOUNDREFRE 'f5.wav'
#Define SOUNDEND   'fim.wav'
#Define SOUNDEND2  'fim2.wav'
#Define SOUNDBEEP  'ok.wav'

#Define DLL 'RunSound/RunSound.dll'

Class RunSound
**************

   Data handle
   Data fault
   Data dir      

	Method New()	           /* CRIA O OBJETO      */
	Method Instance()          /* INSTANCIA O OBJETO */
	Method Distroy()           /* DISTROI O OBJETO   */
	Method Execute(cFile)      /* EXECUTA A DLL      */
	
	Method GetWarning()        /* PEGA A MENSAGEM ERRO*/
	
	/*-----------+
	| SOM PADRÃO |
	+------------+*/
	Method ErrorOne()      	/* SOM DE ERRO UM     */
	Method ErrorTwo()      	/* SOM DE ERRO DOIS   */
	Method Refresh()       	/* SOM DE ATUALIZACAO */
	Method Beep()          	/* SOM DE BEEP        */
	Method TheEnd()	  	/* SOM DE FINAL       */
	Method TheEndTwo()	/* SOM DE FINAL       */

End Class

/*--------------+
| CRIA O OBJETO |
+---------------+*/
Method New() Class RunSound
***************************
::handle := 0
::dir    := GetClientDir() +'runsound\' // LOCAL DA INSTALACAO DO SMARTCLIENT
::fault  := "" 
Return Self

/*-----------------------+
| PEG A MENSAGEM DE ERRO |
+------------------------+*/
Method GetWarning() Class RunSound
**********************************
Return IIF(::fault != Nil , ::fault , "")

/*----------------+
| INSTANCIA A DLL |
+-----------------+*/
Method Instance() Class RunSound
*********************************
Local lRet := .T.

::handle  := ExecInDllOpen(DLL) 

if ::handle < 0
    lRet := .F.
    ::fault := "Falha ao criar objeto de audio [RUNSOUND]"
EndIf

Return lRet

/*--------------+
| DESTROY A DLL |
+---------------+*/
Method Distroy() Class RunSound
*******************************
Local lRet := .F.

if ::handle < 0
    ::fault := "Som não foi criado [RUNSOUND]"
Else
    lRet := .T.
    ExecInDLLClose(::handle)
    
EndIf

Return lRet

/*--------------+
| EXECUTA A DLL |
+---------------+*/
Method Execute(cFile) Class RunSound
************************************
Local lRet    := .F. 

Default cFile := "" 

If !Empty(cFile) .And. File(cFile) 
    ExeDllRun3( ::handle, 1, @cFile)     
    sleep(100)
    lRet := .T.
Else
    ::fault := "Arquivo " + AllTrim(cFile) + " não foi localizado [RUNSOUND]"        
EndIf

Return lRet


/*----------------------------------------------------------------------+
| ABAIXO ALGUNS SOM QUE JA DEIXEI COMO PADRÃO PARA FACILITAR O PROCESSO |
+-----------------------------------------------------------------------+ 
/*----------------+
| SOM DE ERRO UM  |
+-----------------+*/
Method ErrorOne() Class RunSound  
********************************
Return (::Execute(::dir + SOUNDERRO1))
  
/*------------------+
| SOM DE ERRO DOIS  |
+-------------------+*/ 
Method ErrorTwo() Class RunSound   
********************************
Return (::Execute(::dir + SOUNDERRO2)) 
  
/*-------------------+
| SOM DE ATUALIZACAO |
+--------------------+*/
Method Refresh() Class RunSound   
********************************
Return (::Execute(::dir + SOUNDREFRE)) 
   
/*------------+
| SOM DE BEEP |
+-------------+*/
Method Beep() Class RunSound    
****************************
Return (::Execute(::dir + SOUNDBEEP))
     
/*-------------+
| SOM DE FINAL |
+--------------+*/
Method TheEnd()Class RunSound	     
*****************************
Return (::Execute(::dir + SOUNDEND)) 
     
/*---------------+
| SOM DE FINAL 2 |
+----------------+*/
Method TheEndTwo()Class RunSound	     
*********************************
Return (::Execute(::dir + SOUNDEND2)) 