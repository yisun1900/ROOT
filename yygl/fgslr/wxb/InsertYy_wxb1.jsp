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

String ssfgs=request.getParameter("yy_wxb_ssfgs");
String lrbm=request.getParameter("yy_wxb_ssbm");
String zqs=request.getParameter("yy_wxb_zqs");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String bmmc=null;//��������
String bmrs=null;//��������

String date_ss=null;//���ܿ�ʼʱ��
String date_se=null;//���ܽ���ʱ��
String date_bs=null;//���ܿ�ʼʱ��
String date_be=null;//���ܽ���ʱ��


try {
	conn=cf.getConnection();
 
	
	//��ѯ����
	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs='"+zqs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
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
	ls_sql+=" FROM YY_WXB ";
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
	<form method="POST" name="listform" action="SaveInsertYy_wxb.jsp" target="_blank" >
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
	<tr>
	  <td height="37" colspan="14" align="center">
		<p>
			<input type="button" value="����"  onClick="cf_submit(listform)" >
			<span class="STYLE1">��ע�⣺��������Ҫ��һ��¼�꣬���ܿգ�</span>
		</p>

		<p>    
			<input type="button" value="Excel����" onClick="window.open('LoadData.jsp?ssfgs=<%=ssfgs%>&dwbh=<%=lrbm%>&zqs=<%=zqs%>')"  >
			<A HREF="����������.xls"><B>���ء�����Excel��ģ��</B></A>
		</p>
		</td>
	</tr>
  <tr>
    <td height="41" colspan="14" align="center">������¼���</td>
	<input type="hidden" name="yy_wxb_lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
  </tr>
  <tr>
    <td width="95" height="28" align="center">��������</td>
    <td colspan="3"  align="center"><%=date_ss%>��<%=date_se%></td>
    <td width="81" align="center">��������</td>
    <td colspan="3"  align="center"><%=date_bs%>��<%=date_be%></td>
    <td width="81" align="center">��λ����</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="center">��������</td>
    <td colspan="2" align="center"><%=bmmc%></td>
    <td colspan="2" align="center">����רԱ����</td>
    <td width="87" align="center"><%=bmrs%></td>
    <td width="89">&nbsp;</td>
    <td width="84">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="2" align="center">����</td>
    <td height="20" colspan="5" align="center">Ŀ��ͻ�����</td>
    <td colspan="5" align="center">��ȡ��������</td>
  </tr>
  <tr>
    <td width="55" height="20" align="center">���¼ƻ�</td>
    <td width="82" align="center">�����ۼ�</td>
    <td width="82" align="center">���ܼƻ�</td>
    <td width="81" align="center">�������</td>
    <td align="center">����Ԥ��</td>
    <td align="center">���¼ƻ�</td>
    <td align="center">�����ۼ�</td>
    <td align="center">���ܼƻ�</td>
    <td width="91" align="center">�������</td>
    <td width="102" align="center">����Ԥ��</td>
  </tr>
  <%
    
	String yy_wxb_ygmc=null;
	String ssbm=null;
	
	ls_sql="SELECT dwbh,yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while(rs.next())
	{
		yy_wxb_ygmc=rs.getString("yhmc");
		ssbm=rs.getString("dwbh");

		%>
		<tr align="center" height="20">
			<td height="20" ><%=yy_wxb_ygmc%>
				<input type="hidden" name="yy_wxb_ygmc" value="<%=yy_wxb_ygmc%>">
				<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
				<input type="hidden" name="ssbm" value="<%=ssbm%>">			
			</td>
			<td><input type="text" name="yy_wxbkh_byjh " size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbkh_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="calValue(insertform)"></td>
			<td><input type="text" name="yy_wxbkh_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbkh_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbkh_bzyj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_byjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_bzjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
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

