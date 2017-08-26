<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
//把主材按房间显示数量
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth="";
String sjs=null;
String kgrq="";
String jyjdrq=null;
String jgrq="";
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String dh=null;
String hxbm=null;
String ysshbz="";
String ysshr="";

int row=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		dh=cf.fillHtml(rs.getString("dh"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));
		hth=cf.fillNull(rs.getString("hth"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<form method="post" action="" name="editform">

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><B>客户主材明细</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td   >客户姓名：<%=khxm%></td>
	<td align="left">设计师：<%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" >工程地址：<%=fwdz%></td>
  </tr>
</table>

<table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="130%" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCFF" height="20" align="center"  >
  <td width="3%">&nbsp;</td>
  <td width="6%">结构位置</td>
  <td width="7%">品牌</td>
  <td width="11%">名称</td>
  <td width="11%">型号</td>
  <td width="10%">规格</td>
  <td width="6%">数量</td>
  <td width="5%">原价</td>
  <td width="5%">单价</td>
  <td width="6%">成本价</td>
  <td width="4%">远程费</td>
  <td width="4%">其它费项目</td>
  <td width="4%">其它费</td>
  <td width="18%">供应商</td>
</tr>

<%

String bgcolor="";

	//套餐升级分类编码:不为空
	String jgwzbm=null;
	String lrxh=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String zcbm=null;
	String zcmc=null;
	String ppbm=null;
	String gys=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double cbj=0;
	double sl=0;
	double ycf=0;
	String qtfy=null;
	double qtfyje=0;

	ls_sql="SELECT zcpzwzbm,xh,zcdlbm,zcxlbm,zcbm,zcmc,ppbm,gys,xinghao,gg,zcysbm,jldwbm,zqdj,dpzk,zqdj,dpzk,dj,cbj,sl,ycf,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费','W','无') qtfy,qtfyje";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zcpzwzbm,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		lrxh=rs.getString("xh");
		zcdlbm=rs.getString("zcdlbm");
		zcxlbm=rs.getString("zcxlbm");

		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));


		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		cbj=rs.getDouble("cbj");
		sl=rs.getDouble("sl");
		ycf=rs.getDouble("ycf");
		qtfy=cf.fillNull(rs.getString("qtfy"));
		qtfyje=rs.getDouble("qtfyje");

		row++;


		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		%>
		<tr bgcolor="<%=bgcolor%>" align="center"  >
		  <td>
		  <A HREF="EditBj_khzcmxJsj.jsp?khbh=<%=khbh%>&xh=<%=lrxh%>" target="_blank">修改</A>	
		  </td>
		  <td><%=jgwzbm%>
		  </td>
		  <td><%=ppbm%></td>
		  <td><%=zcmc%></td>
		  <td><%=xinghao%></td>
		  <td><%=gg%></td>
		  <td><%=sl%><%=jldwbm%></td>
		  <td><%=zqdj%></td>
		  <td><%=dj%></td>
		  <td>
			<input type="hidden" name="xh"   value="<%=lrxh%>" > 
			<input type="text" name="cbj" size="6" maxlength="16"  value="<%=cbj%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
		  </td>
		  <td><%=ycf%></td>
		  <td><%=qtfy%></td>
		  <td><%=qtfyje%></td>
		  <td><%=gys%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<tr> 
	<td colspan="9" align="center"  >
		<input type="hidden" name="khbh" value="<%=khbh%>">
		<input type="button" value=" 暂 存 " onClick="f_zc(editform)" >
		<input type="button" value=" 保 存 " onClick="f_do(editform)" >
	</td>
	<td colspan="23" >&nbsp;</td>
</tr>
</table>
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_zc(FormName)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		if(	javaTrim(FormName.cbj)=="") {
			alert("请输入[结算价]！");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "结算价"))) {
			return false;
		}
		if (parseFloat(FormName.cbj.value)<0 )
		{
			alert("[结算价]小于0！");
			FormName.cbj.select();
			return false;
		}
	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			if(	javaTrim(FormName.cbj[i])=="") {
				alert("请输入[结算价]！");
				FormName.cbj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.cbj[i], "结算价"))) {
				return false;
			}
			if (parseFloat(FormName.cbj[i].value)<0 )
			{
				alert("[结算价]小于0！");
				FormName.cbj[i].select();
				return false;
			}
		}
	}


	FormName.action="SaveAllBj_khzcmxJsjZc.jsp";
	FormName.submit();
	return true;
}


function f_do(FormName)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		if(	javaTrim(FormName.cbj)=="") {
			alert("请输入[结算价]！");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "结算价"))) {
			return false;
		}
		if (parseFloat(FormName.cbj.value)<0 )
		{
			alert("[结算价]小于0！");
			FormName.cbj.select();
			return false;
		}
	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			if(	javaTrim(FormName.cbj[i])=="") {
				alert("请输入[结算价]！");
				FormName.cbj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.cbj[i], "结算价"))) {
				return false;
			}
			if (parseFloat(FormName.cbj[i].value)<0 )
			{
				alert("[结算价]小于0！");
				FormName.cbj[i].select();
				return false;
			}
		}
	}


	FormName.action="SaveAllBj_khzcmxJsj.jsp";
	FormName.submit();
	return true;
}




//-->
</SCRIPT>
