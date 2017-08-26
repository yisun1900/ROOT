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
double yhj = 0;
double cxj = 0;
String today;
try{
	conn=cf.getConnection();
	ls_sql = " select * from HY_KHHDPT where khbh='"+yhbh+"' and zcbm='"+zcbm+"' and khwjbz='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())                            
		{%>
		<script language="javascript">
		alert("您已经定购了此产品！");
//	    return;
		window.close()
		</script>
		<%}
	else{
		try{
			conn=cf.getConnection();
			ls_sql = " select sfyh,jldwbm,yhj,cxj,to_char(sysdate,'yyyy-mm-dd') today ";
			ls_sql += " FROM jc_zcjgb ";
			ls_sql += " where zcbm='"+zcbm+"' ";
//			out.println(sql);
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())                            
			{
				sfyh=cf.fillNull(rs.getString("sfyh"));
				jldwbm=cf.fillNull(rs.getString("jldwbm"));
				yhj=rs.getDouble("yhj");
				cxj=rs.getDouble("cxj");
				today=cf.fillNull(rs.getString("today"));
				if (sfyh.equals("Y"))
				{
					if (cxj !=0)
						yhj = cxj;
					%>
					<form name="form1" method="post" action="savaInsertdgcp.jsp">
					<center>
					<font size="+2" color="red"><b>欢迎使用松下亿达主材<br>
					</b></font>
					<font size="-1">说明：输入您要定购的数量，回车或者点击【马上定购】即可完成定购！</font>
					</center>
					<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
						<tr>
							<td>
								单&nbsp;&nbsp;&nbsp;&nbsp;价： 
								<input name="dj" value="<%=yhj%>/<%=jldwbm%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>
								|| 定购日期：
								<input name="dgrq" value="<%=today%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>
							</td>
						</tr>
						<tr>
							<td>
								定购数量：
								<input name="sl" value="" size="10" onKeyup="ss(form1);" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
								|| 总&nbsp;金&nbsp;额：
								<input name="zje" value="" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>（元）
								<input name="yhj" type="hidden" value="<%=yhj%>" size="5">
								<input name="zcbm" type="hidden" value="<%=zcbm%>" size="5">
							</td>
						</tr>
						<tr> 
							<td colspan="4"> 
								<center>
								<input type="button" name="Submit" value="马上定购" onClick="return isValid(form1)">
								<input type="button" name="Submit2" value="一会再说" onClick="window.close()">
								</center>
							</td>
						</tr>
					</table>
					</form>
				<%}
				else {out.print("抱歉暂时没货！");}
			}
			else {out.print("产品不存在！！！");}
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
	}
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
<script language="javascript" src="/js/validate.js"></script>
<script language="javascript">
function isValid(form)
{
	if(	javaTrim(form.sl)=="") {
		alert("请输入【数量】！");
		form.sl.focus();
		return false;
	}
	if (javaTrim(form.sl)=="0")
		{
		alert("购买数量不能为零！");
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
//	if (!(isFloat(form.sl,"定购数量"))){
//		form.zje.value="";
//		form.sl.value="";
//		 form.sl.select();     
//		 return      
//	   } 
//	 if (event.keyCode==48)	
//	{
//		 if (form.sl.value<1)
//		 {
//		alert("定购数量不能为零或小数！");
//		form.zje.value="";
//		form.sl.value="";
//		form.sl.focus();
//		return false;
//		}
//	}    
//	form.zje.value=parseInt(form.sl.value*form.yhj.value*100+0.5)/100;
    form.zje.value=formatDouble(form.sl.value*form.yhj.value,2);
	if (!(isFloat(form.zje,"定购数量"))){
		form.zje.value="";
		form.sl.value="";
		form.sl.select();     
		return      
	   } 
	if (event.keyCode==13)	
	{
		if(	javaTrim(form.sl)=="") {
		alert("请输入【数量】！");
		form.sl.focus();
		return false;
		}
		if (javaTrim(form.sl)=="0")
		{
		alert("购买数量不能为零！");
		form.zje.value="";
		form.sl.value="";
		form.sl.focus();
		return false;
		}
		form.submit();
		return true;
	}        
}
// <img src=../images/ann.gif> 
</script>
</body>