<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");

	String ls_sql=null;


	String wheresql="";

%>
<FONT COLOR=red><b>��ѡ����Ŀ</b></font>
  <table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�Ƿ��ѡ��</td>
	<td  width="8%">��Ŀ���</td>
	<td  width="18%">��Ŀ����</td>
	<td  width="5%">����</td>
	<td  width="5%">��λ</td>
	<td  width="5%">����</td>
	<td  width="12%">������Ŀ���</td>
	<td  width="6%">�Զ�����Ŀ��Ч��</td>
	<td  width="6%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="24%">��������</td>
</tr>

<%

	ls_sql="SELECT DECODE(bj_bjxmmx.sfbxx,'1','�ر���','2','������','3','��ѡ��','4','�Զ���','9','������') sfbxx";
	ls_sql+=" ,bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,smmc,jdm_jldwbm.jldwmc,bj_bjxmmx.dj,glxmbh,zdyxmyxq,lrr,lrsj,gycl  ";
	ls_sql+=" FROM bj_bjxmmx,bdm_smbm,jdm_jldwbm  ";
	ls_sql+=" where bj_bjxmmx.smbm=bdm_smbm.smbm(+) and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.sfbxx!='4'";
	ls_sql+=" order by bj_bjxmmx.xh,bj_bjxmmx.xmbh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
//������ʾ��

	pageObj.alignStr[10]="align='left'";


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