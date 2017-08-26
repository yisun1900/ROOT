<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<title>
欢迎使用松下亿达主材
</title>
<script language="javascript">
	function SearchFocus() 
	{
		form1.sl.focus();
	}          
</script>
<body onload="SearchFocus()">
<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
String zcbm=request.getParameter("zcbm");
Connection conn  = null;
PreparedStatement ps = null;
ResultSet rs = null;
String ls_sql = "";
String sfyh = null;
String jldwbm = null;
double gmsl = 0;
double gmje = 0;
double yhj = 0;
double cxj = 0;
try
{
	conn=cf.getConnection();
	ls_sql = " select sfyh,jldwbm,yhj,cxj,gmsl,gmje ";
	ls_sql += " FROM jc_zcjgb,HY_KHHDPT ";
	ls_sql += " where jc_zcjgb.zcbm=HY_KHHDPT.zcbm and HY_KHHDPT.zcbm='"+zcbm+"' and HY_KHHDPT.khbh='"+yhbh+"' ";
	//	out.println(sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())                            
	{
		sfyh=cf.fillNull(rs.getString("sfyh"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		yhj=rs.getDouble("yhj");
		cxj=rs.getDouble("cxj");
		gmsl=rs.getDouble("gmsl");
		gmje=rs.getDouble("gmje");
		%>
		<form name="form1" method="post" action="savaEditmycart.jsp">
		<center>
		<font size="+2" color="red"><b>欢迎使用松下亿达主材<br></b></font>
		<font size="-1">说明：修改您定购的数量，回车或者点击【修 改】即可完成修改！</font>
		</center>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
			<tr>
				<td>
					单价：<%=yhj%>/<%=jldwbm%>
				</td>
			</tr>
			<tr>
				<td>
					请输入产品数量：
					<input name="sl" value="<%=gmsl%>" size="10" onKeyup="ss(form1);" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid"  onfocus="this.select()">
					总金额：
					<input name="zje" value="<%=gmje%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>（元）
					<input name="yhj" type="hidden" value="<%=yhj%>" size="5">
					<input name="zcbm" type="hidden" value="<%=zcbm%>" size="5">
				</td>
			</tr>
			<tr> 
				<td colspan="4"> 
					<center>
					<input type="button" name="Submit" value="修 改" onClick="return isValid(form1)">
					<input type="button" name="Submit2" value="返 回" onClick="window.open('mycart.jsp'); window.close()">
					</center>
				</td>
			</tr>
		</table>
		</form>
		<%		
	}
	else {out.print("产品不存在！！！");}
	rs.close();
	ps.close();
}
catch (Exception e) 
{
	out.print("Exception: " + e);
	return;
}
finally 
{
	try
	{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e)
	{
		if (conn != null) cf.close(conn); 
	}
}

%>
<script language="javascript" src="/js/validate.js"></script>
<script language="javascript">
	function isValid(form)
	{
		if(	javaTrim(form.sl)=="") 
		{
		alert("请输入【数量】！");
		form.sl.focus();
		return false;
		}
		if (javaTrim(form.sl)=="0")
		{
			alert("购买数量不能为零！如果您想退定此主材请选择【删除】！");
			form.zje.value="";
			form.sl.value="";
			form.sl.focus();
			return false;
		}
		form.submit();
		return true;
		}
		<!--

		//将单件已选产品加入出库列表               
		function ss(form)
		{
//		alert(escape(FormName.yhdlm.value));
//		if (!(isNumber(form.sl,"定购数量"))){
//			form.zje.value="";
//			form.sl.value="";
//			 form.sl.select();     
//			 return      
//		   } 
//		 if (event.keyCode==48)	
//		{
//			 if (form.sl.value<1)
//			 {
//			alert("定购数量不能为零或小数！");
//			form.zje.value="";
//			form.sl.value="";
//			form.sl.focus();
//			return false;
//			}
//		} 
//		form.zje.value=form.sl.value*form.yhj.value;
		form.zje.value=formatDouble(form.sl.value*form.yhj.value,2);
		if (!(isFloat(form.zje,"定购数量")))
		{
			form.zje.value="";
			form.sl.value="";
			form.sl.select();     
			return      
		} 
		if (event.keyCode==13)	
		{
			if(	javaTrim(form.sl)=="") 
			{
				alert("请输入【数量】！");
				form.sl.focus();
				return false;
			}
			if (javaTrim(form.sl)=="0")
			{
				alert("购买数量不能为零！如果您想退定此主材请选择【删除】！");
				form.zje.value="";
				form.sl.value="";
				form.sl.focus();
				return false;
			}
			form.submit();
			return true;
		}        
	}
</script>
</body>