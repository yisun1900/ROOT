<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>
<%
String rkph=null;
String nian=null;
int maxbh=0;
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=request.getParameter("ssfgs");
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
	ls_sql+="  from cl_ydjz where  jzrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1))) and dwbh='"+dwbh+"' ";  
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

	ls_sql=" select to_char(sysdate,'yy') nian,NVL(MAX(to_number(SUBSTR(rkph,8,4))),0) maxbh ";
	ls_sql+=" from cl_rkd where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		nian = rs.getString("nian");
		maxbh = rs.getInt("maxbh")+1;
	}
	rs.close();
	ps.close();

	rkph = dwbh+nian+cf.addZero(maxbh,4);
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
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 材料入库(入库批号:<%=rkph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform" target="_back">
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font>入库类型</div>
              </td>
              <td> 
                <input type="radio" name="rklx" value="1">
                新货 
                <input type="radio" name="rklx" value="2">
                退货 </td>
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">入库单位</font></div>
              </td>
              <td> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">供应商</td>
              <td>
                <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
					cf.selectItem(out,"select gysmc,gysmc from cl_gysbm order by gysbm","");
					%> 
                </select>
              </td>
              <td width="15%" align="right">退货施工队</td>
              <td>
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssfgs='"+dwbh+"' and cxbz='N' order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font>入库人</div>
              </td>
              <td> 
                <input type="text" name="rkr" size="20" maxlength="13" value="<%=yhmc%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font>入库时间</div>
              </td>
              <td> 
                <input type="text" name="rksj" size="20" maxlength="10" value="<%=cf.today()%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">录入人</font></div>
              </td>
              <td> 
                <input type="text" name="lrr" size="20" maxlength="13" value="<%=yhmc%>" readonly>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">录入时间</font></div>
              </td>
              <td> 
                <input type="text" name="lrsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">申购批号</td>
              <td> 
                <input type="text" name="sgph" size="20" maxlength="11" value="" >
              </td>
              <td width="15%" bgcolor="#FFFFFF">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="rkph" value="<%=rkph%>">
                <input type="button" name="cp" value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button" name="xzcl" value="选择材料" onClick="f_xz(insertform)" disabled>
                <input type="button" name="xg" value="修改" onClick="f_xg(insertform)" disabled>
                &nbsp; 
                <input type="button" name="tjck" value=" 提 交 " onClick="f_tj(insertform)" disabled>
                &nbsp; </td>
            </tr>
          </table>
		</form>
	</div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.rklx)) {
		alert("请选择[入库类型]！");
		FormName.rklx[0].focus();
		return false;
	}

	if (FormName.rklx[1].checked)
	{
		if(	javaTrim(FormName.sgd)=="") {
			alert("请输入[退货施工队]！");
			FormName.sgd.focus();
			return false;
		}
		FormName.gysmc.value="";
	}
	else{
		if(	javaTrim(FormName.gysmc)=="") {
			alert("请输入[供应商]！");
			FormName.gysmc.focus();
			return false;
		}
		FormName.sgd.value="";
	}

	if(	javaTrim(FormName.rkr)=="") {
		alert("请输入[入库人]！");
		FormName.rkr.focus();
		return false;
	}
	if(	javaTrim(FormName.rksj)=="") {
		alert("请输入[入库时间]！");
		FormName.rksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rksj, "入库时间"))) {
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

	if (FormName.rksj.value>FormName.lrsj.value)
	{
		alert("[入库时间]不能大于[录入时间]！");
		FormName.rksj.select();
		return false;
	}
	
	
	FormName.action="ServerInsertsgrk.jsp";
	FormName.submit();
	FormName.xzcl.disabled=false;
	return true;
}
function f_xz(FormName)//参数FormName:Form的名称
{
	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
	FormName.tjck.disabled=false;
	FormName.xg.disabled=false;
	return true;
}
function f_xg(FormName)//参数FormName:Form的名称
{
	FormName.action="Cl_rkmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	FormName.action="tjrkd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
