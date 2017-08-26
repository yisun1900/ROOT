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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String yxbffydz="";//是否允许部分费用打折  1：允许；9：不允许

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sq_dwxx.yxbffydz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
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


<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
      <div align="center"> 请录入促销活动</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>所属分公司</td>
              <td width="32%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>促销活动名称</td>
              <td colspan="3"> 
                <input type="text" name="cxhdmc" value="" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>活动类型</td>
              <td colspan="3"><input type="radio" name="hdlx" value="1">
                无活动
                <input type="radio" name="hdlx" value="2">
                公司活动
                <input type="radio" name="hdlx" value="3">
                小区活动
                <input type="radio" name="hdlx" value="4">
                展会活动
                <input type="radio" name="hdlx" value="5">
                市场活动</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>可共享其它活动</td>
              <td><%
	cf.radioToken(out, "kgxqthd","1+不可共享&2+可共享","");
%></td>
              <td align="right"><font color="#FF0000">*</font>订金</td>
              <td><input type="text" name="dj" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>多倍返现工程款</td>
              <td><input type="text" name="fxgck" value="" size="10" maxlength="8" >
                <strong><font color="#FF0000">（录入倍数）</font></strong></td>
              <td align="right"><font color="#FF0000">*</font>多倍返现主材款</td>
              <td><input type="text" name="fxzck" value="0" size="10" maxlength="8" >
              <strong><font color="#FF0000">（录入倍数）</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">活动有效时间              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>开始时间(>=)</td>
              <td><input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td colspan="2" align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>促销结束时间(<=) </td>
              <td><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"><font color="#FF0000">*</font>签单结束时间(<=) </td>
              <td><input type="text" name="qdjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">活动折扣</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>折扣类型</td>
              <td colspan="3">
  
  <INPUT type="radio" name="zklx" value="4"  onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    无折扣
  <INPUT type="radio" name="zklx" value="1"  onClick="zddz.style.display='block';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    整单打折
      <INPUT type="radio" name="zklx" value="2" onClick="zddz.style.display='none';dxdz.style.display='block';bfdz.style.display='none';qtdz.style.display='block'">
      单项打折
<%
	if (yxbffydz.equals("1"))//是否允许部分费用打折  1：允许；9：不允许
	{
		%>
		  <input type="radio" name="zklx" value="3" onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='block';qtdz.style.display='block'">部分费用打折
		<%
	}
%>

           </tr>
			  </td>
 </table>

<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="zddz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">整单打折</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>整单折扣</td>
  <td width="32%"><input name="zdzk" type="text"  value="" size="8" maxlength="8" >
    <b><font color="#0000FF">（>0且<=10）</font></b></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>工程费部分打折</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>工程－辅材费折扣</td>
  <td width="32%"><input type="text" name="clfzk" size="8" maxlength="9"  value="" >
      <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>工程－主材费折扣</td>
  <td width="32%"><input type="text" name="zcfzk" size="8" maxlength="9"  value="" >
      <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程－人工费折扣</td>
  <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="" >
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>工程－运输费折扣</td>
  <td><input type="text" name="ysfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程－机械费折扣</td>
  <td><input type="text" name="jxfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>工程－损耗费折扣</td>
  <td><input type="text" name="shfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程－其它费折扣</td>
  <td><input type="text" name="qtfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="dxdz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>单项打折</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>工程费折扣</td>
  <td><input type="text" name="gcfzk" value="" size="8" maxlength="8" >
      <b><font color="#0000FF">（>0且<=10）</font></b> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>增减项折扣类型</td>
  <td width="32%"><INPUT type="radio" name="zjxzklx" value="1"  >
    同合同
    <INPUT type="radio" name="zjxzklx" value="2"  >
    独立折扣 </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>是否有部分项目打折</td>
  <td width="32%"><input type="radio" name="sfybfxmzk" value="Y"  >
    有
    <input name="sfybfxmzk" type="radio" value="N"  >
    无</td>
</tr>

</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="qtdz" >
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>管理费折扣</td>
  <td width="32%"><input type="text" name="glfzk" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>税金折扣</td>
  <td width="32%"><input type="text" name="sjzk" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>设计费折扣</td>
  <td><input type="text" name="sjfzk" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>其它收费项目折扣</td>
  <td><input name="qtsfxmzk" type="text" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
</table>


<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td width="82%" colspan="3"> 
              <textarea name="bz" cols="72" rows="19"></textarea>              </td>
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
	if(	!radioChecked(FormName.zklx)) {
		alert("请选择[折扣类型]！");
		FormName.zklx[0].focus();
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


	FormName.action="SaveInsertJc_cxhd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
