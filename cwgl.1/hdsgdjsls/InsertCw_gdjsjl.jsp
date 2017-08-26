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
String zjxxh=null;
String gcjdbm=null;
double qye=0;
double wdzgce=0;
double hbssk=0;//环保项目实收款

double zjxje=0;
double zhzjxje=0;
double sfke=0;
double zkl=0;
double khjsje=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

double gckk=0;

String gdjsjlh=null;

try {
	conn=cf.getConnection();

	ls_sql="select zjxxh,khjsje,zkl,zjxwcbz,zjxje,zhzjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq,gcjdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		khjsje=rs.getDouble("khjsje");
		zkl=rs.getDouble("zkl");
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
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
        gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
	}
	rs.close();
	ps.close();
    
	 if (!gcjdbm.equals("4"))
	{
		out.println("错误！未完工工地，不能进行施工队结算");
		return;
	}
	if (zjxwcbz.equals("1"))
	{
		out.println("提示！该客户没有做工程增减结算工作，不能进行施工队结算");
		//out.println("提示！该客户没有做工程增减结算工作，不能进行施工队结算");
		//return;
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
		out.println("<P>错误！罚款有未审批记录，不能结算");
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
              <td align="right" width="20%">客户编号</td>
              <td width="30%"><%=khbh%></td>
              <td align="right" width="21%">合同号</td>
              <td width="29%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="30%"><%=khxm%>（<%=lxfs%>） </td>
              <td width="21%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="29%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="21%"> 
                <div align="right">设计师</div>
              </td>
              <td width="29%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">签约日期</td>
              <td width="30%"><%=qyrq%></td>
              <td align="right" width="21%">实际完结日期</td>
              <td width="29%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">合同开工日期</td>
              <td width="30%"><%=kgrq%></td>
              <td align="right" width="21%">合同竣工日期</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">实际开工日期</td>
              <td width="30%"><%=sjkgrq%></td>
              <td align="right" width="21%">实际竣工日期</td>
              <td width="29%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">施工队</font></td>
              <td width="30%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="21%"><font color="#0000FF">家装标志</font></td>
              <td width="29%"> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">家装签约额</font></td>
              <td width="30%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">工程原报价</font></td>
              <td width="29%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">折后累计增减项</font></td>
              <td width="30%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">折前累计增减项</font></td>
              <td width="29%"><%=zjxje%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">工程实际发生额</font></td>
              <td width="30%"><%=cf.doubleTrim(qye+zhzjxje,2)%>（<font color="#0000FF">签约额</font>＋<font color="#0000FF">折后增减项</font>）</td>
              <td align="right" width="21%"><font color="#0000FF">工程实收款总额</font></td>
              <td width="29%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>结算方式</td>
              <td width="30%"> 
                <input type="radio" name="jsfs" value="1">
                计提管理费 
                <input type="radio" name="jsfs" value="2">
                定额结算 </td>
              <td align="right" width="21%">客户结算金额</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=cf.doubleTrim(qye+zhzjxje,2)%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">提点基数</td>
              <td><select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(insertform)">
                <option value=""></option>
                <option value="1">客户结算金额</option>
                <option value="2">实收款</option>
                <option value="3">签约额</option>
                <option value="5">其它</option>
              </select></td>
              <td align="right">提点基数金额</td>
              <td><input type="text" name="tdjsje" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"> <font color="#990000">基价金额</font> </td>
              <td><input type="text" name="cbje" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
              <td align="right"><font color="#993300">施工队管理费率</font></td>
              <td><input type="text" name="sgdglftd" value="0" size="8" maxlength="8" onChange="calValue(insertform)">                <font color="#993300">%</font><font color="#990000">(定额结算费率</font><font color="#993300">）</font></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#993300">施工队结算总金额</font> </td>
              <td><input type="text" name="gdjskze" value="" size="12" maxlength="12" readonly>                <font color="#990000">(系统自动计算）</font></td>
              <td align="right"><font color="#993300">施工队结算费率</font></td>
              <td><input type="text" name="jsglftd" value="" size="8" maxlength="8" > 
                <font color="#993300">%</font><font color="#990000">(系统自动计算） </font></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#990000">补款金额</font></td>
              <td><input type="text" name="bk" value="0" size="20" maxlength="17" ></td> 
              <td align="right"><font color="#993300">计提管理费率</font></td>
              <td><input type="text" name="glftd" value="" size="8" maxlength="8" >
              <font color="#993300"> %</font>(<font color="#993300">计提管理费率）</font></td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">施工队承担工程扣款</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="21%" align="right">设计师承担工程扣款</td>
              <td width="29%"> 
                <input type="text" name="sjsfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">质检承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="21%"> 
                <div align="right">公司承担工程扣款</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gsfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">其它方承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000CC">工程扣款</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="gckk" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">施工队罚款</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="0" size="20" maxlength="17" >
              </td>
              <td align="right" width="21%">设计师罚款</td>
              <td width="29%"> 
                <input type="text" name="sjsfk" value="0" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">折扣率</font></td>
              <td width="30%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">结算单位</font></td>
              <td width="29%"> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">结算人</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000FF">结算时间</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input name="button" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户付款信息">
                  <input name="dejs" disabled type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="定额结算">
                  <input name="ckjs" disabled type="button" value="查看定额结算结果" onClick="window.open('ViewCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                  <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>              
                </p>
                <p> 
                  <input name="dydz" disabled type="button" value="打印定额结算单(队长)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input name="dygs" disabled type="button" value="打印定额结算单(内部)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
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
	if (FormName.tdjs.value=='1')//1：客户结算金额；2：实收款；3：签约额； 4：实际基价；5：工程量；9：其它
	{
		FormName.tdjsje.value=FormName.khjskze.value;
	}
	else if (FormName.tdjs.value=='2')
	{
		FormName.tdjsje.value=<%=(sfke)%>;
	}
	else if (FormName.tdjs.value=='3')
	{
		FormName.tdjsje.value=<%=qye%>;
	}
	else if (FormName.tdjs.value=='4')
	{
		FormName.tdjsje.value=FormName.cbje.value;
	}
	else if (FormName.tdjs.value=='5')
	{
		
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

function calValue(FormName)
{  
	var gdjskze=FormName.cbje.value*FormName.sgdglftd.value/100.0+FormName.cbje.value*1.00;
	gdjskze=round(gdjskze,2);
	var khjskze=FormName.khjskze.value*1.0;
	jsglftd=1*((gdjskze*100.0)/khjskze);
	jsglftd=round(jsglftd,2);
	FormName.gdjskze.value=gdjskze;
	FormName.jsglftd.value=jsglftd ;   
	FormName.glftd.value=round((100-FormName.jsglftd.value),2); 	
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
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("请输入[折后累计增减项]！");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "折后累计增减项"))) {
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

	if(	!radioChecked(FormName.jsfs)) {
		alert("请选择[结算方式]！");
		FormName.jsfs[0].focus();
		return false;
	}
    if (FormName.jsfs[1].checked)
	{
		FormName.glftd.value="0"; 

		if(	javaTrim(FormName.cbje)=="") {
			alert("请输入[基价金额]！");
			FormName.cbje.focus();
			return false;
		}
		if (FormName.cbje.value=="0")
		{
			alert("错误！[定额方式结算的基价金额]不能为0！");
			FormName.cbje.focus();
			return false;
		}
		if(!(isFloat(FormName.cbje, "基价金额"))) {
			return false;
		}
		if(	javaTrim(FormName.sgdglftd)=="") {
			alert("请输入[施工队管理费率]！");
			FormName.sgdglftd.focus();
			return false;
		}
		if (FormName.sgdglftd.value=="0")
		{
			alert("错误！[定额方式结算的施工队管理费率]不能为0！");
			FormName.sgdglftd.focus();
			return false;
		}
		if (FormName.jsglftd.value<0 || FormName.jsglftd.value>=100)
		{
			alert("错误！[施工队结算总金额]不能高于[客户结算金额]！");
			FormName.gdjskze.select();
			return false;
		}
		if(!(isFloat(FormName.sgdglftd, "施工队管理费率"))) {
			return false;
		}	
		
	}	

    if (FormName.jsfs[0].checked)
	{	
		FormName.cbje.value="0"; 
	    FormName.sgdglftd.value="0"; 
	    FormName.gdjskze.value="0"; 
	    FormName.jsglftd.value="0"; 
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
		if(	javaTrim(FormName.glftd)=="") {
			alert("请输入[计提管理费率]！");
			FormName.glftd.focus();
			return false;
		}
		if (FormName.glftd.value=="0")
		{
			alert("错误！[计提管理费率]不能为0！");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "计提管理费率"))) {
			return false;
		}
		if (FormName.glftd.value<0 || FormName.glftd.value>=100)
		{
			alert("错误！[计提管理费率]应该在0和100之间！");
			FormName.glftd.select();
			return false;
		}	
	}
	if(	javaTrim(FormName.khjskze)=="") {
		alert("请输入[客户结算金额]！");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "客户结算金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cbje, "实际基价"))) {
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
	if(	javaTrim(FormName.bk)=="") {
		alert("请输入[补款]！");
		FormName.bk.focus();
		return false;
	}
	if(!(isFloat(FormName.bk, "补款"))) {
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
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请输入[施工队罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "施工队罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfk)=="") {
		alert("请输入[设计师罚款]！");
		FormName.sjsfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfk, "设计师罚款"))) {
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
	FormName.ckjs.disabled=false;
	FormName.dydz.disabled=false;
	FormName.dygs.disabled=false;
	return true;
}

//-->
</SCRIPT>
