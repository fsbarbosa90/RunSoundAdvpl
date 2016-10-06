#ifndef __MAIN_H__
#define __MAIN_H__
#include <windows.h>
#ifdef BUILD_DLL
#define DLL_EXPORT __declspec(dllexport)
#else
#define DLL_EXPORT __declspec(dllimport)
#endif
#ifdef __cplusplus

extern "C"
{
 #endif
int DLL_EXPORT  ExecInClientDLL(int ID, CHAR* _Parameters, CHAR* _Buffer, int _SizeBuffer);
 #ifdef __cplusplus
 }

#endif
 #endif // __MAIN_H__
