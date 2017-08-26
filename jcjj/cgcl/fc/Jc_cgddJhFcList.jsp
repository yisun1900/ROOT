<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String ddbh=null;
	String khbh=null;
	String dwbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String cgsjs=null;
	String clzt=null;
	String khlx=null;
	String fgs=null;

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+dwbh+"')";
	}
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+ddbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (jc_cgdd.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (jc_cgdd.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (jc_cgdd.lxfs='"+lxfs+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (jc_cgdd.hth='"+hth+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+cgsjs+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+clzt+"')";
	}
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+khlx+"')";
	}

	ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.khbh as khbh,jc_cgdd.khxm as khxm,jc_cgdd.fwdz as fwdz,jc_cgdd.hth as hth,clgw,jc_cgdd.xmzy,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs, DECODE(jc_cgdd.clzt,'00','Ԥ����δ���','01','Ԥ���������','02','���ɵ�','03','�ѳ���','04','�Ѹ���','05','ǩ����ͬ','06','��ͬ��ȷ��','07','�����','08','�Ѱ�װ') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','װ�޿ͻ�','2','����ͻ�') as jc_cgdd_khlx,jc_cgdd.jhfcsj,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_cgdd,sq_dwxx";
    ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh ";
    ls_sql+=" and jc_cgdd.clzt in('01','02','03')";
	ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdd.pdsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","XgJhFcJc_cgdd.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("�޸�");//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"ddbh","jc_cgdd_clzt","jc_cgdd_cgsjs","jhfcsj","khxm","fwdz","hth","clgw","xmzy","jc_cgdd_dj","jc_cgdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jc_cgdd_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸ļƻ�����ʱ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">�������</td>
	<td  width="7%">����״̬</td>
	<td  width="6%">�Ҿ����ʦ</td>
	<td  width="8%">�ƻ�����ʱ��</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="8%">��ͬ��</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="7%">���񶩽�</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="10%">¼�벿��</td>
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