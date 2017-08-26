<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbjjbbm=null;
String khsjsfycx=null;
String bjjbbm=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String bjbbh=null;
String bjbbhm=null;
String ssfgs=null;
String dqbm=null;

int sjslmax=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bjjbbm,sjsfycx,khbjjbbm";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		khsjsfycx=cf.fillNull(rs.getString("sjsfycx"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjbbh,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//多类套餐升级数量限制
	ls_sql="select sl";
	ls_sql+=" from  bj_tcsjslxz";
	ls_sql+=" where fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjslmax=rs.getInt("sl");
	}
	rs.close();
	ps.close();


%>

<html>
<head>
<title>主材项目升级</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<form method="post" action="SaveZcsj.jsp" name="editform">
<div align="center">
  主材项目升级
	<BR>
	<BR>
  <font color="#FF0000">*</font><font color="#0000CC">原级别</font>
      <select name="khbjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+khbjjbbm+"'",khbjjbbm);
%>
        </select>
</div>
	<BR>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#E8E8FF">
  <td width="13%">选择升级</td>
  <td width="19%">选择优惠</td>
  <td width="9%">升级后级别</td>
  <td width="9%">计量单位</td>
  <td width="9%">升级差价</td>
  <td width="14%">升级是否有促销</td>
  <td width="9%">促销开始时间</td>
  <td width="9%" >促销结束时间</td>
  <td width="9%">促销升级差价</td>
</tr>

<%
	String bjjbbm1=null;
	String bjjbmc=null;
	String jldw=null;
	double sjcj=0;
	String sjsfycx=null;
	String sjsfycxmc=null;
	String cxkssj=null;
	String cxjssj=null;
	double cxsjcj=0;
	ls_sql="SELECT bjjbbm1,bjjbmc,jldw,sjcj,sjsfycx,DECODE(sjsfycx,'1','无促销','2','<font color=\"#FF0000\">有促销</font>','3','<font color=\"#0000FF\">有限制促销</font>') sjsfycxmc,cxkssj,cxjssj,cxsjcj";
	ls_sql+=" FROM bj_tcsjcjb,bdm_bjjbbm";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bj_tcsjcjb.bjjbbm='"+khbjjbbm+"' and bj_tcsjcjb.tcsjflbm='"+tcsjflbm+"'";
	ls_sql+=" and bj_tcsjcjb.bjjbbm1=bdm_bjjbbm.bjjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbbm1=cf.fillNull(rs.getString("bjjbbm1"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sjcj=rs.getDouble("sjcj");
		sjsfycx=cf.fillNull(rs.getString("sjsfycx"));//升级是否有促销  1：无促销；2：无数量限制促销；3：有数量限制促销 
		sjsfycxmc=cf.fillNull(rs.getString("sjsfycxmc"));

		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxsjcj=rs.getDouble("cxsjcj");

		if (sjsfycx.equals("2") || sjsfycx.equals("3"))//判断是否过期
		{
			if (cxkssj.compareTo(cf.today())>0)//未开始
			{
				sjsfycx="1";
				sjsfycxmc="无促销";
				cxkssj="";
				cxjssj="";
				cxsjcj=0;
			}

			if (cxjssj.compareTo(cf.today())<0)//已结束
			{
				sjsfycx="1";
				sjsfycxmc="无促销";
				cxkssj="";
				cxjssj="";
				cxsjcj=0;
			}
		}


		String cxsjcjStr="";
		if (cxsjcj!=0)
		{
			cxsjcjStr=cxsjcj+"";
		}

		String jbmark="";
		String slmark="";
		String noslmark="";
		if (bjjbbm1.equals(bjjbbm))
		{
			jbmark="checked";

			if (khsjsfycx.equals("3"))//1：无促销；2：无数量限制促销；3：有数量限制促销
			{
				slmark="checked";
				noslmark="";
			}
			else{
				slmark="";
				noslmark="checked";
			}
		}

		%>
		<tr bgcolor="#FFFFFF" align="center">
		  <td align="left">
			<%
			if (sjsfycx.equals("3"))//1：无促销；2：无数量限制促销；3：有数量限制促销
			{
				%>
				<input type="radio" <%=jbmark%> name="bjjbbm" value="<%=bjjbbm1%>" onClick="alert('提醒！该项升级可打折，但最多同时有[<%=sjslmax%>项]升级可享受折扣，请右侧选择本项升级是否打折')">升级到<%=bjjbmc%>
				<%
			}
			else{
				%>
				<input type="radio" <%=jbmark%> name="bjjbbm" value="<%=bjjbbm1%>" onClick='f_noch(editform)'>升级到<%=bjjbmc%>
				<%
			}
			%>
		  </td>
		  <td align="left">
 			
			<%

			if (sjsfycx.equals("3"))//1：无促销；2：无数量限制促销；3：有数量限制促销
			{
				%>
				<input type="radio" name="sjsfycx" <%=slmark%> value="<%=bjjbbm1%>">选择促销价￥<%=cxsjcj%>
				<BR>
				<input type="radio" name="sjsfycx" <%=noslmark%> value="">选择正常价￥<%=sjcj%>
				<%
			}
			else if (sjsfycx.equals("2"))//1：无促销；2：无数量限制促销；3：有数量限制促销
			{
				%>
				升级优惠价:<%=cxsjcj%>
				<%
			}
			else if (sjsfycx.equals("1"))
			{
				%>
				无优惠,升级价:<%=sjcj%>
				<%
			}

			%>
			
			</td>
		  <td><%=bjjbmc%></td>
		  <td><%=jldw%></td>
		  <td><%=sjcj%></td>
		  <td><%=sjsfycxmc%></td>
		  <td><%=cxkssj%></td>
		  <td><%=cxjssj%></td>
		  <td><%=cxsjcjStr%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>



    <tr> 
      <td colspan="8" align="center" >
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input type="hidden" name="tcsjflbm"  value="<%=tcsjflbm%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">	</td>
    </tr>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_noch(FormName)//参数FormName:Form的名称
{
	if (FormName.sjsfycx!=null)
	{
		for (var i=0;i<FormName.sjsfycx.length ;i++ )
		{
			FormName.sjsfycx[i].checked=false;
		}
	}
 }

function f_do(FormName)//参数FormName:Form的名称
{
	if (FormName.bjjbbm.length==null)
	{
		if(	!FormName.bjjbbm.checked) {
			alert("请输入[升级到哪一级]！");
			FormName.bjjbbm.focus();
			return false;
		}
	}
	else{
		if(	!radioChecked(FormName.bjjbbm)) {
			alert("请选择[升级到哪一级]！");
			FormName.bjjbbm[0].focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
