<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<%
	String yhdlm=(String)session.getAttribute("yhdlm");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");
	String jzbz=request.getParameter("jzbz");
	String dqbm=request.getParameter("dqbm");
	String bjjb=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
	String bjbbh=cf.executeQuery("select bjbbh from crm_zxkhxx where khbh='"+khbh+"'");




	String ls_sql=null;


	String wheresql="";
	String xmbhStr=cf.GB2Uni(request.getParameter("xmbh"));
	if (xmbhStr!=null)
	{
		if (!(xmbhStr.equals("")))
		{
			int pos=xmbhStr.indexOf("'");
			if (pos!=-1)
			{
				out.println("������¼�����Ŀ����к�Ӣ�ġ�,����");
				return;
			}
			pos=xmbhStr.indexOf("\"");
			if (pos!=-1)
			{
				out.println("������¼�����Ŀ����к�Ӣ�ġ�\"����");
				return;
			}
			pos=xmbhStr.indexOf("��");
			if (pos!=-1)
			{
				out.println("������¼�����Ŀ����к����֡�������");
				return;
			}
			pos=xmbhStr.indexOf("��");
			if (pos!=-1)
			{
				out.println("������¼�����Ŀ����к����֡�������");
				return;
			}
			pos=xmbhStr.indexOf("��");
			if (pos!=-1)
			{
				out.println("������¼�����Ŀ����к����֡�������");
				return;
			}

			String[] xmbh=xmbhStr.split(",");

			wheresql+=" and "+cf.arrayToInSQL(xmbh,"xmbh");
		}
	}

	

	String xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}

	String smbm=request.getParameter("smbm");
	if (smbm!=null)
	{
		smbm=cf.GB2Uni(smbm);
		if (!(smbm.equals("")))	wheresql+=" and  (bj_jzbjb.smbm='"+smbm+"')";
	}
%>


<%

	ls_sql="SELECT dqbm,bj_jzbjb.xmbh as xmbh,bj_jzbjb.xmmc,smmc,jdm_jldwbm.jldwmc,bj_jzbjb.bj";
	ls_sql+=" FROM bj_jzbjb,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm";
	ls_sql+=" and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
	ls_sql+=" and bj_jzbjb.sfbxx!='9'";//1���ر��2�������3����ѡ�9��������
    ls_sql+=" and bj_jzbjb.xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
    ls_sql+=wheresql;
	ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xh,bj_jzbjb.xmbh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"xmbh","xmmc","smmc","jldwmc","bj"};
	pageObj.setDisColName(disColName);
//��������
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[0]="align='left'";
	pageObj.alignStr[1]="align='left'";
//���ð�ť����
	String[] buttonName={"���汻ѡ��Ŀ"};//��ť����ʾ����
	String[] buttonLink={"SaveInsertBj_bjxmmx.jsp?khbh="+khbh+"&jzbz="+jzbz+"&dqbm="+dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);



%>


<form method="POST" name="listform">
<FONT COLOR=red><b>��Ŀ�б�ע�⣺��ѡ����Ŀ�����ٳ��֣�</b></font>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayTopButton();
%> 
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="14%">��Ŀ���</td>
	<td  width="47%">��Ŀ����</td>
	<td  width="10%">����</td>
	<td  width="9%">��λ</td>
	<td  width="9%">����</td>
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