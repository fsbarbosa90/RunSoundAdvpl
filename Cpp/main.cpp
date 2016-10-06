#include "main.h"
#include <stdio.h>
#include <windows.h>
#include <windowsx.h>
#include <mmsystem.h>


#ifdef DLLDIR_EX
#define DLLDIR  __declspec(dllexport)
#else
#define DLLDIR  __declspec(dllimport)
#endif

int DLL_EXPORT  ExecInClientDLL(int ID, CHAR* _Parameters, CHAR* _Buffer, int _SizeBuffer )
{
    sndPlaySound(_Parameters,SND_ASYNC);
    return TRUE;
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
    switch (fdwReason)
    {
    case DLL_PROCESS_ATTACH:
    // attach to process
    // return FALSE to fail DLL load
    break;
    case DLL_PROCESS_DETACH:
    // detach from process
    break;
    case DLL_THREAD_ATTACH:
    // attach to thread
    break;
    case DLL_THREAD_DETACH:
    // detach from thread
    break;
}

return TRUE; // succesful

}

