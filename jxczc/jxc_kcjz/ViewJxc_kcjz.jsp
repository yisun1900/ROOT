<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jzph=null;
String ckbh=null;
String zcpzsl=null;
String zcpzjg=null;
String ccpzsl=null;
String ccpzje=null;
String bfpzsl=null;
String bfpzje=null;
String jzrq=null;
String wherejzph=null;
wherejzph=cf.GB2Uni(request.getParameter("jzph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jzph,ckmc ckbh,zcpzsl,zcpzjg,ccpzsl,ccpzje,bfpzsl,bfpzje,jzrq ";
	ls_sql+=" from  jxc_kcjz,jxc_ckmc";
	ls_sql+=" where jxc_kcjz.ckbh=jxc_ckmc.ckbh and  (jzph='"+wherejzph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jzph=cf.fillNull(rs.getString("jzph"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		zcpzsl=cf.fillNull(rs.getString("zcpzsl"));
		zcpzjg=cf.fillNull(rs.getString("zcpzjg"));
		ccpzsl=cf.fillNull(rs.getString("ccpzsl"));
		ccpzje=cf.fillNull(rs.getString("ccpzje"));
		bfpzsl=cf.fillNull(rs.getString("bfpzsl"));
		bfpzje=cf.fillNull(rs.getString("bfpzje"));
		jzrq=cf.fillNull(rs.getDate("jzrq"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �鿴��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ת����
  </td>
  <td width="35%"> 
    <%=jzph%>
  </td>
  <td align="right" width="15%"> 
    �ֿ�����
  </td>
  <td width="35%"> 
    <%=ckbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ����Ʒ������
  </td>
  <td width="35%"> 
    <%=zcpzsl%>
  </td>
  <td align="right" width="15%"> 
    ����Ʒ�ܽ��
  </td>
  <td width="35%"> 
    <%=zcpzjg%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �д�Ʒ������
  </td>
  <td width="35%"> 
    <%=ccpzsl%>
  </td>
  <td align="right" width="15%"> 
    �д�Ʒ�ܽ��
  </td>
  <td width="35%"> 
    <%=ccpzje%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ����Ʒ������
  </td>
  <td width="35%"> 
    <%=bfpzsl%>
  </td>
  <td align="right" width="15%"> 
    ����Ʒ�ܽ��
  </td>
  <td width="35%"> 
    <%=bfpzje%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ת����
  </td>
  <td width="35%"> 
    <%=jzrq%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
</table>
</body>
</html>


<%
	String ls_sqlq=null;
	String wheresqljzph=cf.GB2Uni(request.getParameter("jzph"));
	ls_sqlq="SELECT jxc_kcjzmx.clbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_kcjzmx.zsl,TO_CHAR(jxc_kcjzmx.jqpjcbj),jxc_kcjzmx.zjg,TO_CHAR(jxc_cljgb.xsj),jxc_cljgb.xsj*jxc_kcjzmx.zsl,TO_CHAR(jxc_cljgb.dgzjg),jxc_cljgb.dgzjg*jxc_kcjzmx.zsl,jxc_clbm.nbbm,DECODE(jxc_kcjzmx.zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>') zljb";
	ls_sqlq+=" FROM jxc_kcjzmx,jxc_clbm,jxc_kcjz,jxc_ckmc,jxc_cljgb  ";
    ls_sqlq+=" where jxc_kcjzmx.jzph='"+wheresqljzph+"' and jxc_kcjzmx.clbm=jxc_clbm.clbm ";
	ls_sqlq+=" and jxc_kcjzmx.jzph=jxc_kcjz.jzph and jxc_kcjz.ckbh=jxc_ckmc.ckbh";
	ls_sqlq+=" and jxc_kcjzmx.clbm=jxc_cljgb.clbm and jxc_ckmc.dqbm=jxc_cljgb.dqbm";
	ls_sqlq+=" order by jxc_kcjzmx.clbm ";
    pageObj.sql=ls_sqlq;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000000);
/*
//������ʾ��
	String[] disColName={"jzph","clbm","zljb","jxc_kcjzmx_zsl","jxc_kcjzmx_zjg"};
	pageObj.setDisColName(disColName);
*/

//��������
//	String[] keyName={"jzph","clbm","zljb"};
//	pageObj.setKey(keyName);
	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("clbm","1");//�в����������Hash��	
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
&nbsp;<br>
<CENTER >
��ϸ��Ϣ
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">���ϱ���</td>
	<td  width="12%">��������</td>
	<td  width="12%">�ͺ�</td>
	<td  width="10%">���</td>
	<td  width="6%">������</td>
	<td  width="5%">�ɱ���</td>
	<td  width="8%">�ɱ����</td>
	<td  width="5%">���ۼ�</td>
	<td  width="8%">���ۼ۽��</td>
	<td  width="5%">�Թ����۸�</td>
	<td  width="8%">�Թ����۸���</td>
	<td  width="9%">�ڲ�����</td>
	<td  width="4%">��������</td>
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