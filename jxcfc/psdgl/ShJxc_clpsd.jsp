<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>材料单－审核</title>
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
String psdzt=null;


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
String fwmj=null;

try { 
	conn=cf.getConnection();

	ls_sql="select khbh,psfs,jhshsj,fkje,yf,qtsf,ssbm,lrr,lrrq,bz,psdzt";
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
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (psdzt.equals("2") || psdzt.equals("6")  || psdzt.equals("7"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	{
		out.print("错误！材料单["+psph+"]已审核完成，不能再修改，若想修改请在『材料单－修护审核』中删除审核信息");
		return;
	}
	else if (!psdzt.equals("1"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：已审核；
	{
		out.print("错误！材料单["+psph+"]不是等待审核状态！");
		return;
	}


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh,fwmj";
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
		fwmj=cf.fillNull(rs.getString("fwmj"));
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
<div align="center"><strong>材料单－审核</strong>（材料单号：<%=psph%>）</div>
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
      <td align="right" width="18%"><font color="#0000CC">配送方式</font></td>
      <td width="32%"> <%
	cf.radioToken(out,"1+配送&2+自提&9+其它",psfs,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">计划送货时间</font></td>
      <td width="32%"><%=jhshsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">录入人</font></td>
      <td width="32%"> <%=lrr%></td>
      <td align="right" width="18%"><font color="#0000CC">录入时间</font></td>
      <td width="32%"><%=lrrq%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">备注</font></td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">工程额</font></td>
      <td><%=qye%></td>
      <td align="right"><font color="#0000CC">房屋面积</font></td>
      <td><%=fwmj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>配送运费</td>
      <td><input type="text" name="yf" value="<%=yf%>" size="20" maxlength="10" >      </td>
      <td align="right"><font color="#CC0000">*</font>其它收费</td>
      <td><input type="text" name="qtsf" value="<%=qtsf%>" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>返款金额</td>
      <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" >      </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>审核结论</td>
      <td colspan="3"><%
	cf.radioToken(out, "shjl","Y+同意&N+作废（不能打印不能出库）&M+驳回重新修改（不能打印不能出库）","");
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">审核人</font></td>
      <td><input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">审核时间</font></td>
      <td><input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">审核说明</td>
      <td colspan="3"><textarea name="shsm" cols="75" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <p>
          <input type="hidden" name="dqbm" value="<%=dqbm%>">
          <input type="hidden" name="psph" value="<%=psph%>" >
          <input type="hidden" name="khbh" value="<%=khbh%>">
          <input type="button"  value="审核完成" onClick="f_do(insertform)">
          <input type="button"  value="审核明细" onClick="f_ck(insertform)" name="ckmx" >
          
          <input type="button"  value="分类统计" onClick="f_fltj(insertform)" name="fltj" >
          <input type="button"  value="工料分析" onClick="f_glfx(insertform)" name="glfx" >
          <input type="reset"  value="重输" name="reset"></p>      </td>
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
		alert("请输入[材料单号]！");
		FormName.psph.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
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

	if(	!radioChecked(FormName.shjl)) {
		alert("请选择[审核结论]！");
		FormName.shjl[0].focus();
		return false;
	}

	if (FormName.shjl[1].checked || FormName.shjl[2].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("请输入[审核说明]！");
			FormName.shsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}

	FormName.target="";
	FormName.action="SaveShJxc_clpsd.jsp";
	FormName.submit();

	return true;
}



function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[材料单号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ShAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
}


function f_fltj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[材料单号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="fltj.jsp";
	FormName.submit();
	return true;
}

function f_glfx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[材料单号]！");
		FormName.psph.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="/khxx/ViewGlfx.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
