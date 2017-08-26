<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String ckph=null;
String nian=cf.today("YY");

String yhmc=(String)session.getAttribute("yhmc");
String fgs=request.getParameter("fgs");

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
int cpsl=0;




try { 
	conn=cf.getConnection();


/***************************************************************\
|		检查是否做期末结转											|
\***************************************************************/
	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where  jzrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1))) and dwbh='"+fgs+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//从数据库中取出当前库存日期 
	} 
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("上月没有进行<a href=\"/fcgl/qmjz/ydjz.jsp\">库存结转</a>，不能进行库存操作！");
		return;
	}

	ls_sql=" select NVL(MAX(to_number(SUBSTR(ckph,8,4))),0) ";
	ls_sql+=" from cl_ckd where dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		count = rs.getInt(1);
	}
	rs.close();
	ps.close();

	ckph = fgs+nian+cf.addZero(count+1,4);
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">材料出库（<b>报废等虚拟出库</b>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC">出库批号</font></td>
      <td width="35%"> 
        <input type="text" name="ckph" value="<%=ckph%>" size="20" maxlength="11" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">分公司</font></td>
      <td width="35%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font>出库人</td>
      <td width="35%"> 
        <input type="text" name="ckr" value="<%=yhmc%>" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font>出库时间</td>
      <td width="35%"> 
        <input type="text" name="cksj" value="<%=cf.today()%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font></td>
      <td width="35%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="69" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="代金券转入" onClick="f_djjlr(insertform)" name="djj" disabled>
        <input type="button"  value="出库录入" onClick="f_cklr(insertform)" name="cklr" disabled>
        <input type="button"  value="赠送录入" onClick="f_zplr(insertform)" name="zplr" disabled>
        <input type="button"  value="查看明细" onClick="f_ck(insertform)" name="ckmx" disabled>
        <input type="button"  value=" 提 交 " onClick="f_tj(insertform)" name="tj" disabled>
        <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ckr)=="") {
		alert("请输入[出库人]！");
		FormName.ckr.focus();
		return false;
	}
	if(	javaTrim(FormName.cksj)=="") {
		alert("请输入[出库时间]！");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "出库时间"))) {
		return false;
	}

	if (FormName.cksj.value>FormName.lrsj.value)
	{
		alert("[出库时间]不能大于[录入时间]！");
		FormName.cksj.select();
		return false;
	}

	FormName.action="SaveInsertCl_ckd1.jsp";
	FormName.submit();

	FormName.djj.disabled=false;
	FormName.cklr.disabled=false;
	FormName.zplr.disabled=false;
	return true;
}

function f_djjlr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="ChooseCkmc.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_cklr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="SelectCxCl_clbm.jsp?leixing=1";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_zplr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="SelectCxCl_clbm.jsp?leixing=2";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="Cl_ckmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="tjckd.jsp";
	FormName.ckmx.disabled=true;
	FormName.cklr.disabled=true;
	FormName.zplr.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

