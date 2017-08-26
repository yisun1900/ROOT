<%@ page contentType="text/html;charset=GBK" %>
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
              <td width="20%" align="right"><font color="#FF0000">*</font>所属分公司</td>
              <td width="30%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
              <td width="20%" align="right"><font color="#FF0000">*</font>促销活动名称</td>
              <td colspan="3"> 
                <input type="text" name="cxhdmc" value="" size="71" maxlength="50" >              </td>
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
              <td colspan="4" align="center" bgcolor="#FFFFCC">活动折扣<font color="#CC0033"><strong>（适用于整单打折，若部分项目打折录入『部分项目打折』）</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>折扣类型</td>
              <td colspan="3"><input type="radio" name="zklx" value="4">
                无折扣
                <input type="radio" name="zklx" value="1">
                全单打折
                <input type="radio" name="zklx" value="2">
单项打折
<input type="radio" name="zklx" value="2">
工程费部分打折</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否允许双重打折</td>
              <td colspan="3"><input type="radio" name="yxscdz" value="1">
                允许采用折扣累加
                  <input type="radio" name="yxscdz" value="2">
                允许采用折上折
                <input type="radio" name="yxscdz" value="9">
                不允许</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td colspan="4" align="center"><p>签单折扣</p></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>工程费折扣</td>
              <td width="30%"> 
                <input type="text" name="gcfzk" size="8" maxlength="8" >
                <b><font color="#0000FF">（>0且<=10）</font></b> </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="21" align="right"><font color="#FF0000">*</font>管理费折扣</td>
              <td><input type="text" name="glfzk" size="8" maxlength="8" >
                <b><font color="#0000FF">（>=0且<=10）</font></b></td>
              <td align="right"><font color="#FF0000">*</font>税金折扣</td>
              <td><input type="text" name="sjzk" size="8" maxlength="8" >
                <b><font color="#0000FF">（>=0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>设计费折扣</td>
              <td width="30%"><input type="text" name="sjfzk" size="8" maxlength="8" >
                <b><font color="#0000FF">（>=0且<=10）</font></b></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td colspan="4" align="center"><p>增减项打折</p></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>增减项折扣类型</td>
              <td colspan="3">
			  <INPUT type="radio" name="zjxzklx" value="1" onClick="f_lx(insertform)">
                同合同
                <INPUT type="radio" name="zjxzklx" value="2" onClick="f_lx(insertform)">
                独立折扣 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>工程增项折扣</td>
              <td><input type="text" name="gczxzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">（>=0且<=10）</font></b></td>
              <td align="right"><font color="#FF0000">*</font>工程减项折扣</td>
              <td><input type="text" name="gcjxzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">（>=0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="21" align="right"><font color="#FF0000">*</font>增项管理费折扣</td>
              <td><input type="text" name="zxglfzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">（>=0且<=10）</font></b></td>
              <td align="right"><font color="#FF0000">*</font>减项管理费折扣</td>
              <td><input type="text" name="jxglfzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">（>=0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>增项税金折扣</td>
              <td><input type="text" name="zxsjzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">（>=0且<=10）</font></b></td>
              <td align="right"><font color="#FF0000">*</font>减项税金折扣</td>
              <td><input type="text" name="jxsjzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">（>=0且<=10）</font></b></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">活动解释</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="19"></textarea>              </td>
            </tr>
        </table>
</form>
	  

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_lx(FormName)//参数FormName:Form的名称
{
	if (FormName.zjxzklx[0].checked)//同合同 
	{
		FormName.gczxzk.value=FormName.gcfzk.value;
		FormName.gcjxzk.value=FormName.gcfzk.value;
		FormName.zxglfzk.value=FormName.glfzk.value;
		FormName.jxglfzk.value=FormName.glfzk.value;
		FormName.zxsjzk.value=FormName.sjzk.value;
		FormName.jxsjzk.value=FormName.sjzk.value;
	}
}

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

	if(	javaTrim(FormName.gcfzk)=="") {
		alert("请输入[工程费折扣]！");
		FormName.gcfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfzk, "工程费折扣"))) {
		return false;
	}
	if (FormName.gcfzk.value<=0 || FormName.gcfzk.value>10)
	{
		alert("错误！[工程费折扣]应该在0和10之间！");
		FormName.gcfzk.select();
		return false;
	}

	if(	javaTrim(FormName.gczxzk)=="") {
		alert("请输入[工程增项折扣]！");
		FormName.gczxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzk, "工程增项折扣"))) {
		return false;
	}
	if (FormName.gczxzk.value<0 || FormName.gczxzk.value>10)
	{
		alert("错误！[工程增项折扣]应该在0和10之间！");
		FormName.gczxzk.select();
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

	if(	!radioChecked(FormName.zjxzklx)) {
		alert("请选择[增减项折扣类型]！");
		FormName.zjxzklx[0].focus();
		return false;
	}
	if (FormName.zjxzklx[0].checked)//同合同 
	{
		FormName.gczxzk.value=FormName.gcfzk.value;
		FormName.gcjxzk.value=FormName.gcfzk.value;
		FormName.zxglfzk.value=FormName.glfzk.value;
		FormName.jxglfzk.value=FormName.glfzk.value;
		FormName.zxsjzk.value=FormName.sjzk.value;
		FormName.jxsjzk.value=FormName.sjzk.value;
	}
	
	if(	javaTrim(FormName.gczxzk)=="") {
		alert("请输入[工程增项折扣]！");
		FormName.gczxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzk, "工程增项折扣"))) {
		return false;
	}
	if (FormName.gczxzk.value<0 || FormName.gczxzk.value>10)
	{
		alert("错误！[工程增项折扣]应该在0和10之间！");
		FormName.gczxzk.select();
		return false;
	}

	if(	javaTrim(FormName.gcjxzk)=="") {
		alert("请输入[工程减项折扣]！");
		FormName.gcjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzk, "工程减项折扣"))) {
		return false;
	}
	if (FormName.gcjxzk.value<0 || FormName.gcjxzk.value>10)
	{
		alert("错误！[工程减项折扣]应该在1和10之间！");
		FormName.gcjxzk.select();
		return false;
	}

	if(	javaTrim(FormName.zxglfzk)=="") {
		alert("请输入[增项管理费折扣]！");
		FormName.zxglfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zxglfzk, "增项管理费折扣"))) {
		return false;
	}
	if (FormName.zxglfzk.value<0 || FormName.zxglfzk.value>10)
	{
		alert("错误！[增项管理费折扣]应该在1和10之间！");
		FormName.zxglfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxglfzk)=="") {
		alert("请输入[减项管理费折扣]！");
		FormName.jxglfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxglfzk, "减项管理费折扣"))) {
		return false;
	}
	if (FormName.jxglfzk.value<0 || FormName.jxglfzk.value>10)
	{
		alert("错误！[减项管理费折扣]应该在1和10之间！");
		FormName.jxglfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zxsjzk)=="") {
		alert("请输入[增项税金折扣]！");
		FormName.zxsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zxsjzk, "增项税金折扣"))) {
		return false;
	}
	if (FormName.zxsjzk.value<0 || FormName.zxsjzk.value>10)
	{
		alert("错误！[增项税金折扣]应该在1和10之间！");
		FormName.zxsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxsjzk)=="") {
		alert("请输入[减项税金折扣]！");
		FormName.zxsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxsjzk, "减项税金折扣"))) {
		return false;
	}
	if (FormName.jxsjzk.value<0 || FormName.jxsjzk.value>10)
	{
		alert("错误！[减项税金折扣]应该在1和10之间！");
		FormName.jxsjzk.select();
		return false;
	}
	
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
	
	if (parseFloat(FormName.gcfzk.value)!=10 && (parseFloat(FormName.clfzk.value)!=10 || parseFloat(FormName.zcfzk.value)!=10 || parseFloat(FormName.rgfzk.value)!=10 || parseFloat(FormName.ysfzk.value)!=10 || parseFloat(FormName.jxfzk.value)!=10 || parseFloat(FormName.shfzk.value)!=10 || parseFloat(FormName.qtfzk.value)!=10) )
	{
		alert("错误！[工程费折扣]与[工程费部分打折]不能同时存在！");
		FormName.gcfzk.select();
		return false;
	}
	
	
	if(	javaTrim(FormName.gcfjzk)=="") {
		alert("请输入[工程费净折扣]！");
		FormName.gcfjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfjzk, "工程费净折扣"))) {
		return false;
	}
	if (FormName.gcfjzk.value<=0 || FormName.gcfjzk.value>10)
	{
		alert("错误！[工程费净折扣]应该在0和10之间！");
		FormName.gcfjzk.select();
		return false;
	}
	if(	javaTrim(FormName.jzk)=="") {
		alert("请输入[全单净折扣]！");
		FormName.jzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzk, "全单净折扣"))) {
		return false;
	}
	if (FormName.jzk.value<=0 || FormName.jzk.value>10)
	{
		alert("错误！[全单净折扣]应该在0和10之间！");
		FormName.jzk.select();
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
	if(	!radioChecked(FormName.yxscdz)) {
		alert("请选择[是否允许双重打折]！");
		FormName.yxscdz[0].focus();
		return false;
	}

	if (FormName.zklx[0].checked)
	{
		if (parseFloat(FormName.gcfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[工程费折扣]应该为10！");
			FormName.gcfzk.select();
			return false;
		}

		if (parseFloat(FormName.gczxzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[工程增项折扣]应该为10！");
			FormName.gczxzk.select();
			return false;
		}

		if (parseFloat(FormName.glfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[管理费折扣]应该为10！");
			FormName.glfzk.select();
			return false;
		}
		if (parseFloat(FormName.sjzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[税金折扣]应该为10！");
			FormName.sjzk.select();
			return false;
		}
		if (parseFloat(FormName.sjfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[设计费折扣]应该为10！");
			FormName.sjfzk.select();
			return false;
		}
		if (parseFloat(FormName.gcfjzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[工程费净折扣]应该为10！");
			FormName.jzk.select();
			return false;
		}
		if (parseFloat(FormName.jzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[全单净折扣]应该为10！");
			FormName.jzk.select();
			return false;
		}

	
		if (parseFloat(FormName.clfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[辅材费折扣]应该为10！");
			FormName.clfzk.select();
			return false;
		}
		if (parseFloat(FormName.zcfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[主材费折扣]应该为10！");
			FormName.zcfzk.select();
			return false;
		}
		if (parseFloat(FormName.rgfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[人工费折扣]应该为10！");
			FormName.rgfzk.select();
			return false;
		}
		if (parseFloat(FormName.ysfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[运输费折扣]应该为10！");
			FormName.ysfzk.select();
			return false;
		}
		if (parseFloat(FormName.jxfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[机械费折扣]应该为10！");
			FormName.jxfzk.select();
			return false;
		}
		if (parseFloat(FormName.shfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[损耗费折扣]应该为10！");
			FormName.shfzk.select();
			return false;
		}
		if (parseFloat(FormName.qtfzk.value)!=10)
		{
			alert("错误！[折扣类型]为无折扣，[其它费折扣]应该为10！");
			FormName.qtfzk.select();
			return false;
		}
	
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[订金]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isNumber(FormName.dj, "订金"))) {
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




	FormName.action="SaveInsertJc_cxhd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
