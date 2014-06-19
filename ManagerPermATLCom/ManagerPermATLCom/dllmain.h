// dllmain.h : Declaration of module class.

class CManagerPermATLComModule : public ATL::CAtlDllModuleT< CManagerPermATLComModule >
{
public :
	DECLARE_LIBID(LIBID_ManagerPermATLComLib)
	DECLARE_REGISTRY_APPID_RESOURCEID(IDR_MANAGERPERMATLCOM, "{E9DDE6E8-31DA-44DD-A105-F133138D6831}")
};

extern class CManagerPermATLComModule _AtlModule;
