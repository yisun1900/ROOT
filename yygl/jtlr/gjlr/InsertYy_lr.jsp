<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {	color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");

String bmmc=null;//��������
String bmrs=null;//��������

int zqs=0;
String date_ss=null;//���ܿ�ʼʱ��
String date_se=null;//���ܽ���ʱ��
String date_bs=null;//���ܿ�ʼʱ��
String date_be=null;//���ܽ���ʱ��

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
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
	ls_sql+=" FROM YY_LR ";
	ls_sql+=" where zqs='"+zqs+"'";
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
	%>

<form  name="insert" method="post" action="SaveInsertYy_lr.jsp" target="_blank">
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
<tr>
 <td height="37" colspan="14" align="left">
 <input type="button" value="����" onClick="dos(insert)">
	<input type="hidden" name="lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
	
    <span class="STYLE1">��ע�⣺��������Ҫ��һ��¼�꣬���ܿգ�</span>
		
	<BR><BR>
	<input type="button" value="Excel����" onClick="window.open('LoadData.jsp')"  >
	<A HREF="�ؼ�����ָ��¼��.xls"><B>���ء�����Excel��ģ��</B></A>
	</td>
</tr>
<tr >
<td colspan="13" align="center" >�ؼ�����ָ��¼���</td>
</tr>
	<tr>
    <td  height="28" align="center" width="148">��������</td>
    <td colspan="3"  align="center"><%=date_ss%>��<%=date_se%></td>
    <td width="111"  align="center" >��������</td>
    <td colspan="4"  align="center"><%=date_bs%>��<%=date_be%></td>
    </tr>
<tr>
<td rowspan="2" align="center">�ֹ�˾</td>
<td colspan="2" align="center">�ͻ�����ѱ���</td>
<td colspan="2" align="center">˰����������</td>
<td colspan="2" align="center">����ë����</td>
<td colspan="2" align="center">����ë����</td>
</tr>
<tr align="center">
	<td  width="11%%">Ӧ�ձ���(%)</td>
	<td  width="11%%">ʵ����ȡ(%)</td>
	<td  width="11%%">Ӧ�ձ���(%)</td>
	<td  width="11%%">ʵ����ȡ(%)</td>
	<td  width="11%%">ȥ��ƽ��(%)</td>
	<td  width="11%%">����ָ��(%)</td>
	<td  width="11%%">ȥ��ƽ��(%)</td>
	<td  width="11%%">����ָ��(%)</td>
</tr>

	<%
	String dwbh=null;
	String dwmc=null;
	ls_sql="select  dwbh,dwmc ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N' order by dwbh";
	ps=conn.prepareStatement(ls_sql);
    rs=ps.executeQuery(ls_sql);
	while(rs.next())
	{
		dwbh=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");
%>


<tr align="center">
<td ><%=dwmc%>
	<input type="hidden" name="yy_lr_fgs" value="<%=dwbh%>">	
	<input type="hidden" name="dwmc" value="<%=dwmc%>">	
	</td>

<td><input type="text" name="yy_lrglf_ysbl" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_lrglf_sjsq" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"   ></td>
<td><input type="text" name="yy_lrsj_ysbl" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_lrsj_sjsq" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_lrgc_qnpj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_lrgc_bzzs" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_lrzc_qnpj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_lrzc_bzzs" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
</tr>


<%
}
rs.close();
ps.close();




}
catch (Exception e) {
	out.print("Exception: " + e);
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
</table>
</form>
</body>
</html>
<SCRIPT language="javascript">
<!--
function dos(FormName)
{
	FormName.submit();
	return true;
}
//-->
</script>