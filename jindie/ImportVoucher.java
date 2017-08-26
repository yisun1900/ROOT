package com.kingdee.eas.custom;

import java.net.MalformedURLException;
import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

import com.kingdee.ormrpc.services.EASLogin.EASLoginProxy;
import com.kingdee.ormrpc.services.EASLogin.EASLoginProxyService;
import com.kingdee.ormrpc.services.EASLogin.EASLoginProxyServiceLocator;
import com.kingdee.ormrpc.services.WSWSVoucher.WSWSVoucherSrvProxy;
import com.kingdee.ormrpc.services.WSWSVoucher.WSWSVoucherSrvProxyServiceLocator;

import wsvoucher.client.WSInvokeException;
import wsvoucher.client.WSWSVoucher;
import client.WSContext;

public class ImportVoucher
{
	/**
	 * @param args
	 */
	public static void main(String[] args)
	{

		WSContext ctx = EASLogin("user", "", "eas", "001", "L2", 1);
		System.out.println(ctx.getSessionId());

		String[][] aa = importVoucher();

		System.out.println(aa[0].length);
		System.out.println(aa[0][0]);
		System.out.println(aa[0][1]);
		System.out.println(aa[0][2]);
		System.out.println(aa[0][3]);
		System.out.println(aa[0][4]);
		System.out.println(aa[0][5]);
		System.out.println(aa[0][6]);

	}

	public static WSContext EASLogin(String userName, String password,
					String slnName, String dcName, String language, int dbType)
	{
		EASLoginProxyService loginws = new EASLoginProxyServiceLocator();
		try
		{
			EASLoginProxy loginServer = loginws.getEASLogin();
			return loginServer.login(userName, password, slnName, dcName,
							language, dbType);
		}
		catch (ServiceException e)
		{
			e.printStackTrace();
		}
		catch (WSInvokeException e)
		{
			e.printStackTrace();
		}
		catch (RemoteException e)
		{
			e.printStackTrace();
		}

		return null;
	}

	public static String[][] importVoucher()
	{
		WSWSVoucher[] voucherCols = null;

		int isVerify = 2;

		int isImpCashflow = 0;

		String[][] result = null;
		WSWSVoucherSrvProxyServiceLocator locator = new WSWSVoucherSrvProxyServiceLocator();
		try
		{
			java.net.URL endPoint = new java.net.URL(
							"http://192.168.137.231:6888/ormrpc/services/WSWSVoucher");
			WSWSVoucherSrvProxy voucherProxy = locator.getWSWSVoucher(endPoint);
			voucherCols = createVoucher();
			result = voucherProxy.importVoucher(voucherCols, isVerify,
							isImpCashflow);
			System.out.println("dafdfadsfa3");
		}
		catch (ServiceException e)
		{
			e.printStackTrace();
		}
		catch (WSInvokeException e)
		{
			e.printStackTrace();
		}
		catch (RemoteException e)
		{
			e.printStackTrace();
		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();
		}
		return result;

	}

	public static WSWSVoucher[] createVoucher()
	{

		WSWSVoucher[] vs = new WSWSVoucher[2];

		WSWSVoucher vo = new WSWSVoucher();

		//摘要－头
		//分录－核销、挂账
		//辅助帐－核算项目1
		
		vo.setCompanyNumber("01.001");

		vo.setBookedDate("2010-09-30");

		vo.setBizDate("2010-09-30");

		vo.setPeriodYear(2010);

		vo.setPeriodNumber(9);

		vo.setVoucherType("记");

		vo.setVoucherNumber("005");

		vo.setEntrySeq(1);

		vo.setVoucherAbstract("Webserveice Test");

		vo.setCurrencyNumber("BB01");

		vo.setEntryDC(1);

		vo.setAccountNumber("1001.01");

		vo.setOriginalAmount(123.00);

		vo.setDebitAmount(123.00);

		vo.setCreator("王有财");



		vs[0] = vo;
		WSWSVoucher vo1 = new WSWSVoucher();

		vo1.setCompanyNumber("01.001");

		vo1.setBookedDate("2010-09-30");

		vo1.setBizDate("2010-09-30");

		vo1.setPeriodYear(2010);

		vo1.setPeriodNumber(9);

		vo1.setVoucherType("记");

		vo1.setVoucherNumber("005");

		vo1.setEntrySeq(2);

		vo1.setVoucherAbstract("Webserveice Test");

		vo1.setCurrencyNumber("BB01");

		vo1.setEntryDC(0);

		vo1.setAccountNumber("6901");

		vo1.setOriginalAmount(123.00);

		vo1.setCreditAmount(123.00);

		vo1.setCreator("王有财");

		vs[1] = vo1;

		return vs;

	}
}
