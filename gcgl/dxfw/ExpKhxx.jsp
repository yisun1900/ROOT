<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);
	
	String[] khbh=request.getParameterValues("khbh");

	String ls_sql=null;


	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,DECODE(kgzbz,'Y','�ѳ�','N','<font color=\"#FF00FF\">δ��</font>'),DECODE(zt,'2','��װ','3','<font color=\"#FF00FF\">���˵�</font>','4','�Ǽ�װ','5','��ƿͻ�'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,crm_khxx.lxfs,DECODE(NVL(tgbz,'W'),'W','����','N','<font color=\"#00FF00\">����</font>','Y','<font color=\"#FF0000\">��ͣ��</font>'),ywy,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.kgrq,jgrq,DECODE(crm_khxx.sffj,'Y','��','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��','N','��'),b.dwmc rzsc,khlxmc";

	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm,dm_khlxbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
    ls_sql+=" and crm_khxx.zt!='3'";
    ls_sql+=" and "+ cf.arrayToInSQL(khbh,"crm_khxx.khbh");
    ls_sql+=" order by lrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(20000);


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">�����ͻ�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="2%">����֤</td>
	<td  width="2%">����</td>
	<td  width="3%">���̽���</td>
	<td  width="2%">��װ��־ </td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">���̵���</td>
	<td  width="4%">�μӴ����</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="2%">ͣ��</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��ͬ��������</td>
	<td  width="3%">��ͬ��������</td>
	<td  width="2%">�Ƿ񷵾�</td>
	<td  width="3%">�����ܽ��</td>
	<td  width="3%">��˾�е������</td>
	<td  width="2%">�Ƿ�����֤</td>
	<td  width="4%">��֤�г�</td>
	<td  width="4%">��ϵ�ͻ�</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	Connection conn  = null;
	PreparedStatement ps=null;
	try {
		conn=cf.getConnection();

		ls_sql="update crm_khxx set sfyfdx='2',fdxr='"+yhmc+"',fdxsj=TRUNC(SYSDATE) ";
		ls_sql+=" where "+ cf.arrayToInSQL(khbh,"crm_khxx.khbh");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	catch (Exception e) {
		out.print("Exception: " + e);
		return;
	}
	finally 
	{
		try{
			if (ps!= null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}
%>