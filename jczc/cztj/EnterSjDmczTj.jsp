<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>


<%
String dwbh=(String)session.getAttribute("dwbh");
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;

String fgsmark=null;
String dqmark=null;

try {
	conn=cf.getConnection();


	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		fgsmark="";
		dqmark="";
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		fgsmark="";
		dqmark="disabled=true";
	}
	else{
		fgsmark="disabled=true";
		dqmark="disabled=true";
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">店面产值统计</div>      </td>
    </tr>
    <tr>
      <td align="right" height="42">公司类型</td>
      <td height="42" colspan="3"><input type="radio" name="sfjms" value="N" checked>
        直营公司
          <input type="radio" name="sfjms" value="Y">
          加盟公司
          <input type="radio" name="sfjms" value="Q">
      其它公司 </td>
    </tr>
    <tr>
      <td align="right" width="30%" height="42">大区</td>
      <td height="42" colspan="3" width="70%">
        <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDq(this)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
	}
	else{
		out.println("<option value=\"\"></option>");
	}
%> 
        </select>      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">分公司</td>
      <td height="42" colspan="3" width="70%"> 

		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
		</select>		</td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="44">签约店面</td>
      <td height="44" colspan="3" width="70%"> 
		<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%> 
		</select>	</td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="43"> 统计时间</td>
      <td height="43" colspan="3" width="70%"> 从 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' onDblClick="JSCalendar(this)">
        ----&gt; 到 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>统计时间选择</td>
      <td height="46" colspan="3" width="70%" bgcolor="#CCCCFF"> 
        <input type="radio" name="tjsj" value="1" checked>
        家装签单时间 
        <input type="radio" name="tjsj" value="2">
        公司收首款时间 
        <input type="radio" name="tjsj" value="3">
        财务收首款时间 
        <input type="radio" name="tjsj" value="4">
        家装录入时间 
      <P>&nbsp;&nbsp;&nbsp;&nbsp;注意：此项选择只对《家装统计》按钮起作用      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>业绩范围</td>
      <td height="46" colspan="3" width="70%" bgcolor="#CCCCFF"> 
        <input type="radio" name="jzbz" value="0" checked>
        全部 
        <input type="radio" name="jzbz" value="1">
        家装 
        <input type="radio" name="jzbz" value="2">
        公装 
      <P>&nbsp;&nbsp;&nbsp;&nbsp;注意：此项选择只对《家装统计》按钮起作用      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46">显示风格</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <p>
          <input type="hidden" name="nian" value="<%=nian%>">
          <input type="hidden" name="yue" value="<%=yue%>">
          <input type="button"  value="店面家装统计" onClick="f_do(selectform,'dmjz')" >
          <input type="button"  value="分公司家装统计" onClick="f_do(selectform,'fgsjz')" <%=fgsmark%>>
          <input type="button"  value="大区家装统计" onClick="f_do(selectform,'dqjz')" <%=dqmark%>>
        </p>
        <p>
          <input type="button"  value="店面家居统计" onClick="f_do(selectform,'dmjj')" >      
          <input type="button"  value="分公司家居统计" onClick="f_do(selectform,'fgsjj')" <%=fgsmark%>>
          <input type="button"  value="大区家居统计" onClick="f_do(selectform,'dqjj')" <%=dqmark%>>
        </p>
        <p>
          <input type="button"  value="返卷认证统计" onClick="f_do(selectform,'fj')" name="fjrz">
          <input type="reset"  value="重输">
        </p></td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

var lx;
function changeDq(fromID) 
{
	lx=1;
	selectform.fgs.length=1;
	selectform.dwbh.length=1;


	var sql;
	if ("<%=kfgssq%>"=="2")//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and ssdqbm='"+fromID.value+"' and dwbh in(select ssfgs from sq_sqfgs where ygbh='<%=ygbh%>') order by dwbh";
	}
	else if ("<%=kfgssq%>"=="5")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and ssdqbm='"+fromID.value+"' and dwbh in(select ssfgs from sq_sqbm where ygbh='<%=ygbh%>') order by dwbh";
	}
	else if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="3" || "<%=kfgssq%>"=="4")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and ssdqbm='"+fromID.value+"' and dwbh='<%=ssfgs%>'";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function changeFgs(FormName) 
{
	lx=2;
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx==1)
	{
		strToSelect(selectform.fgs,ajaxRetStr);
	}
	else if (lx==2)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
}

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[签约时间 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "签约时间 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[签约时间 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "签约时间 "))) {
		return false;
	}

	if (lx=='dmjz')
	{
		FormName.action="dmcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jzcz.disabled=true;
		return true;
	}
	if (lx=='fgsjz')
	{
		FormName.action="xzfgsjz.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jzcz.disabled=true;
		return true;
	}
	if (lx=='dqjz')
	{
		FormName.action="xzdqjz.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jzcz.disabled=true;
		return true;
	}
	else if (lx=='dmjj')
	{
		FormName.action="dmjjcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jjcz.disabled=true;
		return true;
	}
	else if (lx=='fgsjj')
	{
		FormName.action="fgsjjcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jjcz.disabled=true;
		return true;
	}
	else if (lx=='dqjj')
	{
		FormName.action="dqjjcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jjcz.disabled=true;
		return true;
	}
	else if (lx=='fj')
	{
		FormName.action="dmfjtjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.fjrz.disabled=true;
		return true;
	}
}


//-->
</SCRIPT>
