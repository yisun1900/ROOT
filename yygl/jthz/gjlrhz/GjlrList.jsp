<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	
	String wheresql="";
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	String zqs=request.getParameter("zqs");//������
	try
	{
		conn=cf.getConnection();

		ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
		ls_sql+=" FROM yy_rqsd ";
		ls_sql+=" where zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_rqsd_szs=cf.fillNull(rs.getDate("yy_rqsd_szs"));
			yy_rqsd_sze=cf.fillNull(rs.getDate("yy_rqsd_sze"));
			yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
			yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
		}
		rs.close();
		ps.close();
		}
		catch (Exception e) {
		out.print("Exception: " + e);
		out.print(ls_sql);
		return;
	}
	
%>
<body>

<div align="center">�ؼ�����ָ����ܱ�</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">�������ڣ�</td>
 <td width="20%"><%=yy_rqsd_szs%> �� <%=yy_rqsd_sze%></td>
<td width="11%" align="right">�������ڣ�</td>
 <td width="20%" ><%=yy_rqsd_bzs%> �� <%=yy_rqsd_bze%></td>
 <td width="38%" >&nbsp;</td>

  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td rowspan="2"   width="10%"><span class="STYLE1">�ֹ�˾</span></td>
	<td colspan="3" >�ͻ�����ѱ���</td>
	<td colspan="3" >˰����������</td>
	<td colspan="3" >����ë����</td>
	<td colspan="3" >����ë����</td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ӧ�ձ���</td>
	<td  width="7%">ʵ����ȡ</td>
	<td  width="7%">������</td>
	<td  width="7%">Ӧ�ձ���</td>
	<td  width="7%">ʵ����ȡ</td>
	<td  width="7%">������</td>
	<td  width="7%">ȥ��ƽ��</td>
	<td  width="7%">����ָ��</td>
	<td  width="7%">������</td>
	<td  width="7%">ȥ��ƽ��</td>
	<td  width="7%">����ָ��</td>
	<td  width="7%">������</td>
	</tr>
 <%
	 ls_sql="select dwmc,yy_lrglf_ysbl||'%',yy_lrglf_sjsq||'%',(yy_lrglf_sjsq-yy_lrglf_ysbl)||'%' i,yy_lrsj_ysbl||'%',yy_lrsj_sjsq||'%',(yy_lrsj_sjsq-yy_lrsj_ysbl)||'%' j,yy_lrgc_qnpj||'%',yy_lrgc_bzzs||'%',(yy_lrgc_bzzs-yy_lrgc_qnpj)||'%' k,yy_lrzc_qnpj||'%',yy_lrzc_bzzs||'%',(yy_lrzc_bzzs-yy_lrzc_qnpj)||'%' l";
	ls_sql+=" from Yy_lr,sq_dwxx";
	ls_sql+=" where Yy_lr.yy_lr_fgs=sq_dwxx.dwbh(+) and zqs='"+zqs+"'";
	ls_sql+=" order by Yy_lr.yy_lr_fgs ";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</body>

</html>
