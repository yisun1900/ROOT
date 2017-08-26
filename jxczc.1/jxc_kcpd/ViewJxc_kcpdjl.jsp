<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String pdph=null;
String dqbm=null;
String ckbh=null;
String pdzt=null;
String pdr=null;
String pdrssbm=null;
String pdrssfgs=null;
String pdsj=null;
String bz=null;
String wherepdph=null;
wherepdph=cf.GB2Uni(request.getParameter("pdph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql=" select pdph,dm_dqbm.dqmc dqbm,ckmc ckbh,DECODE(pdzt,'1','�����̵�','2','�̵����') pdzt,pdr,a.dwmc pdrssbm,b.dwmc pdrssfgs,pdsj,jxc_kcpdjl.bz bz ";
	ls_sql+=" from jxc_kcpdjl,dm_dqbm,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and jxc_kcpdjl.pdrssbm=a.dwbh and  jxc_kcpdjl.pdrssfgs=b.dwbh ";
	ls_sql+=" and (pdph="+wherepdph+") ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdph=cf.fillNull(rs.getString("pdph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		pdzt=cf.fillNull(rs.getString("pdzt"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdrssbm=cf.fillNull(rs.getString("pdrssbm"));
		pdrssfgs=cf.fillNull(rs.getString("pdrssfgs"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �鿴��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �̵�����
  </td>
  <td width="35%"> 
    <%=pdph%>
  </td>
  <td align="right" width="15%"> 
    ��������
  </td>
  <td width="35%"> 
    <%=dqbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ֿ���
  </td>
  <td width="35%"> 
    <%=ckbh%>
  </td>
  <td align="right" width="15%"> 
    �̵�״̬
  </td>
  <td width="35%"> 
    <%=pdzt%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �̵���
  </td>
  <td width="35%"> 
    <%=pdr%>
  </td>
  <td align="right" width="15%"> 
    �̵�����������
  </td>
  <td width="35%"> 
    <%=pdrssbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �̵��������ֹ�˾
  </td>
  <td width="35%"> 
    <%=pdrssfgs%>
  </td>
  <td align="right" width="15%"> 
    �̵�ʱ��
  </td>
  <td width="35%"> 
    <%=pdsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ע
  </td>
  <td width="35%" colspan="3"> 
    <%=bz%>
  </td>
</tr>
</table>
</body>
</html>

<%
	String ls_sql2=null;
	String wheresql2=cf.GB2Uni(request.getParameter("pdph"));
	ls_sql2=" SELECT pdph,dqmc,ckmc,clbm,clmc,xh,gg,nbbm,kczcpsl,kcccpsl,kcbfpsl,pdzcpsl,pdccpsl,pdbfpsl,zcppdcyl,pdzcyl,DECODE(pdjg,'1','<font color=blue>��ӯ</font>','2','<font color=red>�̿�</font>','3','��ƽ') pdjg ";
	ls_sql2+=" from  jxc_kcpdmx,dm_dqbm,jxc_ckmc ";
	ls_sql2+=" where jxc_kcpdmx.dqbm=dm_dqbm.dqbm and jxc_kcpdmx.ckbh=jxc_ckmc.ckbh ";
    ls_sql2+=" and (pdph="+wheresql2+") ";
	ls_sql2+=" order by pdph,dqmc,ckmc ";
    pageObj.sql=ls_sql2;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��
	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pdph","1");//�в����������Hash��
	spanColHash.put("ckmc","1");//�в����������Hash��
	spanColHash.put("dqmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">����</td>
	<td  width="2%">����</td>
	<td  width="3%">�ֿ�</td>
	<td  width="4%">���ϱ���</td>
	<td  width="12%">��������</td>
	<td  width="6%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="3%">�������Ʒ����</td>
	<td  width="3%">���д�Ʒ����</td>
	<td  width="3%">��汨��Ʒ����</td>
	<td  width="3%">�̵�����Ʒ����</td>
	<td  width="3%">�̵�д�Ʒ����</td>
	<td  width="3%">�̵㱨��Ʒ����</td>
	<td  width="3%">����Ʒ�̵������</td>
	<td  width="3%">�̵��ܲ�����</td>
	<td  width="6%">�̵���</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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