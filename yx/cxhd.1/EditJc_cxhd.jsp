<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;
int dj=0;
double fxgck=0;
double fxzck=0;

double zdzk=0;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double qtsfxmzk=0;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

String zjxzklx=null;
String sfybfxmzk=null;

String hdlx=null;
String kgxqthd=null;
String zklx="";
String bz=null;

String kssj=null;
String cxjssj=null;
String qdjssj=null;

String yxbffydz="";//是否允许部分费用打折  1：允许；9：不允许

String zdzkDisplay="none";
String dxzkDisplay="none";
String bfzkDisplay="none";
String qtzkDisplay="none";

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));


String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//表示录入存盘直接转过来
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh,dj,fxgck,fxzck,zdzk,gcfzk,glfzk,hdlx,kgxqthd,zklx,bz,sjzk,sjfzk,qtsfxmzk";
	ls_sql+=" ,zjxzklx,sfybfxmzk ";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		sfybfxmzk=cf.fillNull(rs.getString("sfybfxmzk"));

		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dj=rs.getInt("dj");
		fxgck=rs.getDouble("fxgck");
		fxzck=rs.getDouble("fxzck");
		zdzk=rs.getDouble("zdzk");
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		hdlx=cf.fillNull(rs.getString("hdlx"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
		zklx=cf.fillNull(rs.getString("zklx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT kssj,cxjssj,qdjssj";
	ls_sql+=" FROM jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		qdjssj=cf.fillNull(rs.getDate("qdjssj"));
	}
	rs.close();
	ps.close();

	if (zklx.equals("4"))//4：无折扣；1：整单打折；2：单项打折；3：部分费用打折
	{
		zdzkDisplay="none";
		dxzkDisplay="none";
		bfzkDisplay="none";
		qtzkDisplay="none";
	}
	else if (zklx.equals("1"))//4：无折扣；1：整单打折；2：单项打折；3：部分费用打折
	{
		zdzkDisplay="block";
		dxzkDisplay="none";
		bfzkDisplay="none";
		qtzkDisplay="none";
	}
	else if (zklx.equals("2"))//4：无折扣；1：整单打折；2：单项打折；3：部分费用打折
	{
		zdzkDisplay="none";
		dxzkDisplay="block";
		bfzkDisplay="none";
		qtzkDisplay="block";
	}
	else if (zklx.equals("3"))//4：无折扣；1：整单打折；2：单项打折；3：部分费用打折
	{
		zdzkDisplay="none";
		dxzkDisplay="none";
		bfzkDisplay="block";
		qtzkDisplay="block";
	}

	ls_sql="select sq_dwxx.yxbffydz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">请修改促销活动</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="hidden" name="oldkssj" value="<%=kssj%>">
            <input type="button"  value="保存" onClick="f_do(insertform)">
            <input type="button" name="scfj" value="上传附件" onClick="f_scfj(insertform)" >
            <input type="button" name="xs" value="业绩系数" onClick="f_xs(insertform)" >
            <input type="reset"  value="重输">
            <br>
            <br>
                <input type="button" onClick="f_zsxx(insertform)" value="多选赠送信息" >
                <input type="button" onClick="f_dxzsxx(insertform)" value="单选赠送信息" >
                <input type="button" onClick="f_djj(insertform)" value="代金券" >
                <input type="button" value="参加活动店面" onClick="f_dm(insertform)" >
            <input type="button" value="活动相关小区" onClick="f_xq(insertform)" >
            <input type="button" onClick="f_djfxbz(insertform)" value="订金返现标准" >
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">促销活动编码</font></td>
      <td width="32%"> 
      <input type="text" name="cxhdbm" size="20" maxlength="7"  value="<%=cxhdbm%>" readonly>      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>分公司</td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>促销活动名称</td>
      <td colspan="3"> 
        <input type="text" name="cxhdmc" size="71" maxlength="50"  value="<%=cxhdmc%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>活动类型</td>
      <td colspan="3"><%
	cf.radioToken(out, "hdlx","1+无活动&2+公司活动&3+小区活动&4+展会活动&5+市场活动",hdlx);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>可共享其它活动</td>
      <td><%
	cf.radioToken(out, "kgxqthd","1+不可共享&2+可共享",kgxqthd);
%></td>
      <td align="right"><font color="#FF0000">*</font>订金</td>
      <td><input type="text" name="dj" size="20" maxlength="8"  value="<%=dj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>多倍返现工程款</td>
      <td><input type="text" name="fxgck" value="<%=fxgck%>" size="10" maxlength="8" >
          <strong><font color="#FF0000">（录入倍数）</font></strong></td>
      <td align="right"><font color="#FF0000">*</font>多倍返现主材款</td>
      <td><input type="text" name="fxzck" value="<%=fxzck%>" size="10" maxlength="8" >
          <strong><font color="#FF0000">（录入倍数）</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">活动有效时间      
      <input type="button" name="sjd" value="录入更多时间段" onClick="f_sjd(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>开始时间(>=)</td>
      <td><input type="text" name="kssj" value="<%=kssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>促销结束时间(<=)</td>
      <td><input type="text" name="cxjssj" value="<%=cxjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right"><font color="#FF0000">*</font>签单结束时间(<=)</td>
      <td><input type="text" name="qdjssj" value="<%=qdjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">活动折扣</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>折扣类型</td>
      <td colspan="3">
	  
  <INPUT type="radio" name="zklx" value="4" <%if (zklx.equals("4")) out.println("checked");%>  onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    无折扣
  <INPUT type="radio" name="zklx" value="1" <%if (zklx.equals("1")) out.println("checked");%>  onClick="zddz.style.display='block';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    整单打折
      <INPUT type="radio" name="zklx" value="2" <%if (zklx.equals("2")) out.println("checked");%> onClick="zddz.style.display='none';dxdz.style.display='block';bfdz.style.display='none';qtdz.style.display='block'">
      单项打折
<%
	if (yxbffydz.equals("1"))//是否允许部分费用打折  1：允许；9：不允许
	{
		%>
		  <input type="radio" name="zklx" value="3" <%if (zklx.equals("3")) out.println("checked");%> onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='block';qtdz.style.display='block'">部分费用打折
		<%
	}
%>	  </td>
    </tr>
</table>
    
<table width="100%" border="0" style="FONT-SIZE:12;display:<%=zdzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="zddz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">整单打折</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>整单折扣</td>
  <td width="32%"><input name="zdzk" type="text"  value="<%=zdzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>0且<=10）</font></b></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=bfzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>工程费部分打折</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>工程－辅材费折扣</td>
  <td width="32%"><input type="text" name="clfzk" size="8" maxlength="9"  value="<%=clfzk%>" >
      <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>工程－主材费折扣</td>
  <td width="32%"><input type="text" name="zcfzk" size="8" maxlength="9"  value="<%=zcfzk%>" >
      <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程－人工费折扣</td>
  <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="<%=rgfzk%>" >
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>工程－运输费折扣</td>
  <td><input type="text" name="ysfzk" size="8" maxlength="8" value="<%=ysfzk%>">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程－机械费折扣</td>
  <td><input type="text" name="jxfzk" size="8" maxlength="8" value="<%=jxfzk%>">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>工程－损耗费折扣</td>
  <td><input type="text" name="shfzk" size="8" maxlength="8" value="<%=shfzk%>">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程－其它费折扣</td>
  <td><input type="text" name="qtfzk" size="8" maxlength="8" value="<%=qtfzk%>">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=dxzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="dxdz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>单项打折</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程费折扣</td>
  <td><input type="text" name="gcfzk" value="<%=gcfzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">（>0且<=10）</font></b> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>增减项折扣类型</td>
  <td width="32%"><INPUT type="radio" name="zjxzklx" value="1" <%if (zjxzklx.equals("1")) out.println("checked");%> onClick="tzjxzk.disabled=true">
    同合同
    <INPUT type="radio" name="zjxzklx" value="2" <%if (zjxzklx.equals("2")) out.println("checked");%> onClick="tzjxzk.disabled=false">
    独立折扣 </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>是否有部分项目打折</td>
  <td width="32%">
  
	<input type="radio" name="sfybfxmzk" value="Y" <%if (sfybfxmzk.equals("Y")) out.println("checked");%> onClick="tbfxmzk.disabled=false">有
	<input name="sfybfxmzk" type="radio" value="N" <%if (sfybfxmzk.equals("N")) out.println("checked");%> onClick="tbfxmzk.disabled=true">无
	
	</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">
		<input name="tbfxmzk" type="button" onClick="f_bfdz(insertform)"  value="部分工程项目独立打折" <% if (sfybfxmzk.equals("N")) out.println("disabled");%>>
		<input name="tzjxzk" type="button" onClick="window.open('InsertJc_cxhdzjxzk.jsp?cxhdbm=<%=cxhdbm%>')"  value="增减项独立打折" <% if (zjxzklx.equals("1")) out.println("disabled");%></td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=qtzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="qtdz" >
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>管理费折扣</td>
  <td width="32%"><input type="text" name="glfzk" value="<%=glfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>税金折扣</td>
  <td width="32%"><input type="text" name="sjzk" value="<%=sjzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>设计费折扣</td>
  <td><input type="text" name="sjfzk" value="<%=sjfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>其它收费项目折扣</td>
  <td><input name="qtsfxmzk" type="text" value="<%=qtsfxmzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
</table>


<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td width="82%" colspan="3"> 
      <textarea name="bz" cols="72" rows="19"><%=bz%></textarea>      </td>
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.cxhdmc)=="") {
		alert("请输入[促销活动名称]！");
		FormName.cxhdmc.focus();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[订金]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isNumber(FormName.dj, "订金"))) {
		return false;
	}

	if(	javaTrim(FormName.fxgck )=="") {
		alert("请输入[多倍返现工程款]！");
		FormName.fxgck.focus();
		return false;
	}

	if(!(isFloat(FormName.fxgck , "多倍返现工程款"))) {
		return false;
	}

	if(	javaTrim(FormName.fxzck )=="") {
		alert("请输入[多倍返现主材款]！");
		FormName.fxzck.focus();
		return false;
	}
	if(!(isFloat(FormName.fxzck , "多倍返现主材款"))) {
		return false;
	}

	if(	javaTrim(FormName.kssj)=="") {
		alert("请输入[开始时间]！");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.cxjssj)=="") {
		alert("请输入[促销结束时间]！");
		FormName.cxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxjssj, "促销结束时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qdjssj)=="") {
		alert("请输入[签单结束时间]！");
		FormName.qdjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qdjssj, "签单结束时间"))) {
		return false;
	}

	if (FormName.kssj.value>FormName.cxjssj.value)
	{
		alert("[促销结束时间]不能小于[开始时间]！");
		FormName.cxjssj.select();
		return false;
	}
	if (FormName.kssj.value>FormName.qdjssj.value)
	{
		alert("[签单结束时间]不能小于[开始时间]！");
		FormName.qdjssj.select();
		return false;
	}

	if(	!radioChecked(FormName.hdlx)) {
		alert("请选择[活动类型]！");
		FormName.hdlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgxqthd)) {
		alert("请选择[可共享其它活动]！");
		FormName.kgxqthd[0].focus();
		return false;
	}



	if (FormName.zklx[1].checked)//整单打折
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("请输入[整单折扣]！");
			FormName.zdzk.focus();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "整单折扣"))) {
			return false;
		}
		if (FormName.zdzk.value<=0 || FormName.zdzk.value>10)
		{
			alert("错误！[整单折扣]应该在0和10之间！");
			FormName.zdzk.select();
			return false;
		}
	}
	else if (FormName.zklx[2].checked)//单项打折
	{
		if(	javaTrim(FormName.gcfzk)=="") {
			alert("请输入[工程费折扣]！");
			FormName.gcfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.gcfzk, "工程费折扣"))) {
			return false;
		}
		if (FormName.gcfzk.value<0 || FormName.gcfzk.value>10)
		{
			alert("错误！[工程费折扣]应该在0和10之间！");
			FormName.gcfzk.select();
			return false;
		}


		if(	javaTrim(FormName.glfzk)=="") {
			alert("请输入[管理费折扣]！");
			FormName.glfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.glfzk, "管理费折扣"))) {
			return false;
		}
		if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
		{
			alert("错误！[管理费折扣]应该在0和10之间！");
			FormName.glfzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjzk)=="") {
			alert("请输入[税金折扣]！");
			FormName.sjzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjzk, "税金折扣"))) {
			return false;
		}
		if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
		{
			alert("错误！[税金折扣]应该在0和10之间！");
			FormName.sjzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjfzk)=="") {
			alert("请输入[设计费折扣]！");
			FormName.sjfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjfzk, "设计费折扣"))) {
			return false;
		}
		if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
		{
			alert("错误！[设计费折扣]应该在0和10之间！");
			FormName.sjfzk.select();
			return false;
		}

		if(	javaTrim(FormName.qtsfxmzk)=="") {
			alert("请输入[其它收费项目折扣]！");
			FormName.qtsfxmzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtsfxmzk, "其它收费项目折扣"))) {
			return false;
		}
		if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
		{
			alert("错误！[其它收费项目折扣]应该在0和10之间！");
			FormName.qtsfxmzk.select();
			return false;
		}

		if(	!radioChecked(FormName.zjxzklx)) {
			alert("请选择[增减项折扣类型]！");
			FormName.zjxzklx[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfybfxmzk)) {
			alert("请选择[是否有部分项目打折]！");
			FormName.sfybfxmzk[0].focus();
			return false;
		}
	}
	else if (FormName.zklx[3].checked)//部分费用打折
	{
		if(	javaTrim(FormName.clfzk)=="") {
			alert("请输入[辅材费折扣]！");
			FormName.clfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.clfzk, "辅材费折扣"))) {
			return false;
		}
		if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
		{
			alert("错误！[辅材费折扣]应该在0和10之间！");
			FormName.clfzk.select();
			return false;
		}
		if(	javaTrim(FormName.zcfzk)=="") {
			alert("请输入[主材费折扣]！");
			FormName.clfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.zcfzk, "主材费折扣"))) {
			return false;
		}
		if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
		{
			alert("错误！[主材费折扣]应该在0和10之间！");
			FormName.zcfzk.select();
			return false;
		}
		if(	javaTrim(FormName.rgfzk)=="") {
			alert("请输入[人工费折扣]！");
			FormName.rgfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.rgfzk, "人工费折扣"))) {
			return false;
		}
		if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
		{
			alert("错误！[人工费折扣]应该在0和10之间！");
			FormName.rgfzk.select();
			return false;
		}
		if(	javaTrim(FormName.ysfzk)=="") {
			alert("请输入[运输费折扣]！");
			FormName.ysfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.ysfzk, "运输费折扣"))) {
			return false;
		}
		if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
		{
			alert("错误！[运输费折扣]应该在0和10之间！");
			FormName.ysfzk.select();
			return false;
		}
		if(	javaTrim(FormName.jxfzk)=="") {
			alert("请输入[机械费折扣]！");
			FormName.jxfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.jxfzk, "机械费折扣"))) {
			return false;
		}
		if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
		{
			alert("错误！[机械费折扣]应该在0和10之间！");
			FormName.jxfzk.select();
			return false;
		}
		if(	javaTrim(FormName.shfzk)=="") {
			alert("请输入[损耗费折扣]！");
			FormName.shfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.shfzk, "损耗费折扣"))) {
			return false;
		}
		if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
		{
			alert("错误！[损耗费折扣]应该在0和10之间！");
			FormName.shfzk.select();
			return false;
		}
		if(	javaTrim(FormName.qtfzk)=="") {
			alert("请输入[其它费折扣]！");
			FormName.qtfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfzk, "其它费折扣"))) {
			return false;
		}
		if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
		{
			alert("错误！[其它费折扣]应该在0和10之间！");
			FormName.qtfzk.select();
			return false;
		}

	

		if(	javaTrim(FormName.glfzk)=="") {
			alert("请输入[管理费折扣]！");
			FormName.glfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.glfzk, "管理费折扣"))) {
			return false;
		}
		if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
		{
			alert("错误！[管理费折扣]应该在0和10之间！");
			FormName.glfzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjzk)=="") {
			alert("请输入[税金折扣]！");
			FormName.sjzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjzk, "税金折扣"))) {
			return false;
		}
		if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
		{
			alert("错误！[税金折扣]应该在0和10之间！");
			FormName.sjzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjfzk)=="") {
			alert("请输入[设计费折扣]！");
			FormName.sjfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjfzk, "设计费折扣"))) {
			return false;
		}
		if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
		{
			alert("错误！[设计费折扣]应该在0和10之间！");
			FormName.sjfzk.select();
			return false;
		}

		if(	javaTrim(FormName.qtsfxmzk)=="") {
			alert("请输入[其它收费项目折扣]！");
			FormName.qtsfxmzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtsfxmzk, "其它收费项目折扣"))) {
			return false;
		}
		if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
		{
			alert("错误！[其它收费项目折扣]应该在0和10之间！");
			FormName.qtsfxmzk.select();
			return false;
		}
	
	}
	
	FormName.action="SaveEditJc_cxhd.jsp";
	FormName.submit();
	return true;
}

function f_scfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}

function f_sjd(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	
	FormName.action="InsertJc_cxhdsj.jsp";
	FormName.submit();
	return true;
	
}

function f_xq(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhdxq.jsp";
	FormName.submit();
	return true;
	
}

function f_xs(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhdyjxs.jsp";
	FormName.submit();
	return true;
	
}


function f_dm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhddm.jsp";
	FormName.submit();
	return true;
}

function f_zsxx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hdzsxx.jsp";
	FormName.submit();
	return true;
}

function f_dxzsxx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hddxzsxx.jsp";
	FormName.submit();
	return true;
}

function f_bfdz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hdbfxmdz.jsp";
	FormName.submit();
	return true;
}

function f_djj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hddjj.jsp";
	FormName.submit();
	return true;
}

function f_djfxbz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhddjfxbz.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
