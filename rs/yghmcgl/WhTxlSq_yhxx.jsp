<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>通讯录---维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<form method="post" action="" name="editform" target="_blank">
<center>通讯录---维护</center>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="14%">部门名称</td>
	<td  width="14%">小组</td>
	<td  width="6%">姓名</td>
	<td  width="8%">职务</td>
	<td  width="5%">排序序号</td>
	<td  width="9%">工号</td>
	<td  width="16%">手机</td>
	<td  width="16%">办公电话</td>
	<td  width="13%">电话是否公布</td>
</tr>
<%
	String getygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String wheresql="";
	String sq_yhxx_yhmc=null;
	String ssfgs=null;
	String sq_yhxx_dwbh=null;

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dwmc=null;
String xz=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;
String xuhao=null;
String dh=null;
String bgdh=null;
String dhsfgb=null;
String olddwmc="";

String bgcolor="";

int rownum=0;

try {
	conn=cf.getConnection();

	int row=0;

	ls_sql="SELECT a.dwmc||'（'||a.dwdh||'）' as dwmc,b.dwmc xz,sq_yhxx.xuhao,sq_yhxx.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,xzzwbm,sq_yhxx.dh,sq_yhxx.bgdh,dhsfgb";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh  and sq_yhxx.sjsbh=b.dwbh(+)  and sq_yhxx.sfzszg not in('S','T')";
	ls_sql+=" and sq_yhxx.ygbh!=1";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+getygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+getygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order  by a.xuhao,sq_yhxx.ssfgs,a.dwbh,b.dwbh,sq_yhxx.xuhao,sq_yhxx.yhmc";

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

		dwmc=cf.fillNull(rs.getString("dwmc"));
		xz=cf.fillHtml(rs.getString("xz"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		dh=cf.fillNull(rs.getString("dh"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		dhsfgb=cf.fillNull(rs.getString("dhsfgb"));

/*
		if (dwmc.equals(olddwmc))
		{
			dwmc="<font color='#0000FF'>同上</font>";
		}
		else{
			olddwmc=dwmc;
		}
*/
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
			</td>
			<td><%=xz%>
			</td>
			<td><%=yhmc%>
				<input type="hidden" name="ygbh"  value="<%=ygbh%>" >
			</td>
			<td><%=xzzwbm%></td>
			<td>
				<input type="text" name="xuhao" value="<%=xuhao%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bianhao[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bianhao" value="<%=bianhao%>" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dh[<%=row%>])">
			</td>
			<td>
				<input type="text" name="dh" value="<%=dh%>" size="20" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bgdh[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bgdh" value="<%=bgdh%>" size="20" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bianhao[<%=(row+1)%>])">
			</td>
			<td>
                <select name="dhsfgb" style="FONT-SIZE:12PX;WIDTH:72PX">
<%
	cf.selectToken(out,"1+本公司内&2+不受限&9+不公布",dhsfgb);
%>
				</select>
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

	FormName.action="SaveWhTxlSq_yhxx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


