<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj,gycl,flmcgg,bz  ";
	ls_sql+=" FROM bj_bjxmmx  ";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_bjxmmxCxList.jsp","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">��Ŀ���</td>
	<td  width="4%">��Ŀ����</td>
	<td  width="2%">��Ŀ�������</td>
	<td  width="2%">��ĿС�����</td>
	<td  width="2%">��Ŀ�������</td>
	<td  width="2%">�������</td>
	<td  width="1%">������λ</td>
	<td  width="2%">���ϳɱ�</td>
	<td  width="2%">�˹��ɱ�</td>
	<td  width="2%">��е�ɱ�</td>
	<td  width="2%">�ɱ���</td>
	<td  width="2%">ʩ���ɱ���</td>
	<td  width="2%">���ϱ���</td>
	<td  width="2%">�˹�����</td>
	<td  width="2%">��е����</td>
	<td  width="2%">���ķ�</td>
	<td  width="2%">��ķ�</td>
	<td  width="2%">�����</td>
	<td  width="2%">������</td>
	<td  width="2%">�Ƿ��������</td>
	<td  width="2%">����ۿ�</td>
	<td  width="2%">�ͻ���ǰ����</td>
	<td  width="2%">�ۿ�</td>
	<td  width="2%">�ͻ��ۺ󱨼�</td>
	<td  width="2%">���̻�������</td>
	<td  width="1%">���ۼ���</td>
	<td  width="1%">��������</td>
	<td  width="1%">��������</td>
	<td  width="2%">�Ƿ��ѡ��</td>
	<td  width="2%">�Զ�����Ŀ��Ч��</td>
	<td  width="1%">��װ��־</td>
	<td  width="1%">��Ŀ����</td>
	<td  width="2%">�ο���Ŀ</td>
	<td  width="2%">�Ƿ���Ҫ����</td>
	<td  width="2%">�Ƿ���ҪԤ����</td>
	<td  width="2%">�Ƿ�ͻ��Թ�����</td>
	<td  width="2%">�ײ�����Ŀ��־</td>
	<td  width="1%">��Ŀ����</td>
	<td  width="2%">������Ŀ���</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="9%">���ղ��ϼ��</td>
	<td  width="4%">�������ƹ��</td>
	<td  width="6%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>