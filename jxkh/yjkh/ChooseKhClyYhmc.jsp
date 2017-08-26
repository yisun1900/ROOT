<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>业绩考核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String khzq=cf.GB2Uni(request.getParameter("khzq"));
	String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
	String zwbm=cf.GB2Uni(request.getParameter("zwbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dwbh=null;
String dwmc=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;

String olddwmc="";

String bgcolor="";

try {
	conn=cf.getConnection();

	String khqssj=null;
	String khjzsj=null;
	ls_sql="select khqssj,khjzsj ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=cf.fillNull(rs.getDate("khqssj"));
		khjzsj=cf.fillNull(rs.getDate("khjzsj"));
	}
	rs.close();
	ps.close();
%>

<form method="post" action="" name="editform" target="_blank">
<center>业绩考核（周期:<%=khqssj%>到<%=khjzsj%>）</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"> 
  <td colspan="9" > 
	<div align="center"> 
	  <input type="button"  value="保存" onClick="f_do(editform)"  >
	</div>
  </td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="15%">部门名称</td>
	<td  width="10%">工号</td>
	<td  width="10%">姓名</td>
	<td  width="12%">职务</td>
	<td  width="12%">本月任务</td>
	<td  width="12%">本月签单数</td>
	<td  width="12%">本月业绩</td>
	<td  width="12%">考核比例</td>
</tr>

<%


	int row=0;
	double byrw=0;
	int byqds=0;
	double byyj=0;
	double dzkhbl=0;

	ls_sql="SELECT cw_jryjkh.dwbh,sq_dwxx.dwmc,cw_jryjkh.ygbh,cw_jryjkh.bianhao,cw_jryjkh.yhmc,sq_yhxx.xzzwbm";
	ls_sql+=" ,byrw,byqds,byyj,dzkhbl ";
	ls_sql+=" FROM cw_jryjkh,sq_dwxx,sq_yhxx  ";
    ls_sql+=" where cw_jryjkh.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_jryjkh.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=" and cw_jryjkh.fgsbh='"+fgsbh+"'";
    ls_sql+=" and cw_jryjkh.zw='"+zwbm+"'";
    ls_sql+=" order  by cw_jryjkh.dwbh,cw_jryjkh.yhmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));

		byrw=rs.getDouble("byrw");
		byqds=rs.getInt("byqds");
		byyj=rs.getDouble("byyj");
		dzkhbl=rs.getDouble("dzkhbl");


		//设计师业绩＋＋＋＋＋＋＋开始
		//签单客户
		ls_sql="select count(*),sum(qye)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where dwbh='"+dwbh+"' and clgw='"+yhmc+"'";
		ls_sql+=" and crm_khxx.zt!='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and crm_khxx.sjsjsbz='0'";//0：未提成；1：签单提成；2：结算提成
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+khqssj+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+khjzsj+"','YYYY-MM-DD') ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			byqds=rs1.getInt(1);
			byyj=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//签单客户
		int tds=0;
		double tdje=0;
		ls_sql="select count(*),sum(qye)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where dwbh='"+dwbh+"' and clgw='"+yhmc+"'";
		ls_sql+=" and crm_khxx.zt='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and crm_khxx.sjsjsbz='1'";//0：未提成；1：签单提成；2：结算提成
		ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+khqssj+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+khjzsj+"','YYYY-MM-DD') ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tds=rs1.getInt(1);
			tdje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		byqds=byqds-tds;
		byyj=cf.round(byyj-tdje,2);

		if (byrw!=0)
		{
			dzkhbl=cf.round(byyj*100/byrw,2);
		}
		else{
			dzkhbl=0;
		}

		//设计师业绩＝＝＝＝＝＝＝结束

	
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=(row+1)%></td>
			<td><%=dwmc%>
				<input type="hidden" name="ygbh"  value="<%=ygbh%>" >
			</td>
			<td><%=bianhao%></td>
			<td><%=yhmc%></td>
			<td><%=xzzwbm%></td>
			<td><%=byrw%></td>
			<td><%=byqds%>
				<input type="hidden" name="byqds"  value="<%=byqds%>" >
			</td>
			<td><%=byyj%>
				<input type="hidden" name="byyj"  value="<%=byyj%>" >
			</td>
			<td><%=dzkhbl%>％
				<input type="hidden" name="dzkhbl"  value="<%=dzkhbl%>" >
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr bgcolor="#CCCCCC"> 
  <td colspan="9" > 
	<div align="center"> 
		<input type="hidden" name="khzq"  value="<%=khzq%>" >
		<input type="hidden" name="fgsbh"  value="<%=fgsbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>


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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.action="SaveChooseKhYhmc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


