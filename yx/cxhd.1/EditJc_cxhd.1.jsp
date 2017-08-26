<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;
int dj=0;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double jzk=0;
double gcfjzk=0;

double clfzk=0;
double zcfzk=0;
double rgfzk=0;
double ysfzk=0;
double jxfzk=0;
double shfzk=0;
double qtfzk=0;


String zjxzklx="";
double gczxzk=10;
double gcjxzk=10;
double zxglfzk=10;
double jxglfzk=10;
double zxsjzk=10;
double jxsjzk=10;

String hdlx=null;
String kgxqthd=null;
String zklx=null;
String bz=null;
String yxscdz=null;

String kssj=null;
String cxjssj=null;
String qdjssj=null;

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
	ls_sql="select cxhdmc,fgsbh,dj,gcfzk,glfzk,hdlx,kgxqthd,zklx,bz,yxscdz,sjzk,sjfzk,jzk,gcfjzk,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" ,zjxzklx,gczxzk,gcjxzk,zxglfzk,jxglfzk,zxsjzk,jxsjzk ";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));//1：同合同；2：独立折扣
		gczxzk=rs.getDouble("gczxzk");
		gcjxzk=rs.getDouble("gcjxzk");
		zxglfzk=rs.getDouble("zxglfzk");
		jxglfzk=rs.getDouble("jxglfzk");
		zxsjzk=rs.getDouble("zxsjzk");
		jxsjzk=rs.getDouble("jxsjzk");

		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dj=rs.getInt("dj");
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		jzk=rs.getDouble("jzk");
		gcfjzk=rs.getDouble("gcfjzk");
		hdlx=cf.fillNull(rs.getString("hdlx"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
		zklx=cf.fillNull(rs.getString("zklx"));
		bz=cf.fillNull(rs.getString("bz"));
		yxscdz=cf.fillNull(rs.getString("yxscdz"));

		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
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
            <input type="button" value="多选赠送信息" onClick="f_zsxx(insertform)" >
            <input type="button" value="单选赠送信息" onClick="f_dxzsxx(insertform)" >
            <input type="button" value="部分项目打折" onClick="f_bfdz(insertform)" >
            <input name="button" type="button" onClick="f_bfdz(insertform)" value="增减项折扣" >
            <input name="button2" type="button" onClick="f_bfdz(insertform)" value="部分费用打折" >
            <input type="button" value="代金券" onClick="f_djj(insertform)" >
            <input type="button" value="参加活动店面" onClick="f_dm(insertform)" >
            <input type="button" value="活动相关小区" onClick="f_xq(insertform)" >
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">促销活动编码</font></td>
      <td width="30%"> 
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
      <td align="right" width="20%"><font color="#FF0000">*</font>促销活动名称</td>
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
      <td colspan="4" align="center" bgcolor="#FFFFCC">活动折扣<font color="#CC0033"><strong>（适用于整单打折，若部分项目打折录入『部分项目打折』）</strong></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>折扣类型</td>
      <td colspan="3"><%
	cf.radioToken(out, "zklx","4+无折扣&1+全单打折&2+单项打折&3+部分费用打折&4+部分项目打折",zklx);
%></td>
    </tr>
    
    <tr bgcolor="#FFFFCC">
      <td colspan="4" align="center"><p>合同折扣</p></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>工程费折扣</td>
      <td width="30%"> 
        <input type="text" name="gcfzk" size="8" maxlength="9"  value="<%=gcfzk%>" >
        <b><font color="#0000FF">（>0且<=10）</font></b> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>管理费折扣</td>
      <td><input type="text" name="glfzk" size="8" maxlength="9"  value="<%=glfzk%>" >
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>税金折扣</td>
      <td><input type="text" name="sjzk" size="8" maxlength="8" value="<%=sjzk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>设计费折扣</td>
      <td><input type="text" name="sjfzk" size="8" maxlength="8" value="<%=sjfzk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">活动解释</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">备注</td>
      <td colspan="3"> 
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


//-->
</SCRIPT>
