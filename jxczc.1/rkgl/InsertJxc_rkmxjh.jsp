<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>
<%
int kk=0;
String rkph=null;
rkph=cf.GB2Uni(request.getParameter("rkph"));
String scrq=cf.GB2Uni(request.getParameter("scrq"));
//String scph=cf.GB2Uni(request.getParameter("scph"));
String scph=cf.GB2Uni(cf.getParameter(request,"scph"));
String fhjlh=cf.GB2Uni(request.getParameter("fhjlh"));
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String gysmc=null;
String cgdh=null;
String gysddph=null;
try { 
	conn=cf.getConnection();
	//根据入库单查询相应数据
	ls_sql="select gysmc,cgdh ";
	ls_sql+=" from  jxc_rkd";
	ls_sql+=" where rkph='"+rkph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		cgdh=cf.fillNull(rs.getString("cgdh"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
	}
	else
	{
		out.print("<font color=red>错误！不存在的入库单：["+rkph+"]</font>");
		return;
	}
	rs.close();
	ps.close();

	//根据供应商、采购批号查询出已经出库的订单
	ls_sql="select jxc_gysdd.gysddph gysddph ";
	ls_sql+=" from  jxc_gysdd,jxc_cgjhddb ";
	ls_sql+=" where gysmc='"+gysmc+"' and ddzt='6' and jxc_gysdd.gysddph=jxc_cgjhddb.gysddph and cgjhph='"+cgdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		kk++;
		gysddph=cf.fillNull(rs.getString("gysddph"));
	}
	rs.close();
	ps.close();
	if (kk<=0)
	{
		out.print("<font color=red>错误！供应商：["+gysmc+"]没有出库数据！</font>");
		return;
	}
	else if (kk>1)
	{
		out.print("系统检测到多个供应商出库，请选择：<br>");
		ls_sql="select jxc_gysdd.gysddph gysddph ";
		ls_sql+=" from  jxc_gysdd,jxc_cgjhddb ";
		ls_sql+=" where gysmc='"+gysmc+"' and ddzt='6' and jxc_gysdd.gysddph=jxc_cgjhddb.gysddph and cgjhph='"+cgdh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
//			kk++;
			gysddph=cf.fillNull(rs.getString("gysddph"));
			out.print("<a href=>"+gysddph+"</a><br>");
		}
		rs.close();
		ps.close();
		return;
	}
	

%>
<form method="post" action="SaveInsertJxc_rkmxjh.jsp" name="selectform" target="">
<body bgcolor="#FFFFFF" align="center">
      <div align="center"><b> 订单发货（批号：<%=rkph%>）</b></div>
	  <input type="hidden" name="rkph" size="20"  value="<%=rkph%>" readonly>
	  <input type="hidden" name="fhjlh" size="20"  value="<%=fhjlh%>" readonly>
        <table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1" align="center">
		<tr bgcolor="CCCCCC"> 
		    <td width="3%"> 
              <div align="center"><B>序号</b></div>
            </td>
            <td width="9%"> 
              <div align="center"><B>材料编码</b></div>
            </td>
			<td width="17%"> 
              <div align="center"><B>材料名称</b></div>
            </td>
			<td width="8%"> 
              <div align="center"><B>型号</b></div>
            </td>
			<td width="6%"> 
              <div align="center"><B>入库数量</b></div>
            </td>  
			<td width="9%"> 
              <div align="center"><B>生产日期</b></div>
            </td> 
			<td width="16%"> 
              <div align="center"><B>生产批号</b></div>
            </td> 
			<td width="8%"> 
              <div align="center"><B>规格</b></div>
            </td>
			<td width="7%"> 
              <div align="center"><B>订货数量</b></div>
            </td>
			<td width="7%"> 
              <div align="center"><B>发货总量</b></div>
            </td>   
			<td width="7%"> 
              <div align="center"><B>本次发货数量</b></div>
            </td> 
          </tr>
		
<%

String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int dhxh=0;
String clbm=null;
String clmc=null;
String xh=null;
String gg=null;
double dhsl=0;
double pssl=0;
double fhsj=0;

	ls_sql="select dhxh,clbm,clmc,xh,gg,dhsl,pssl ";
	ls_sql+=" from  jxc_gysddmx";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i+=1;
		dhxh=rs.getInt("dhxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		dhsl=rs.getDouble("dhsl");
		pssl=rs.getDouble("pssl");
		//查询本次发货数量
		ls_sql="select pssl ";
		ls_sql+=" from  jxc_gysfhjlmx";
		ls_sql+=" where fhjlh='"+fhjlh+"' and clbm='"+clbm+"' ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			fhsj=rs2.getDouble("pssl");
		%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
			<td> 
              <div align="center">
			<input type="hidden" name="dhxh" value="<%=dhxh%>"><%=dhxh%></div>
			  </td>
			<td> 
              <div align="center"><%=clbm%>
			  <input type="hidden" name="clbm"  value="<%=clbm%>"  readonly>
			 </div>
            </td>
			<td> 
              <div align="center"><%=clmc%></div>
            </td>
			<td> 
              <div align="center"><%=xh%></A></div>
            </td>
			<td > 
              <div align="center"><input type="text" name="rksl" size="6" maxlength="13" value="<%=fhsj%>" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'" readonly></div>
            </td>
			 <td align="left">
			  <input type="text" name="scrq" value="<%=scrq%>" size="10" maxlength="10"  onDblClick="JSCalendar(this)" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'">
			  </td>
			   <td  align="left">
			   <input type="text" name="scph" value="<%=scph%>" size="20" maxlength="50" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'">
			    </td>
			<td> 
              <div align="center"><%=gg%></A></div>
            </td>
            <td > 
              <div align="center"><%=dhsl%>
			  <input type="hidden" name="dhsl" size="6" maxlength="13" value="<%=dhsl%>"  readonly  ></div>
            </td>
			 <td > 
              <div align="center"><%=pssl%>
			  <input type="hidden" name="pssl" size="6" maxlength="13" value="<%=pssl%>"  readonly  ></div>
            </td>
			 <td > 
              <div align="center"><%=fhsj%>
			  <input type="hidden" name="fhsj" size="6" maxlength="13" value="<%=fhsj%>"  readonly  ></div>
            </td>
          </tr>
	<%}
		rs2.close();
		ps2.close();
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="CCCCCC"  > 
			<td width="7%" colspan="12"> 
	   <span id="wcp">数据未存盘</span><font color="blue" ><span id="ycp"></span></font>&nbsp;&nbsp;&nbsp;
              <input type="button"  value="确认入库" onClick="f_do(selectform)">
            </td>
            
          </tr>
        </table>
		</form>
		</body>
		</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	wcp.innerHTML="";
	ycp.innerHTML="您已经点击过存盘，如果存盘出现异常，请检查数据，如果存盘成功请进行下一步操作！";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
