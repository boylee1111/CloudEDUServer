

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0603 */
/* at Thu Jun 19 23:06:13 2014
 */
/* Compiler settings for ManagerPermATLCom.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 8.00.0603 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __ManagerPermATLCom_i_h__
#define __ManagerPermATLCom_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IPermCom_FWD_DEFINED__
#define __IPermCom_FWD_DEFINED__
typedef interface IPermCom IPermCom;

#endif 	/* __IPermCom_FWD_DEFINED__ */


#ifndef ___IPermComEvents_FWD_DEFINED__
#define ___IPermComEvents_FWD_DEFINED__
typedef interface _IPermComEvents _IPermComEvents;

#endif 	/* ___IPermComEvents_FWD_DEFINED__ */


#ifndef __PermCom_FWD_DEFINED__
#define __PermCom_FWD_DEFINED__

#ifdef __cplusplus
typedef class PermCom PermCom;
#else
typedef struct PermCom PermCom;
#endif /* __cplusplus */

#endif 	/* __PermCom_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IPermCom_INTERFACE_DEFINED__
#define __IPermCom_INTERFACE_DEFINED__

/* interface IPermCom */
/* [unique][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IPermCom;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D8E63B08-9F53-4139-ADE8-EE4FD5589369")
    IPermCom : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE PermCalculate( 
            /* [in] */ VARIANT_BOOL a_bFireEvent,
            /* [retval][out] */ LONG *a_lTotalPerms) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ComPerms( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ComPerms( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AtlPerms( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AtlPerms( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ManagerName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ManagerName( 
            /* [in] */ BSTR newVal) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IPermComVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IPermCom * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IPermCom * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IPermCom * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IPermCom * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IPermCom * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IPermCom * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IPermCom * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *PermCalculate )( 
            IPermCom * This,
            /* [in] */ VARIANT_BOOL a_bFireEvent,
            /* [retval][out] */ LONG *a_lTotalPerms);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ComPerms )( 
            IPermCom * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ComPerms )( 
            IPermCom * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AtlPerms )( 
            IPermCom * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AtlPerms )( 
            IPermCom * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ManagerName )( 
            IPermCom * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ManagerName )( 
            IPermCom * This,
            /* [in] */ BSTR newVal);
        
        END_INTERFACE
    } IPermComVtbl;

    interface IPermCom
    {
        CONST_VTBL struct IPermComVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IPermCom_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IPermCom_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IPermCom_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IPermCom_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IPermCom_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IPermCom_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IPermCom_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IPermCom_PermCalculate(This,a_bFireEvent,a_lTotalPerms)	\
    ( (This)->lpVtbl -> PermCalculate(This,a_bFireEvent,a_lTotalPerms) ) 

#define IPermCom_get_ComPerms(This,pVal)	\
    ( (This)->lpVtbl -> get_ComPerms(This,pVal) ) 

#define IPermCom_put_ComPerms(This,newVal)	\
    ( (This)->lpVtbl -> put_ComPerms(This,newVal) ) 

#define IPermCom_get_AtlPerms(This,pVal)	\
    ( (This)->lpVtbl -> get_AtlPerms(This,pVal) ) 

#define IPermCom_put_AtlPerms(This,newVal)	\
    ( (This)->lpVtbl -> put_AtlPerms(This,newVal) ) 

#define IPermCom_get_ManagerName(This,pVal)	\
    ( (This)->lpVtbl -> get_ManagerName(This,pVal) ) 

#define IPermCom_put_ManagerName(This,newVal)	\
    ( (This)->lpVtbl -> put_ManagerName(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IPermCom_INTERFACE_DEFINED__ */



#ifndef __ManagerPermATLComLib_LIBRARY_DEFINED__
#define __ManagerPermATLComLib_LIBRARY_DEFINED__

/* library ManagerPermATLComLib */
/* [version][uuid] */ 


EXTERN_C const IID LIBID_ManagerPermATLComLib;

#ifndef ___IPermComEvents_DISPINTERFACE_DEFINED__
#define ___IPermComEvents_DISPINTERFACE_DEFINED__

/* dispinterface _IPermComEvents */
/* [uuid] */ 


EXTERN_C const IID DIID__IPermComEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("94603AC0-64D2-4E75-A677-80824E973842")
    _IPermComEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct _IPermComEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            _IPermComEvents * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            _IPermComEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            _IPermComEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            _IPermComEvents * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            _IPermComEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            _IPermComEvents * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            _IPermComEvents * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        END_INTERFACE
    } _IPermComEventsVtbl;

    interface _IPermComEvents
    {
        CONST_VTBL struct _IPermComEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define _IPermComEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define _IPermComEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define _IPermComEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define _IPermComEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define _IPermComEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define _IPermComEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define _IPermComEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* ___IPermComEvents_DISPINTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_PermCom;

#ifdef __cplusplus

class DECLSPEC_UUID("244EE4AF-3919-4E1E-9DB4-BDD7BC13FFDB")
PermCom;
#endif
#endif /* __ManagerPermATLComLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


