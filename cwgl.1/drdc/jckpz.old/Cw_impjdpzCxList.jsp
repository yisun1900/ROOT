<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xuhao=null;
	String fdate=null;
	String ftransdate=null;
	String fperiod=null;
	String fgroup=null;
	String fnum=null;
	String fentryid=null;
	String fexp=null;
	String facctid=null;
	String fclsname1=null;
	String fobjid1=null;
	String fobjname1=null;
	String fclsname2=null;
	String fobjid2=null;
	String fobjname2=null;
	String fclsname3=null;
	String fobjid3=null;
	String fobjname3=null;
	String fclsname4=null;
	String fobjid4=null;
	String fobjname4=null;
	String fclsname5=null;
	String fobjid5=null;
	String fobjname5=null;
	String fclsname6=null;
	String fobjid6=null;
	String fobjname6=null;
	String fclsname7=null;
	String fobjid7=null;
	String fobjname7=null;
	String fclsname8=null;
	String fobjid8=null;
	String fobjname8=null;
	String ftransid=null;
	String fcyid=null;
	String fexchrate=null;
	String fdc=null;
	String ffcyamt=null;
	String fqty=null;
	String fprice=null;
	String fdebit=null;
	String fcredit=null;
	String fsettlcode=null;
	String fsettleno=null;
	String fprepare=null;
	String fpay=null;
	String fcash=null;
	String fposter=null;
	String fchecker=null;
	String fattchment=null;
	String fposted=null;
	String fmodule=null;
	String fdeleted=null;
	String fserialno=null;
	String funitname=null;
	String freference=null;
	String fcashflow=null;
	String drsj=null;
	String drr=null;
	String bz=null;
	String scbz=null;
	String scr=null;
	String scsj=null;

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	
	
	
	xuhao=request.getParameter("xuhao");
	if (xuhao!=null)
	{
		xuhao=xuhao.trim();
		if (!(xuhao.equals("")))	wheresql+=" and (xuhao="+xuhao+") ";
	}
	fdate=request.getParameter("fdate");
	if (fdate!=null)
	{
		fdate=fdate.trim();
		if (!(fdate.equals("")))	wheresql+="  and (fdate=TO_DATE('"+fdate+"','YYYY/MM/DD'))";
	}
	ftransdate=request.getParameter("ftransdate");
	if (ftransdate!=null)
	{
		ftransdate=ftransdate.trim();
		if (!(ftransdate.equals("")))	wheresql+="  and (ftransdate=TO_DATE('"+ftransdate+"','YYYY/MM/DD'))";
	}
	fperiod=request.getParameter("fperiod");
	if (fperiod!=null)
	{
		fperiod=fperiod.trim();
		if (!(fperiod.equals("")))	wheresql+=" and (fperiod="+fperiod+") ";
	}
	fgroup=request.getParameter("fgroup");
	if (fgroup!=null)
	{
		fgroup=cf.GB2Uni(fgroup);
		if (!(fgroup.equals("")))	wheresql+=" and  (fgroup='"+fgroup+"')";
	}
	fnum=request.getParameter("fnum");
	if (fnum!=null)
	{
		fnum=fnum.trim();
		if (!(fnum.equals("")))	wheresql+=" and (fnum="+fnum+") ";
	}
	fentryid=request.getParameter("fentryid");
	if (fentryid!=null)
	{
		fentryid=fentryid.trim();
		if (!(fentryid.equals("")))	wheresql+=" and (fentryid="+fentryid+") ";
	}
	fexp=request.getParameter("fexp");
	if (fexp!=null)
	{
		fexp=cf.GB2Uni(fexp);
		if (!(fexp.equals("")))	wheresql+=" and  (fexp='"+fexp+"')";
	}
	facctid=request.getParameter("facctid");
	if (facctid!=null)
	{
		facctid=cf.GB2Uni(facctid);
		if (!(facctid.equals("")))	wheresql+=" and  (facctid='"+facctid+"')";
	}
	fclsname1=request.getParameter("fclsname1");
	if (fclsname1!=null)
	{
		fclsname1=cf.GB2Uni(fclsname1);
		if (!(fclsname1.equals("")))	wheresql+=" and  (fclsname1='"+fclsname1+"')";
	}
	fobjid1=request.getParameter("fobjid1");
	if (fobjid1!=null)
	{
		fobjid1=cf.GB2Uni(fobjid1);
		if (!(fobjid1.equals("")))	wheresql+=" and  (fobjid1='"+fobjid1+"')";
	}
	fobjname1=request.getParameter("fobjname1");
	if (fobjname1!=null)
	{
		fobjname1=cf.GB2Uni(fobjname1);
		if (!(fobjname1.equals("")))	wheresql+=" and  (fobjname1='"+fobjname1+"')";
	}
	fclsname2=request.getParameter("fclsname2");
	if (fclsname2!=null)
	{
		fclsname2=cf.GB2Uni(fclsname2);
		if (!(fclsname2.equals("")))	wheresql+=" and  (fclsname2='"+fclsname2+"')";
	}
	fobjid2=request.getParameter("fobjid2");
	if (fobjid2!=null)
	{
		fobjid2=cf.GB2Uni(fobjid2);
		if (!(fobjid2.equals("")))	wheresql+=" and  (fobjid2='"+fobjid2+"')";
	}
	fobjname2=request.getParameter("fobjname2");
	if (fobjname2!=null)
	{
		fobjname2=cf.GB2Uni(fobjname2);
		if (!(fobjname2.equals("")))	wheresql+=" and  (fobjname2='"+fobjname2+"')";
	}
	fclsname3=request.getParameter("fclsname3");
	if (fclsname3!=null)
	{
		fclsname3=cf.GB2Uni(fclsname3);
		if (!(fclsname3.equals("")))	wheresql+=" and  (fclsname3='"+fclsname3+"')";
	}
	fobjid3=request.getParameter("fobjid3");
	if (fobjid3!=null)
	{
		fobjid3=cf.GB2Uni(fobjid3);
		if (!(fobjid3.equals("")))	wheresql+=" and  (fobjid3='"+fobjid3+"')";
	}
	fobjname3=request.getParameter("fobjname3");
	if (fobjname3!=null)
	{
		fobjname3=cf.GB2Uni(fobjname3);
		if (!(fobjname3.equals("")))	wheresql+=" and  (fobjname3='"+fobjname3+"')";
	}
	fclsname4=request.getParameter("fclsname4");
	if (fclsname4!=null)
	{
		fclsname4=cf.GB2Uni(fclsname4);
		if (!(fclsname4.equals("")))	wheresql+=" and  (fclsname4='"+fclsname4+"')";
	}
	fobjid4=request.getParameter("fobjid4");
	if (fobjid4!=null)
	{
		fobjid4=cf.GB2Uni(fobjid4);
		if (!(fobjid4.equals("")))	wheresql+=" and  (fobjid4='"+fobjid4+"')";
	}
	fobjname4=request.getParameter("fobjname4");
	if (fobjname4!=null)
	{
		fobjname4=cf.GB2Uni(fobjname4);
		if (!(fobjname4.equals("")))	wheresql+=" and  (fobjname4='"+fobjname4+"')";
	}
	fclsname5=request.getParameter("fclsname5");
	if (fclsname5!=null)
	{
		fclsname5=cf.GB2Uni(fclsname5);
		if (!(fclsname5.equals("")))	wheresql+=" and  (fclsname5='"+fclsname5+"')";
	}
	fobjid5=request.getParameter("fobjid5");
	if (fobjid5!=null)
	{
		fobjid5=cf.GB2Uni(fobjid5);
		if (!(fobjid5.equals("")))	wheresql+=" and  (fobjid5='"+fobjid5+"')";
	}
	fobjname5=request.getParameter("fobjname5");
	if (fobjname5!=null)
	{
		fobjname5=cf.GB2Uni(fobjname5);
		if (!(fobjname5.equals("")))	wheresql+=" and  (fobjname5='"+fobjname5+"')";
	}
	fclsname6=request.getParameter("fclsname6");
	if (fclsname6!=null)
	{
		fclsname6=cf.GB2Uni(fclsname6);
		if (!(fclsname6.equals("")))	wheresql+=" and  (fclsname6='"+fclsname6+"')";
	}
	fobjid6=request.getParameter("fobjid6");
	if (fobjid6!=null)
	{
		fobjid6=cf.GB2Uni(fobjid6);
		if (!(fobjid6.equals("")))	wheresql+=" and  (fobjid6='"+fobjid6+"')";
	}
	fobjname6=request.getParameter("fobjname6");
	if (fobjname6!=null)
	{
		fobjname6=cf.GB2Uni(fobjname6);
		if (!(fobjname6.equals("")))	wheresql+=" and  (fobjname6='"+fobjname6+"')";
	}
	fclsname7=request.getParameter("fclsname7");
	if (fclsname7!=null)
	{
		fclsname7=cf.GB2Uni(fclsname7);
		if (!(fclsname7.equals("")))	wheresql+=" and  (fclsname7='"+fclsname7+"')";
	}
	fobjid7=request.getParameter("fobjid7");
	if (fobjid7!=null)
	{
		fobjid7=cf.GB2Uni(fobjid7);
		if (!(fobjid7.equals("")))	wheresql+=" and  (fobjid7='"+fobjid7+"')";
	}
	fobjname7=request.getParameter("fobjname7");
	if (fobjname7!=null)
	{
		fobjname7=cf.GB2Uni(fobjname7);
		if (!(fobjname7.equals("")))	wheresql+=" and  (fobjname7='"+fobjname7+"')";
	}
	fclsname8=request.getParameter("fclsname8");
	if (fclsname8!=null)
	{
		fclsname8=cf.GB2Uni(fclsname8);
		if (!(fclsname8.equals("")))	wheresql+=" and  (fclsname8='"+fclsname8+"')";
	}
	fobjid8=request.getParameter("fobjid8");
	if (fobjid8!=null)
	{
		fobjid8=cf.GB2Uni(fobjid8);
		if (!(fobjid8.equals("")))	wheresql+=" and  (fobjid8='"+fobjid8+"')";
	}
	fobjname8=request.getParameter("fobjname8");
	if (fobjname8!=null)
	{
		fobjname8=cf.GB2Uni(fobjname8);
		if (!(fobjname8.equals("")))	wheresql+=" and  (fobjname8='"+fobjname8+"')";
	}
	ftransid=request.getParameter("ftransid");
	if (ftransid!=null)
	{
		ftransid=cf.GB2Uni(ftransid);
		if (!(ftransid.equals("")))	wheresql+=" and  (ftransid='"+ftransid+"')";
	}
	fcyid=request.getParameter("fcyid");
	if (fcyid!=null)
	{
		fcyid=cf.GB2Uni(fcyid);
		if (!(fcyid.equals("")))	wheresql+=" and  (fcyid='"+fcyid+"')";
	}
	fexchrate=request.getParameter("fexchrate");
	if (fexchrate!=null)
	{
		fexchrate=fexchrate.trim();
		if (!(fexchrate.equals("")))	wheresql+=" and  (fexchrate="+fexchrate+") ";
	}
	fdc=request.getParameter("fdc");
	if (fdc!=null)
	{
		fdc=cf.GB2Uni(fdc);
		if (!(fdc.equals("")))	wheresql+=" and  (fdc='"+fdc+"')";
	}
	ffcyamt=request.getParameter("ffcyamt");
	if (ffcyamt!=null)
	{
		ffcyamt=ffcyamt.trim();
		if (!(ffcyamt.equals("")))	wheresql+=" and  (ffcyamt="+ffcyamt+") ";
	}
	fqty=request.getParameter("fqty");
	if (fqty!=null)
	{
		fqty=fqty.trim();
		if (!(fqty.equals("")))	wheresql+=" and  (fqty="+fqty+") ";
	}
	fprice=request.getParameter("fprice");
	if (fprice!=null)
	{
		fprice=fprice.trim();
		if (!(fprice.equals("")))	wheresql+=" and  (fprice="+fprice+") ";
	}
	fdebit=request.getParameter("fdebit");
	if (fdebit!=null)
	{
		fdebit=fdebit.trim();
		if (!(fdebit.equals("")))	wheresql+=" and  (fdebit="+fdebit+") ";
	}
	fcredit=request.getParameter("fcredit");
	if (fcredit!=null)
	{
		fcredit=fcredit.trim();
		if (!(fcredit.equals("")))	wheresql+=" and  (fcredit="+fcredit+") ";
	}
	fsettlcode=request.getParameter("fsettlcode");
	if (fsettlcode!=null)
	{
		fsettlcode=cf.GB2Uni(fsettlcode);
		if (!(fsettlcode.equals("")))	wheresql+=" and  (fsettlcode='"+fsettlcode+"')";
	}
	fsettleno=request.getParameter("fsettleno");
	if (fsettleno!=null)
	{
		fsettleno=cf.GB2Uni(fsettleno);
		if (!(fsettleno.equals("")))	wheresql+=" and  (fsettleno='"+fsettleno+"')";
	}
	fprepare=request.getParameter("fprepare");
	if (fprepare!=null)
	{
		fprepare=cf.GB2Uni(fprepare);
		if (!(fprepare.equals("")))	wheresql+=" and  (fprepare='"+fprepare+"')";
	}
	fpay=request.getParameter("fpay");
	if (fpay!=null)
	{
		fpay=cf.GB2Uni(fpay);
		if (!(fpay.equals("")))	wheresql+=" and  (fpay='"+fpay+"')";
	}
	fcash=request.getParameter("fcash");
	if (fcash!=null)
	{
		fcash=cf.GB2Uni(fcash);
		if (!(fcash.equals("")))	wheresql+=" and  (fcash='"+fcash+"')";
	}
	fposter=request.getParameter("fposter");
	if (fposter!=null)
	{
		fposter=cf.GB2Uni(fposter);
		if (!(fposter.equals("")))	wheresql+=" and  (fposter='"+fposter+"')";
	}
	fchecker=request.getParameter("fchecker");
	if (fchecker!=null)
	{
		fchecker=cf.GB2Uni(fchecker);
		if (!(fchecker.equals("")))	wheresql+=" and  (fchecker='"+fchecker+"')";
	}
	fattchment=request.getParameter("fattchment");
	if (fattchment!=null)
	{
		fattchment=fattchment.trim();
		if (!(fattchment.equals("")))	wheresql+=" and (fattchment="+fattchment+") ";
	}
	fposted=request.getParameter("fposted");
	if (fposted!=null)
	{
		fposted=cf.GB2Uni(fposted);
		if (!(fposted.equals("")))	wheresql+=" and  (fposted='"+fposted+"')";
	}
	fmodule=request.getParameter("fmodule");
	if (fmodule!=null)
	{
		fmodule=cf.GB2Uni(fmodule);
		if (!(fmodule.equals("")))	wheresql+=" and  (fmodule='"+fmodule+"')";
	}
	fdeleted=request.getParameter("fdeleted");
	if (fdeleted!=null)
	{
		fdeleted=cf.GB2Uni(fdeleted);
		if (!(fdeleted.equals("")))	wheresql+=" and  (fdeleted='"+fdeleted+"')";
	}
	fserialno=request.getParameter("fserialno");
	if (fserialno!=null)
	{
		fserialno=fserialno.trim();
		if (!(fserialno.equals("")))	wheresql+=" and (fserialno="+fserialno+") ";
	}
	funitname=request.getParameter("funitname");
	if (funitname!=null)
	{
		funitname=cf.GB2Uni(funitname);
		if (!(funitname.equals("")))	wheresql+=" and  (funitname='"+funitname+"')";
	}
	freference=request.getParameter("freference");
	if (freference!=null)
	{
		freference=cf.GB2Uni(freference);
		if (!(freference.equals("")))	wheresql+=" and  (freference='"+freference+"')";
	}
	fcashflow=request.getParameter("fcashflow");
	if (fcashflow!=null)
	{
		fcashflow=fcashflow.trim();
		if (!(fcashflow.equals("")))	wheresql+=" and (fcashflow="+fcashflow+") ";
	}
	drsj=request.getParameter("drsj");
	if (drsj!=null)
	{
		drsj=drsj.trim();
		if (!(drsj.equals("")))	wheresql+="  and (drsj=TO_DATE('"+drsj+"','YYYY/MM/DD'))";
	}
	drr=request.getParameter("drr");
	if (drr!=null)
	{
		drr=cf.GB2Uni(drr);
		if (!(drr.equals("")))	wheresql+=" and  (drr='"+drr+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	scbz=request.getParameter("scbz");
	if (scbz!=null)
	{
		scbz=cf.GB2Uni(scbz);
		if (!(scbz.equals("")))	wheresql+=" and  (scbz='"+scbz+"')";
	}
	scr=request.getParameter("scr");
	if (scr!=null)
	{
		scr=cf.GB2Uni(scr);
		if (!(scr.equals("")))	wheresql+=" and  (scr='"+scr+"')";
	}
	scsj=request.getParameter("scsj");
	if (scsj!=null)
	{
		scsj=scsj.trim();
		if (!(scsj.equals("")))	wheresql+="  and (scsj=TO_DATE('"+scsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xuhao, DECODE(scbz,'N','δɾ','Y','��ɾ��'),drsj,drr,crm_khxx.khxm,crm_khxx.fwdz,dwmc,fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1 hth,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted,fmodule,fdeleted,fserialno,funitname,freference,fcashflow,cw_impjdpz.bz,scr,scsj  ";
	ls_sql+=" FROM cw_impjdpz,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_impjdpz.fobjid1=crm_khxx.hth(+) and crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_impjdpzCxList.jsp","SelectCxCw_impjdpz.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","fdate","ftransdate","fperiod","fgroup","fnum","fentryid","fexp","facctid","fclsname1","fobjid1","fobjname1","fclsname2","fobjid2","fobjname2","fclsname3","fobjid3","fobjname3","fclsname4","fobjid4","fobjname4","fclsname5","fobjid5","fobjname5","fclsname6","fobjid6","fobjname6","fclsname7","fobjid7","fobjname7","fclsname8","fobjid8","fobjname8","ftransid","fcyid","fexchrate","fdc","ffcyamt","fqty","fprice","fdebit","fcredit","fsettlcode","fsettleno","fprepare","fpay","fcash","fposter","fchecker","fattchment","fposted","fmodule","fdeleted","fserialno","funitname","freference","fcashflow","drsj","drr","bz","scbz","scr","scsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
/*
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ƾ֤�������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="1%">ɾ����־</td>
	<td  width="2%">����ʱ��</td>
	<td  width="1%">������</td>
	<td  width="2%">����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">�ֹ�˾</td>

	<td  width="2%">ƾ֤����</td>
	<td  width="2%">ҵ������</td>
	<td  width="1%">����ڼ�</td>
	<td  width="1%">ƾ֤��</td>
	<td  width="1%">ƾ֤��</td>
	<td  width="1%">��¼��</td>
	<td  width="5%">ƾ֤ժҪ</td>
	<td  width="2%">��Ŀ��</td>
	<td  width="2%">��Ŀ�������1</td>
	<td  width="2%">��ĿID1</td>
	<td  width="4%">��Ŀ����1</td>
	<td  width="2%">��Ŀ�������2</td>
	<td  width="2%">��ĿID2</td>
	<td  width="3%">��Ŀ����2</td>

	<td  width="2%">��Ŀ�������3</td>
	<td  width="2%">��ĿID3</td>
	<td  width="3%">��Ŀ����3</td>
	<td  width="1%">��Ŀ�������4</td>
	<td  width="1%">��ĿID4</td>
	<td  width="1%">��Ŀ����4</td>

	<td  width="1%">��Ŀ�������5</td>
	<td  width="1%">��ĿID5</td>
	<td  width="1%">��Ŀ����5</td>
	<td  width="1%">��Ŀ�������6</td>
	<td  width="1%">��ĿID6</td>
	<td  width="1%">��Ŀ����6</td>
	<td  width="1%">��Ŀ�������7</td>
	<td  width="1%">��ĿID7</td>
	<td  width="1%">��Ŀ����7</td>
	<td  width="1%">��Ŀ�������8</td>

	<td  width="1%">��ĿID8</td>
	<td  width="1%">��Ŀ����8</td>
	<td  width="1%">ҵ����</td>
	<td  width="1%">����</td>
	<td  width="1%">����</td>
	<td  width="1%">�����־</td>
	<td  width="2%">ԭ�ҽ��</td>
	<td  width="1%">����</td>
	<td  width="1%">����</td>

	<td  width="2%">�跽������</td>
	<td  width="2%">����������</td>
	<td  width="1%">���㷽ʽ����</td>
	<td  width="1%">�����</td>
	<td  width="1%">�Ƶ���</td>
	<td  width="1%">δʹ��1</td>
	<td  width="1%">δʹ��2</td>
	<td  width="1%">������</td>

	<td  width="1%">�����</td>
	<td  width="1%">��������</td>
	<td  width="1%">���˱��</td>
	<td  width="1%">����ƾ֤ģ���ʶ</td>
	<td  width="1%">ɾ�����</td>
	<td  width="2%">ƾ֤���</td>
	<td  width="1%">��λ</td>
	<td  width="1%">�ο���Ϣ</td>
	<td  width="1%">�Ƿ���ָ���ֽ�����</td>

	<td  width="3%">��ע</td>
	<td  width="1%">ɾ����</td>
	<td  width="2%">ɾ��ʱ��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>