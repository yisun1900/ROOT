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
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");

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
	ls_sql+=" FROM YY_SJ ";
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


<form  name="insert" method="post" action="SaveInsertYy_sj.jsp" target="_blank">
<table width="170%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
<tr>
 <td height="37" colspan="15" align="left">
 <input type="button" value="����" onClick="dos(insert)">
	<input type="hidden" name="lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
	
    <span class="STYLE1">��ע�⣺��������Ҫ��һ��¼�꣬���ܿգ� 
    <input name="button" type="button" onClick="window.open('enetercopy.jsp')" value="�����¶�ָ��">
    </span>
		
	<BR><BR>
	<input type="button" value="Excel����" onClick="window.open('LoadData.jsp')"  >
	<A HREF="�¶�ָ���ͬ������¼��.xls"><B>���ء�����Excel��ģ��</B></A>
	
	</td>
</tr>
<tr>
<td colspan="15" align="center" >�¶�ָ���ͬ������¼���</td>
</tr>
<tr>
    <td  height="28" align="center" width="242">��������</td>
    <td colspan="6"  align="center"><%=date_ss%>��<%=date_se%></td>
    <td  align="center" >��������</td>
    <td colspan="7"  align="center" ><%=date_bs%>��<%=date_be%></td>
  </tr>
<tr>
<td rowspan="2" align="center">�ֹ�˾</td>
<td colspan="2" align="center">�ܿ�Դ</td>

<td colspan="2" align="center">�г���</td>
<td colspan="2" align="center">������</td>

<td colspan="4" align="center">��Ʋ�</td>

<td colspan="2" align="center">�ҾӲ�</td>

<td colspan="2" align="center">��������</td>
</tr>
<tr align="center">
<td width="130" >Ŀ��ͻ��������¼ƻ�</td>
<td width="130" >��ȡ�����������¼ƻ�</td>

<td width="130" >Ŀ��ͻ��������¼ƻ�</td>
<td width="130" >��ȡ�����������¼ƻ�</td>
<td width="130" >Ŀ��ͻ��������¼ƻ�</td>
<td width="130" >��ȡ�����������¼ƻ�</td>

<td width="130" >��Ʒѱ��¼ƻ�</td>
<td width="130" >ȥ��ͬ���¶���Ʒ�</td>
<td width="130" >���̲�ֵ���¼ƻ�</td>
<td width="130" >ȥ��ͬ���¶ȹ��̲�ֵ</td>

<td width="130" >���Ĳ�ֵ���¼ƻ�</td>
<td width="130" >ȥ��ͬ���¶����Ĳ�ֵ</td>

<td width="130" >Ŀ��ͻ��������¼ƻ�</td>
<td width="130" >��ȡ�����������¼ƻ�</td>
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
	<input type="hidden" name="yy_sj_fgs" value="<%=dwbh%>">	
	<input type="hidden" name="dwmc" value="<%=dwmc%>">	</td>

<td><input type="text" name="yy_sjzky_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjzky_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjscb_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjscb_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjwxb_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjwxb_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjsjb_sjf" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjsjb_tqsjf" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjsjb_gccz" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjsjb_tqgccz" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjjjb_byjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjjjb_qntq" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjqtqd_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjqtqd_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
</tr>


<%
}
rs.close();
ps.close();

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
<%
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