<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String jmfl=cf.GB2Uni(cf.getParameter(request,"jmfl"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveZcjmFl.jsp" name="insertform">
<div align="center">主材减免（增减项序号:<%=zjxxh%>、减免分类:<%=jmfl%>）</div>



<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">结构位置</td>
	<td  width="12%">产品类别</td>
	<td  width="13%">套餐升级分类</td>
	<td  width="7%">报价级别</td>
	<td  width="8%">是否限制数量</td>
	<td  width="7%">标准数量</td>
	<td  width="6%">实际数量</td>
	<td  width="6%">是否可减免</td>
	<td  width="6%">减免计量单位</td>
	<td  width="7%">减免单价</td>
	<td  width="7%">允许减免最大数量</td>
	<td  width="19%"><span class="STYLE1">*</span><span class="STYLE4">实际减免数量</span></td>
</tr>


<%
String bjjbbm=null;
String bjjbmc=null;
String jgwzbm=null;
String tcsjflbm=null;
String tcsjflmc=null;
String tccplbbm=null;
String clxlmc=null;

String sfxzsl="";
String sfxzslStr="";
String sfkjm="";//是否可减免  1：限制；3：不限制
String sfkjmStr="";
double yxjmzdsl=0;//允许减免最大数量
double jmdj=0;//减免单价
double sjjmsl=0;//实际减免数量
double sjjmje=0;//实际减免金额
double sjsl=0;//实际数量
double bzsl=0;//标准数量
String txxx="";
String sjjmslStr="";
String jmjldw="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
int row=0;
try {
	conn=cf.getConnection();



	ls_sql="select bj_khzcxmxjh.jmjldw,bj_khzcxmxjh.sjsl,bj_khzcxmxjh.bjjbbm,bjjbmc,jgwzbm,bj_khzcxmxjh.tccplbbm,jxc_clxlbm.clxlmc,bj_khzcxmxjh.tcsjflbm,tcsjflmc,bj_khzcxmxjh.sfxzsl,DECODE(bj_khzcxmxjh.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzslStr,bj_khzcxmxjh.sfkjm,DECODE(bj_khzcxmxjh.sfkjm,'1','不可减免','2','可减免') sfkjmStr,bj_khzcxmxjh.yxjmzdsl,bj_khzcxmxjh.jmdj,bj_khzcxmxjh.sjjmsl,bj_khzcxmxjh.sjjmje,bj_khzcxmxjh.sjsl,bj_khzcxmxjh.bzsl";
	ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm";
	ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jmfl='"+jmfl+"' and bj_khzcxmxjh.sfkjm='2'";
	ls_sql+=" and bj_khzcxmxjh.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
	ls_sql+=" and bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
	ls_sql+=" and bj_khzcxmxjh.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" order by bj_khzcxmxjh.jgwzbm,bj_khzcxmxjh.tcsjflbm,bj_khzcxmxjh.tccplbbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jmjldw=cf.fillHtml(rs.getString("jmjldw"));
		sjsl=rs.getDouble("sjsl");
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		tcsjflmc=cf.fillNull(rs.getString("tcsjflmc"));
		sfxzslStr=cf.fillNull(rs.getString("sfxzslStr"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");
		bzsl=rs.getDouble("bzsl");

		row++;

		if (sjsl>0)
		{
			out.println("错误！"+jgwzbm+":"+clxlmc+":已选择主材数量:"+sjsl+"，不可减免，请先删除主材");
			return;
		}

		if (sjjmsl==0)
		{
			sjjmslStr="";
		}
		else{
			sjjmslStr=""+sjjmsl;
		}



		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=jgwzbm%></td>
			<td><%=clxlmc%></td>
			<td><%=tcsjflmc%></td>
			<td><%=bjjbmc%></td>
			<td><%=sfxzslStr%></td>
			<td><%=bzsl%></td>
			<td><%=sjsl%></td>
			<td><%=sfkjmStr%></td>
			<td><%=jmjldw%></td>
			<td><%=jmdj%></td>
			<td><%=yxjmzdsl%></td>
			<td>
				<input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
				<input name="yxjmzdsl" type="hidden" value="<%=yxjmzdsl%>">
				<input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
				<input type="text" name="sjjmsl" size="12" value="<%=sjjmslStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			
			</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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



<tr bgcolor="#CCCCCC"  align="center">
      <td colspan="12"> 
		<input name="zjxxh" type="hidden" value="<%=zjxxh%>">
		<input name="jmfl" type="hidden" value="<%=jmfl%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	 </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		if(	javaTrim(FormName.sjjmsl)=="") {
			alert("请输入[减免数量]！");
			FormName.sjjmsl.focus();
			return false;
		}
		if(!(isFloat(FormName.sjjmsl, "减免数量"))) {
			return false;
		}
		if (parseFloat(FormName.sjjmsl.value)>parseFloat(FormName.yxjmzdsl.value))
		{
			alert("错误！[减免数量]超过允许最大值:"+FormName.yxjmzdsl.value);
			FormName.sjjmsl.select();
			return false;
		}
		if (parseFloat(FormName.sjjmsl.value)<0)
		{
			alert("错误！[减免数量]不能小于0");
			FormName.sjjmsl.select();
			return false;
		}
	}
	else{
		for (var i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.sjjmsl[i])=="") {
				alert("请输入[减免数量]！");
				FormName.sjjmsl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.sjjmsl[i], "减免数量"))) {
				return false;
			}
			if (parseFloat(FormName.sjjmsl[i].value)>parseFloat(FormName.yxjmzdsl[i].value))
			{
				alert("错误！[减免数量]超过允许最大值:"+FormName.yxjmzdsl[i].value);
				FormName.sjjmsl[i].select();
				return false;
			}
			if (parseFloat(FormName.sjjmsl[i].value)<0)
			{
				alert("错误！[减免数量]不能小于0");
				FormName.sjjmsl[i].select();
				return false;
			}
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
