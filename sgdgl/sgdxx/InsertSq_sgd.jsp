<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


	String yhjs=(String)session.getAttribute("yhjs");
%>
<%
String bianma=null;
String sgd=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select bianma";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bianma=rs.getString(1);
	}
	rs.close();

	if (bianma==null)
	{
		out.println("错误！单位信息表中【编码】为空，请在【单位信息维护】中添加");
		return;
	}

	ls_sql="select NVL(max(TO_NUMBER(substr(sgd,3,3))),0)";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where ssfgs='"+ssfgs+"' and substr(sgd,1,2)='"+bianma+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	sgd=bianma+cf.addZero(count+1,3);

	if (sgd.length()!=5)
	{
		out.println("错误！【工长编号】应该为5位");
		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入工长信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right"><font color="#FF0000">*</font>工长编号</div>              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <input type="text" name="sgd" value="<%=sgd%>" size="20" maxlength="5" >              </td>
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right"><font color="#FF0000">*</font>工长名称</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="sgdmc" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF">队号</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <input type="text" name="duihao" value="" size="20" maxlength="20" >              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">级别</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>工长类型</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="sgdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="S0">施工队</option>
                  <option value="S1">直属施工队</option>
                </select>              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">工长家庭地址</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="dz" value="" size="20" maxlength="100" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>所属分公司</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td width="32%" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>所属地区</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  where dqbm='"+dqbm+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>撤销标志</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未撤销</option>
                  <option value="Y">已撤销</option>
                </select>              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>工长电话</td>
              <td colspan="3" bgcolor="#CCCCFF"> 
                <input type="text" name="dh" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>户籍所在地</td>
              <td colspan="3"> 
                <input type="text" name="hjszd" value="" size="72" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">派单说明</td>
              <td colspan="3" bgcolor="#FFFFFF">
                <input type="text" name="kjdsm" value="" size="72" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>紧急联系人</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="jjlxr" value="" size="20" maxlength="20" >              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>联系人电话</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="lxrdh" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>紧急联系人地址</td>
              <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text" id="jjlxrdz" value="" size="72" maxlength="50" ></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>工长身份证号</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="sfzhm" value="" size="20" maxlength="18" >              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">工长传真</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="cz" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>是否签劳动合同</td>
              <td bgcolor="#FFFFFF"> 
                <input type="radio" name="sfqldht" value="Y" checked>
                是 
                <input type="radio" name="sfqldht" value="N">
                否</td>
              <td align="right" width="10%" height="35"  bgcolor="#FFFFFF"><span class="STYLE1">*</span>入职日期</td>

             <td width="15%" height="35"  bgcolor="#FFFFFF"> 
        <input type="text" name="rzsj" value="<%=cf.today()%>" size="15" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">备注</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="70" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button"  value="可接单城区" onClick="f_lrcq(insertform)" name="lrcq" disabled>
                  <input type="button"  value="可接单店面" onClick="f_lrdm(insertform)" name="lrdm" disabled>              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[工长编号]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdmc)=="") {
		alert("请输入[工长名称]！");
		FormName.sgdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[工长电话]！");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdlx)=="") {
		alert("请选择[单位类型]！");
		FormName.sgdlx.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfqldht)) {
		alert("请选择[是否签劳动合同]！");
		FormName.sfqldht[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sfzhm)=="") {
		alert("请选择[身份证号]！");
		FormName.sfzhm.focus();
		return false;
	}
	if(	javaTrim(FormName.hjszd)=="") {
		alert("请选择[户籍所在地]！");
		FormName.hjszd.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxr)=="") {
		alert("请选择[紧急联系人]！");
		FormName.jjlxr.focus();
		return false;
	}
	if(	javaTrim(FormName.lxrdh)=="") {
		alert("请选择[紧急联系人电话]！");
		FormName.lxrdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdz)=="") {
		alert("请选择[紧急联系人地址]！");
		FormName.jjlxrdz.focus();
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("请输入[入职时间]！");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职时间"))) {
		return false;
	}


	FormName.action="SaveInsertSq_sgd.jsp";
	FormName.submit();

	FormName.lrcq.disabled=false;
	FormName.lrdm.disabled=false;
	return true;
}

function f_lrcq(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[工长编号]！");
		FormName.sgd.focus();
		return false;
	}
	FormName.action="InsertSq_kjdcq.jsp";
	FormName.submit();
	return true;
}


function f_lrdm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[工长编号]！");
		FormName.sgd.focus();
		return false;
	}
	FormName.action="InsertSq_kjddm.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
