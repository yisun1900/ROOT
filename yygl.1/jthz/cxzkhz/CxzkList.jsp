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

<div align="center">�����ۿ�ָ����ܱ�</div>
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
	<td rowspan="2"  width="10%"><span class="STYLE1">�ֹ�˾</span></td>
	<td colspan="3" >ֱ���ۿ�</td>
	<td colspan="3" >��Ʒ��ȯ</td>
	<td colspan="3" >���̷���</td>
	<td colspan="3" >�����ϼ�</td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center">
	<td width="7%">ȥ��ƽ��</td>
	<td width="7%">����ָ��</td>
	<td width="7%">������</td>
	<td width="7%">ȥ��ƽ��</td>
	<td width="7%">����ָ��</td>
	<td width="7%">������</td>
	<td width="7%">ȥ��ƽ��</td>
	<td width="7%">����ָ��</td>
	<td width="7%">������</td>
	<td width="7%">ȥ��ƽ��</td>
	<td width="7%">����ָ��</td>
	<td width="7%">������</td>
	</tr>
 <%
 	 ls_sql="select dwmc,yy_cxzjzk_qnpj||'%',yy_cxzjzk_bzzs||'%',(yy_cxzjzk_qnpj-yy_cxzjzk_bzzs)||'%' i,yy_cxzpzq_qnpj||'%',yy_cxzpzq_bzzs||'%',(yy_cxzpzq_qnpj-yy_cxzpzq_bzzs)||'%' j,yy_cxgcfx_qnpj||'%',yy_cxgcfx_bzzs||'%',(yy_cxgcfx_qnpj-yy_cxgcfx_bzzs)||'%' k,yy_cxrlhj_qnpj||'%',yy_cxrlhj_bzzs||'%',(yy_cxrlhj_qnpj-yy_cxrlhj_bzzs)||'%' l";
	ls_sql+=" from Yy_cx,sq_dwxx";
	ls_sql+=" where Yy_cx.yy_cx_fgs=sq_dwxx.dwbh(+) and zqs='"+zqs+"'";
	ls_sql+=" order by Yy_cx.yy_cx_fgs ";
	pageObj.sql=ls_sql;
	//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%> 

</body>

</html>
