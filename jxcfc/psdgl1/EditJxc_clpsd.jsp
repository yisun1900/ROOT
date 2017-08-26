<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");

String psph=request.getParameter("psph");

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;
String lx=null;
double yf=0;
double qtsf=0;
String ssbm=null;
String lrr=null;
String lrrq=null;
String bz=null;


String dqbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;


try { 
	conn=cf.getConnection();

	ls_sql="select khbh,psfs,jhshsj,fkje,yf,qtsf,ssbm,lrr,lrrq,bz";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		ssbm=cf.fillNull(rs.getString("ssbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
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
<div align="center">修改材料配送单（配送单号：<%=psph%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">客户编号</font> </td>
      <td><%=khbh%> </td>
      <td align="right"><font color="#0000CC">合同号</font> </td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">客户姓名</font> </td>
      <td><%=khxm%> </td>
      <td align="right"><font color="#0000CC">质检员</font></td>
      <td><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">签约店面</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td align="right"><font color="#0000CC">设计师</font></td>
      <td><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">施工队</font> </td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>      </td>
      <td align="right"><font color="#0000CC">施工班组</font> </td>
      <td><%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">合同开工日期</font></td>
      <td bgcolor="#FFFFFF"><%=kgrq%> </td>
      <td align="right"><font color="#0000CC">合同交工日期</font></td>
      <td><%=jgrq%> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>配送方式</td>
      <td width="32%"> <%
	cf.radioToken(out, "psfs","1+配送&2+自提&9+其它",psfs);
%> </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>计划送货时间</td>
      <td width="32%"> 
      <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>配送运费</td>
      <td width="32%"> 
      <input type="text" name="yf" value="<%=yf%>" size="20" maxlength="10" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>其它收费</td>
      <td width="32%"> 
      <input type="text" name="qtsf" value="<%=qtsf%>" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>返款金额</td>
      <td width="32%"> 
      <input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="32%"><select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="32%"> 
      <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="dqbm" value="<%=dqbm%>">
        <input type="hidden" name="psph" value="<%=psph%>" >
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="常用材料录入" onClick="f_pllr(insertform)" name="pllr">
        <input type="button"  value="选择录入" onClick="f_cklr(insertform)" name="cklr" >
        <input type="button"  value="查看明细" onClick="f_ck(insertform)" name="ckmx" >
        <input type="button"  value=" 提 交 " onClick="f_tj(insertform)" name="tj" >
        <input type="reset"  value="重输" name="reset">
      <input type="button"  value="打印配送单" onClick="f_print(insertform)" name="print" >      </td>
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
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[配送批号]！");
		FormName.psph.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("请选择[配送方式]！");
		FormName.psfs[0].focus();
		return false;
	}

	if (FormName.psfs[0].checked)
	{
		if(	javaTrim(FormName.jhshsj)=="") {
			alert("请输入[计划送货时间]！");
			FormName.jhshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
			return false;
		}
	}
	else{
		FormName.jhshsj.value="";
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[返款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "返款金额"))) {
		return false;
	}

	
	if(	javaTrim(FormName.yf)=="") {
		alert("请输入[配送运费]！");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "配送运费"))) {
		return false;
	}
	if(	javaTrim(FormName.qtsf)=="") {
		alert("请输入[其它收费]！");
		FormName.qtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsf, "其它收费"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("请输入[录入时间]！");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("请输入[录入部门]！");
		FormName.ssbm.focus();
		return false;
	}

	FormName.action="SaveEditJxc_clpsd.jsp";
	FormName.submit();

	return true;
}


function f_pllr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[配送批号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.action="PlJxc_clpsmx.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_cklr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[配送批号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[配送批号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[配送批号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.action="tjpsd.jsp";
	FormName.submit();
	FormName.ckmx.disabled=true;
	FormName.cklr.disabled=true;
	FormName.pllr.disabled=true;
	return true;
}
function f_print(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[配送批号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.action="/jxcdy/dypsd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
