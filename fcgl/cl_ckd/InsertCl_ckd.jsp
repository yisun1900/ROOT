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
String khbh=request.getParameter("khbh");
String psdh=cf.GB2Uni(request.getParameter("psdh"));
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
int cpsl=0;
double yf=0;
double qtsf=0;


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

String psfs="";
String jhshsj="";
String fkje="";
String lx="";

try { 
	conn=cf.getConnection();

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

	ls_sql="select DECODE(psfs,'1','配送','2','自提','9','其它') psfs,jhshsj,fkje,lx,yf,qtsf";
	ls_sql+=" from  cl_psd";
	ls_sql+=" where psdh='"+psdh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		lx=cf.fillNull(rs.getString("lx"));
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
	}
	rs.close();
	ps.close();


/***************************************************************\
|		检查是否做期末结转											|
\***************************************************************/

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
<div align="center">材料出库</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">客户编号</font></div>
      </td>
      <td width="33%"> <%=khbh%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">合同号</font></div>
      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">客户姓名</font></div>
      </td>
      <td width="33%"> <%=khxm%> </td>
      <td width="18%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="32%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC">签约店面</font></td>
      <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="18%" align="right"><font color="#0000CC">设计师</font></td>
      <td width="32%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">质检员</font></div>
      </td>
      <td width="33%"><%=zjxm%> </td>
      <td width="18%"> 
        <div align="right">签约额</div>
      </td>
      <td width="32%"><%=qye%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">施工队</font></div>
      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">施工班组</font></div>
      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC">合同开工日期</font></td>
      <td width="33%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="18%" align="right"><font color="#0000CC">合同交工日期</font></td>
      <td width="32%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">出库批号</font></td>
      <td width="33%"> 
        <input type="text" name="ckph" value="<%=ckph%>" size="20" maxlength="11" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">分公司</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">配送方式</td>
      <td width="33%"> <%=psfs%> </td>
      <td align="right" width="18%">计划送货时间</td>
      <td width="32%"> <%=jhshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">返款金额</td>
      <td width="33%"> <%=fkje%> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">配送单号</td>
      <td width="33%"> 
        <input type="text" name="psdh" value="<%=psdh%>" size="20" maxlength="11" >
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>配送运费</td>
      <td width="32%"> 
        <input type="text" name="yf" value="<%=yf%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#CC0000">*</font>类型</td>
      <td width="33%"> <%
	if (lx.equals(""))
	{
		cf.radioToken(out, "lx","1+出库&2+退货",lx);
	}
	else{
		cf.radioToken(out, "lx","1+出库&2+退货",lx,true);
	}
%></td>
      <td align="right" width="18%"><font color="#CC0000">*</font>油漆调色费</td>
      <td width="32%"> 
        <input type="text" name="qtsf" value="<%=qtsf%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC"></font>配送人</td>
      <td width="33%"> 
        <input type="text" name="ckr" value="<%=yhmc%>" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC"></font>实际送货时间</td>
      <td width="32%"> 
        <input type="text" name="cksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">出库人</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">出库时间</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="出库录入" onClick="f_cklr(insertform)" name="cklr" disabled>
        <input type="button"  value="赠送录入" onClick="f_zplr(insertform)" name="zplr" disabled>
        <input type="button"  value="查看明细" onClick="f_ck(insertform)" name="ckmx" disabled>
        <input type="button"  value=" 提 交 " onClick="f_tj(insertform)" name="tj" disabled>
        <input type="button"  value="打印配送单" onClick="window.open('dypsd.jsp?ckph=<%=ckph%>')" name="dy" disabled>
        <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
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
<%
	if (lx.equals(""))
	{
		%>
		if(	!radioChecked(FormName.lx)) {
			alert("请选择[类型]！");
			FormName.lx[0].focus();
			return false;
		}
		<%
	}
	else{
		%>
		if(	javaTrim(FormName.lx)=="") {
			alert("请选择[类型]！");
			FormName.lx.focus();
			return false;
		}
		<%
	}
%>
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
	if(!(isFloat(FormName.yf, "配送运费"))) {
		return false;
	}
	if(!(isFloat(FormName.qtsf, "其它收费"))) {
		return false;
	}

	FormName.action="SaveInsertCl_ckd.jsp";
	FormName.submit();

	FormName.cklr.disabled=false;
	FormName.zplr.disabled=false;
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	FormName.dy.disabled=false;
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
