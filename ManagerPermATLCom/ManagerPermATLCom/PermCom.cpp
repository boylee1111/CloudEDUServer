// PermCom.cpp : Implementation of CPermCom

#include "stdafx.h"
#include "PermCom.h"


// CPermCom



STDMETHODIMP CPermCom::PermCalculate(VARIANT_BOOL a_bFireEvent, LONG* a_lTotalPerms)
{
	// TODO: Add your implementation code here
	*a_lTotalPerms -= (1 << *a_lTotalPerms);
	if (a_bFireEvent == VARIANT_TRUE)
		Fire_TotalPermissions(*a_lTotalPerms);

	return S_OK;
}


STDMETHODIMP CPermCom::get_ComPerms(LONG* pVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}


STDMETHODIMP CPermCom::put_ComPerms(LONG newVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}


STDMETHODIMP CPermCom::get_AtlPerms(LONG* pVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}


STDMETHODIMP CPermCom::put_AtlPerms(LONG newVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}


STDMETHODIMP CPermCom::get_ManagerName(BSTR* pVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}


STDMETHODIMP CPermCom::put_ManagerName(BSTR newVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}
