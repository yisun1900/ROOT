<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String jsdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String khbh=request.getParameter("khbh");
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
double qye=0;
double wdzgce=0;
double hbssk=0;//环保项目实收款

double zjxje=0;
double sfke=0;
double zkl=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

double gckk=0;

String gdjsjlh=null;

try {
	conn=cf.getConnection();

	ls_sql="select zkl,zjxwcbz,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		zkl=rs.getDouble("zkl");
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxje=rs.getDouble("zjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");

		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

	}
	rs.close();
	ps.close();

	if (zjxwcbz.equals("1"))
	{
//		out.println("错误！增减项未完成，不能结算");
//		return;
	}

	if (jzbz.equals(""))
	{
		jzbz="1";
	}




	//环保项目
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='92' and scbz='N'";//92：环保项目
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=rs.getDouble(1);//已收环保项目款
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='92' and scbz='N'";//转出环保项目款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=hbssk-rs.getDouble(1);
	}
	rs.close();
	ps.close();

/************************************************************************/
	
	//罚款金额
	ls_sql="select count(*)";
	ls_sql+=" from  kp_xjgdjl,crm_khxx";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and crm_khxx.sgd='"+sgd+"' and kp_xjgdjl.jsbz='N' and kp_xjgdjl.cfspbz in('2') ";//2：未审批；3：审批通过；4：审批未通过
	ls_sql+=" and kp_xjgdjl.fkze>0 ";      //2006-03-02修改过   只审批罚款金额>0;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！罚款有未审批记录，不能结算");
		return;
	}

/************************************************************************/

	//获取记录号
	ls_sql="select NVL(max(substr(gdjsjlh,8,2)),0)";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gdjsjlh=khbh+cf.addZero(count+1,2);
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
		if (ps != null) ps.close(); 
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
      <div align="center">施工队结算（结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right">客户编号</td>
              <td><%=khbh%></td>
              <td align="right">合同号</td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">客户姓名</div>
              </td>
              <td><%=khxm%> </td>
              <td> 
                <div align="right">质检姓名</div>
              </td>
              <td><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">签约店面</div>
              </td>
              <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td> 
                <div align="right">设计师</div>
              </td>
              <td><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">签约日期</td>
              <td><%=qyrq%></td>
              <td align="right">实际完结日期</td>
              <td><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">合同开工日期</td>
              <td><%=kgrq%></td>
              <td align="right">合同竣工日期</td>
              <td><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">实际开工日期</td>
              <td><%=sjkgrq%></td>
              <td align="right">实际竣工日期</td>
              <td><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">施工队</font></td>
              <td> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">家装标志</font></td>
              <td> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">家装签约额</font></td>
              <td> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">未打折工程额</font></td>
              <td> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">增减项金额</font></td>
              <td> 
                <input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">工程实收款总额</font></td>
              <td> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF"></font></td>
              <td> 
              </td>
              <td align="right"><font color="#0000FF">环保项目实收款</font></td>
              <td> 
                <input type="text" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">客户结算金额</td>
              <td> 
                <input type="text" name="khjskze" value="" size="20" maxlength="17" onChange="f_jsglf(insertform)">
              </td>
              <td align="right">实际成本</td>
              <td> 
                <input name="sjcb" type="text" id="sjcb" value="" size="20" maxlength="17" onChange="f_jsglf(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">提点基数</td>
              <td> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(insertform)">
                  <option value=""></option>
                  <option value="1">客户结算金额</option>
                  <option value="2">实收款</option>
                  <option value="3">签约额</option>
                  <option value="4">实际成本</option>
                  <option value="9">其它</option>
                </select>
              </td>
              <td align="right">提点基数金额</td>
              <td> 
                <input type="text" name="tdjsje" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">工程扣款</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gckk" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="18%"> 
                <div align="right">设计师承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjsfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">施工队承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sgdfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="18%"> 
                <div align="right">质检承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zjfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">公司承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gsfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="18%"> 
                <div align="right">其它方承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qtfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">折扣率</font></td>
              <td> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">结算单位</font></td>
              <td> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算时间</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input name="button" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
                  <input name="dejs" type="button" disabled onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>')" value="定额结算">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                </p>
              </td>
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
function f_jsglf(FormName)//参数FormName:Form的名称
{
	if (FormName.tdjs.value=='1')//1：客户结算金额；2：实收款；3：签约额； 4：实际成本；5：工程量；9：其它
	{
		FormName.tdjsje.value=FormName.khjskze.value;
	}
	else if (FormName.tdjs.value=='2')
	{
		FormName.tdjsje.value=<%=(sfke)%>;
	}
	else if (FormName.tdjs.value=='3')
	{
		FormName.tdjsje.value=<%=(qye)%>;
	}
	else if (FormName.tdjs.value=='4')
	{
		FormName.tdjsje.value=FormName.sjcb.value;
	}
	else if (FormName.tdjs.value=='9')
	{
	}

}

function f_gckk(FormName)//参数FormName:Form的名称
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=parseInt(gk*100.0+0.5)/100.0;
	FormName.gckk.value=gk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jzbz)=="") {
		alert("请选择[家装标志]！");
		FormName.jzbz.focus();
		return false;
	}

	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[未打折工程额]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "未打折工程额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "折扣率"))) {
		return false;
	}
	if(	javaTrim(FormName.khjskze)=="") {
		alert("请输入[客户结算金额]！");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "客户结算金额"))) {
		return false;
	}

	if(	javaTrim(FormName.khsskze)=="") {
		alert("请输入[客户实收款总额]！");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "客户实收款总额"))) {
		return false;
	}
	if(	javaTrim(FormName.hbssk)=="") {
		alert("请输入[环保项目实收款]！");
		FormName.hbssk.focus();
		return false;
	}
	if(!(isFloat(FormName.hbssk, "环保项目实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.tdjs)=="") {
		alert("请选择[提点基数]！");
		FormName.tdjs.focus();
		return false;
	}
	if(	javaTrim(FormName.tdjsje)=="") {
		alert("请输入[提点基数金额]！");
		FormName.tdjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.tdjsje, "提点基数金额"))) {
		return false;
	}

	if(!(isFloat(FormName.sjcb, "实际成本"))) {
		return false;
	}

	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("请输入[设计师承担费用]！");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "设计师承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("请输入[施工队承担费用]！");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "施工队承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("请输入[质检承担费用]！");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "质检承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("请输入[公司承担费用]！");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "公司承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("请输入[其它方承担费用]！");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "其它方承担费用"))) {
		return false;
	}



	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[结算人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[结算时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jsdw)=="") {
		alert("请选择[结算单位]！");
		FormName.jsdw.focus();
		return false;
	}


	FormName.action="SaveInsertCw_gdjsjl.jsp";
	FormName.submit();
	FormName.dejs.disabled=false;
	return true;
}

//-->
</SCRIPT>
