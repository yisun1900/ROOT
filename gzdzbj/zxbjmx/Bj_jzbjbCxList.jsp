<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<%
	String yhdlm=(String)session.getAttribute("yhdlm");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String bjjb=request.getParameter("bjjb");
	String jzbz=request.getParameter("jzbz");

	String khbh=request.getParameter("khbh");
	String xmdlbm=request.getParameter("xmdlbm");
	String xmxlbm=request.getParameter("xmxlbm");
	String dqbm=request.getParameter("dqbm");

	if (xmdlbm.equals(""))
	{
		return;
	}

	String ls_sql=null;


	String wheresql="";
	String xmmc=null;
	String smbm=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like'%"+xmmc+"%')";
	}
	smbm=request.getParameter("smbm");
	if (smbm!=null)
	{
		smbm=cf.GB2Uni(smbm);
		if (!(smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+smbm+"')";
	}
%>
<FONT COLOR=red><b>��ѡ�����Ŀ��</b></font>
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="9%">��Ŀ���</td>
	<td  width="29%">��Ŀ����</td>
	<td  width="11%">����</td>
	<td  width="6%">��λ</td>
	<td  width="7%">�ۺϵ���</td>
	<td  width="7%">���ķ�</td>
	<td  width="6%">����</td>
</tr>
<%


  if (bjjb.equals("A"))//A:��ͨ;B:��Ʒ;C:�ֻ�÷��
	{
		ls_sql="SELECT '<font color=\"#FF3300\">��ѡ��</font>',bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.abj as bj,azcf zcf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx";
	}
	else if (bjjb.equals("B"))
	{
		ls_sql="SELECT '<font color=\"#FF3300\">��ѡ��</font>',bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.bbj as bj,bzcf zcf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx";
	}
	else if (bjjb.equals("C"))
	{
		ls_sql="SELECT '<font color=\"#FF3300\">��ѡ��</font>',bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.cbj as bj,czcf zcf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx";
	}

	ls_sql+=" FROM bj_gzbjb,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm";
    ls_sql+=" and bj_gzbjb.xmdlbm='"+xmdlbm+"' and bj_gzbjb.xmxlbm='"+xmxlbm+"' and bj_gzbjb.dqbm='"+dqbm+"'";
    ls_sql+=" and ((bj_gzbjb.bjlx='2' and bj_gzbjb.lrr='"+yhdlm+"') or (bj_gzbjb.bjlx='2' and bj_gzbjb.shbz='Y') or bj_gzbjb.bjlx='1')";//1:��׼��Ŀ;2:�Զ�����Ŀ
    ls_sql+=" and bj_gzbjb.xmbh  in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
//	out.print(ls_sql);
//    ls_sql+=wheresql;
	ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���


	pageObj.out=out;
	pageObj.getDate();

	pageObj.displayDate();
%>
</table>

<%

	if (bjjb.equals("A"))//A:��ͨ;B:��Ʒ;C:�ֻ�÷��
	{
		ls_sql="SELECT dqbm,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.abj as bj,azcf zcf,aclf clf,argf rgf,ajjf jjf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx";
	}
	else if (bjjb.equals("B"))
	{
		ls_sql="SELECT dqbm,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.bbj as bj,bzcf zcf,bclf clf,brgf rgf,bjjf jjf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx";
	}
	else if (bjjb.equals("C"))
	{
		ls_sql="SELECT dqbm,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.cbj as bj,czcf zcf,cclf clf,crgf rgf,cjjf jjf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx";
	}

	ls_sql+=" FROM bj_gzbjb,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm";
    ls_sql+=" and bj_gzbjb.xmdlbm='"+xmdlbm+"' and bj_gzbjb.xmxlbm='"+xmxlbm+"' and bj_gzbjb.dqbm='"+dqbm+"'";
    ls_sql+=" and ((bj_gzbjb.bjlx='2' and bj_gzbjb.lrr='"+yhdlm+"') or (bj_gzbjb.bjlx='2' and bj_gzbjb.shbz='Y') or bj_gzbjb.bjlx='1')";//1:��׼��Ŀ;2:�Զ�����Ŀ
    ls_sql+=" and bj_gzbjb.xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
//	out.print(ls_sql);
    ls_sql+=wheresql;
	ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"xmbh","bj_gzbjb_xmmc","smmc","jdm_jldwbm_jldwmc","bj","zcf","bjlx"};
	pageObj.setDisColName(disColName);
//��������
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[1]="align='left'";
//���ð�ť����
	String[] buttonName={"���汻ѡ��Ŀ"};//��ť����ʾ����
	String[] buttonLink={"SaveInsertBj_bjxmmx.jsp?khbh="+khbh+"&bjjb="+bjjb+"&jzbz="+jzbz+"&dqbm="+dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	spanColHash.put("xmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��


%>

<form method="POST" name="listform">
<input type="hidden" name="xmdlbm" value="<%=xmdlbm%>" >
<input type="hidden" name="xmxlbm" value="<%=xmxlbm%>" >
<FONT COLOR=red><b>δѡ��Ŀ��</b></font>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="9%">��Ŀ���</td>
	<td  width="30%">��Ŀ����</td>
	<td  width="11%">����</td>
	<td  width="6%">��λ</td>
	<td  width="7%">�ۺϵ���</td>
	<td  width="7%">���ķ�</td>
	<td  width="6%">����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}
//-->
</script>
</html>