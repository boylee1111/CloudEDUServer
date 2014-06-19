// PermCom.h : Declaration of the CPermCom

#pragma once
#include "resource.h"       // main symbols



#include "ManagerPermATLCom_i.h"
#include "_IPermComEvents_CP.h"



#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif

using namespace ATL;


// CPermCom

class ATL_NO_VTABLE CPermCom :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CPermCom, &CLSID_PermCom>,
	public IConnectionPointContainerImpl<CPermCom>,
	public CProxy_IPermComEvents<CPermCom>,
	public IDispatchImpl<IPermCom, &IID_IPermCom, &LIBID_ManagerPermATLComLib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CPermCom()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_PERMCOM)


BEGIN_COM_MAP(CPermCom)
	COM_INTERFACE_ENTRY(IPermCom)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(IConnectionPointContainer)
END_COM_MAP()

BEGIN_CONNECTION_POINT_MAP(CPermCom)
	CONNECTION_POINT_ENTRY(__uuidof(_IPermComEvents))
END_CONNECTION_POINT_MAP()


	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK;
	}

	void FinalRelease()
	{
	}

public:



	STDMETHOD(PermCalculate)(VARIANT_BOOL a_bFireEvent, LONG* a_lTotalPerms);
	STDMETHOD(get_ComPerms)(LONG* pVal);
	STDMETHOD(put_ComPerms)(LONG newVal);
	STDMETHOD(get_AtlPerms)(LONG* pVal);
	STDMETHOD(put_AtlPerms)(LONG newVal);
	STDMETHOD(get_ManagerName)(BSTR* pVal);
	STDMETHOD(put_ManagerName)(BSTR newVal);
};

OBJECT_ENTRY_AUTO(__uuidof(PermCom), CPermCom)
