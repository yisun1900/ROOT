<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>材料员业绩考核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String getygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权


String khzq=cf.GB2Uni(request.getParameter("khzq"));
String fgsbh=cf.GB2Uni(request.getParameter("ssfgs"));
String getdwbh=cf.GB2Uni(request.getParameter("dwbh"));

String zwbm="08";

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
String xuhao=null;

String olddwmc="";

String bgcolor="";

int rownum=0;

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
<center>材料员业绩考核（周期:<%=khqssj%>到<%=khjzsj%>）</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"> 
  <td colspan="12" > 
	<div align="center"> 
	  <input type="button"  value="保存" onClick="f_do(editform)"  >
	</div>
  </td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="15%">部门名称</td>
	<td  width="6%">员工编号</td>
	<td  width="10%">工号</td>
	<td  width="8%">姓名</td>
	<td  width="8%">投诉率</td>
	<td  width="8%">投诉得分</td>
	<td  width="8%">订单进度记录</td>
	<td  width="8%">按规范使用系统</td>
	<td  width="8%">投诉及时处理</td>
	<td  width="8%">违反日常管理制度</td>
	<td  width="8%">日常业务及流程考核</td>


</tr>

<%


	int row=0;

	ls_sql="SELECT sq_yhxx.dwbh,sq_dwxx.dwmc,sq_yhxx.xuhao,sq_yhxx.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,xzzwbm";
	ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.sfzszg not in('S','T')";
	ls_sql+=" and (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')) ";
    ls_sql+=" and sq_yhxx.ssfgs='"+fgsbh+"'";
	if (!getdwbh.equals(""))
	{
		ls_sql+=" and sq_yhxx.dwbh='"+getdwbh+"'";
	}
 
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+getygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+getygbh+"' )";
	}
	
	ls_sql+=" and sq_yhxx.zwbm='"+zwbm+"'";
    ls_sql+=" order  by sq_dwxx.xuhao,sq_dwxx.ssfgs,sq_dwxx.dwbh,sq_yhxx.xuhao,sq_yhxx.yhmc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		if (rownum>5000)
		{
			out.println("错误！结果不能大于5000行");
			return;
		}

		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));

		String clzt="";
		int khfs=0;
		int tsl=0;
		int tslfs=0;
		int ddjdfs=0;
		int xtsyfs=0;
		int tsclfs=0;
		int rcglfs=0;
		int lckhfs=0;
		String khfsStr="";
		String tslStr="";
		String tslfsStr="";
		String ddjdfsStr="";
		String xtsyfsStr="";
		String tsclfsStr="";
		String rcglfsStr="";
		String lckhfsStr="";
		ls_sql="select clzt,khfs,tsl,tslfs,ddjdfs,xtsyfs,tsclfs,rcglfs,lckhfs ";
		ls_sql+=" from  cw_jrclyjxkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+yhmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			clzt=cf.fillNull(rs1.getString("clzt"));
			khfs=rs1.getInt("khfs");
			tsl=rs1.getInt("tsl");
			tslfs=rs1.getInt("tslfs");
			ddjdfs=rs1.getInt("ddjdfs");
			xtsyfs=rs1.getInt("xtsyfs");
			tsclfs=rs1.getInt("tsclfs");
			rcglfs=rs1.getInt("rcglfs");
			lckhfs=rs1.getInt("lckhfs");

			khfsStr=khfs+"";
			tslStr=tsl+"";
			tslfsStr=tslfs+"";
			ddjdfsStr=ddjdfs+"";
			xtsyfsStr=xtsyfs+"";
			tsclfsStr=tsclfs+"";
			rcglfsStr=rcglfs+"";
			lckhfsStr=lckhfs+"";
		}
		rs1.close();
		ps1.close();

		if (clzt.equals("2"))
		{
			out.println("错误！已审核，不能再修改");
			return;
		}

	

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
				<input type="hidden" name="bianhao"  value="<%=bianhao%>" >
			</td>
			<td><%=ygbh%></td>
			<td><%=bianhao%></td>
			<td><%=yhmc%></td>
			<td>
				<input type="text" name="tsl" value="<%=tslStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="tslfs" value="<%=tslfsStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="ddjdfs" value="<%=ddjdfsStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="xtsyfs" value="<%=xtsyfsStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="tsclfs" value="<%=tsclfsStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="rcglfs" value="<%=rcglfsStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="lckhfs" value="<%=lckhfsStr%>" size="6" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr bgcolor="#CCCCCC"> 
  <td colspan="12" > 
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

	FormName.action="SaveChooseYhmc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


