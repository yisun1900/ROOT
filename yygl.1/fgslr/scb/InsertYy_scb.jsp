<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String bmmc=null;//��������
String bmrs=null;//��������

int zqs=0;
String date_ss=null;//���ܿ�ʼʱ��
String date_se=null;//���ܽ���ʱ��
String date_bs=null;//���ܿ�ʼʱ��
String date_be=null;//���ܽ���ʱ��


try {
	conn=cf.getConnection();

	//��ѯ����
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" order by yy_rqsd_bzs desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zqs=rs.getInt("zqs");
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();

  	//�Ƿ�֮ǰ�Ѿ�¼��� 
	int count=0;
    ls_sql="SELECT count(*)";
	ls_sql+=" FROM yy_scb ";
	ls_sql+=" where zqs='"+zqs+"' and ssbm='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		count=rs.getInt(1);
    }
    rs.close();
	ps.close();

	if (count>0)
	{
		out.println("���Ѿ�¼�������ݣ��뵽��ά�����н����޸Ļ����ӣ�");
		return;
	}
	
 		
    //��ѯ������������
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bmmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	
	//��ѯ��������
	ls_sql="SELECT count(*) rs";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		bmrs=rs.getString("rs");
	}
	rs.close();
	ps.close();

	
	%>
	<form method="POST" name="listform" action="SaveInsertYy_scb.jsp" target="_blank" >
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
	<tr bgcolor="#999999">

	  <td height="25" colspan="14" align="center">
		<p>
			<input type="button" value="����"  onClick="cf_submit(listform)" >
			<span class="STYLE1">��ע�⣺��������Ҫ��һ��¼�꣬���ܿգ�</span>
		</p>

		<p>    
			<input type="button" value="Excel����" onClick="window.open('LoadData.jsp')"  >
			<A HREF="�г�������.xls"><B>���ء�����Excel��ģ��</B></A>
		</p>

	  </td>
	</tr>
  <tr>
    <td height="25" colspan="14" align="center">�г���¼�����������<%=zqs%>��
	<input type="hidden" name="yy_scb_lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>"></td>
  </tr>
  <tr>
    <td width="88" height="28" align="center">��������</td>
    <td colspan="3"><%=date_ss%>��<%=date_se%></td>
    <td width="86" align="center">��������</td>
    <td colspan="3"><%=date_bs%>��<%=date_be%></td>
    <td colspan="3">��λ����</td>
    </tr>
  <tr>
    <td height="28" align="center">��������</td>
    <td colspan="2" align="center"><%=bmmc%></td>
    <td colspan="2" align="center">��װ��������</td>
    <td width="74" align="center"><%=bmrs%></td>
    <td width="86">&nbsp;</td>
    <td width="95">&nbsp;</td>
    <td width="80">&nbsp;</td>
	 <td width="80">&nbsp;</td>
	  <td width="80">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="2" align="center">����</td>
    <td height="30" colspan="5" align="center">Ŀ��ͻ�����</td>
    <td colspan="5" align="center">��ȡ��������</td>
  </tr>
  <tr>
    <td width="79" height="30" align="center">���¼ƻ�</td>
    <td width="87" align="center">�����ۼ�</td>
    <td width="90" align="center">���ܼƻ�</td>
    <td align="center">�������</td>
    <td align="center">����Ԥ��</td>
    <td align="center">���¼ƻ�</td>
    <td align="center">�����ۼ�</td>
    <td align="center">���ܼƻ�</td>
    <td align="center">�������</td>
    <td align="center">����Ԥ��</td>
  </tr>
  <%
	
	
	
    
	String yy_scb_ygmc=null;
	String ssfgs=null;
	String ssbm=null;
	
	ls_sql="SELECT ssfgs,dwbh,yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while(rs.next())
	{
		yy_scb_ygmc=rs.getString("yhmc");
		ssfgs=rs.getString("ssfgs");
		ssbm=rs.getString("dwbh");

		%>
		<tr align="center"  height="20">
			<td ><%=yy_scb_ygmc%>
				<input type="hidden" name="yy_scb_ygmc" value="<%=yy_scb_ygmc%>">
				<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
				<input type="hidden" name="ssbm" value="<%=ssbm%>">			
			</td>

			<td><input type="text" name="yy_scbkh_byjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbkh_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
			<td ><input type="text" name="yy_scbkh_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbkh_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbkh_bzyj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			
			<td ><input type="text" name="yy_scbdj_byjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbdj_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbdj_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbdj_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td ><input type="text" name="yy_scbdj_bzjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
		</tr>
		<% 
	}
	rs.close();
	ps.close();
		

	%>
</table>
</form>
<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	formName.submit();
	return true;
} 


//-->
</script>

