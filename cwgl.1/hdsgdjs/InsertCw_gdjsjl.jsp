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
double qye=0;
double wdzgce=0;
double hbssk=0;//环保项目实收款

double zjxje=0;
double zhzjxje=0;
double sfke=0;
double zkl=0;
double khjsje=0;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int count=0;

double gckk=0;

String gdjsjlh=null;

int row=0;
String bgcolor=null;

try {
	conn=cf.getConnection();

	ls_sql="select zjxxh,khjsje,zkl,zjxwcbz,zjxje,zhzjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq,kbxbz,bxkssj,bxjzsj,bybxsm";
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

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
	}
	rs.close();
	ps.close();

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
                <input type="radio" name="jsfs" value="2" checked>
                定额结算 </td>
              <td align="right" width="21%">客户结算金额</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=cf.doubleTrim(qye+zhzjxje,2)%>" size="20" maxlength="17" >
              </td>
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
          </table>

		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#999999" align="center"> 
              <td colspan="4">请确认保修信息</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">可保修标志</div>
              </td>
              <td colspan="3"> <%
	cf.radioToken(out, "kbxbz","Y+保修&M+部分保修&N+不保修",kbxbz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">保修开始时间</td>
              <td width="33%"> 
                <input type="text" name="bxkssj" value="<%=bxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">保修截止时间</td>
              <td width="31%"> 
                <input type="text" name="bxjzsj" value="<%=bxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">保修说明</td>
              <td colspan="3"> 
                <textarea name="bybxsm" cols="71" rows="3"><%=bybxsm%></textarea>
              </td>
            </tr>
          </table>
  
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="6%">选择保修项目</td>
	<td width="35%">项目名称（<font color="#FF0000"><b>打勾代表保修，不打勾不保修</b></font>）</td>
      <td width="59%">情况说明</td>
    </tr>
<%
	String bxxm=null;
	String xmsm=null;

	ls_sql="SELECT bxxm,xmsm";
	ls_sql+=" FROM crm_bxxmbm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bxxm=rs.getString("bxxm");
		xmsm=rs.getString("xmsm");

		String sfbx="";
		String qksm="";
		String mark="";
		ls_sql="SELECT sfbx,qksm";
		ls_sql+=" FROM crm_khbxxm";
		ls_sql+=" where khbh='"+khbh+"' and bxxm='"+bxxm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfbx=rs1.getString("sfbx");
			qksm=cf.fillNull(rs1.getString("qksm"));
		}
		rs1.close();
		ps1.close();

		if (sfbx.equals(""))
		{
			mark="checked";
		}
		else if (sfbx.equals("Y"))
		{
			mark="checked";
		}
		else{
			mark="";
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
		  <td>
			<input name="xzbxxm" type="checkbox" value="<%=bxxm%>" <%=mark%>>
		  </td>
		  <td><%=bxxm%>
			<input type="hidden" name="bxxm" value="<%=bxxm%>">
		</td>
		  <td>
			<input type="text" name="qksm" value="<%=qksm%>" size="56" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
          </table>
		  
		  
		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input name="clzdyxm" disabled type="button" onClick="window.open('ClZdyXm.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="调整工料分析">
                  <input name="dejs" disabled type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="定额结算">
                  <input name="button" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户付款信息">
                  <input type="button" value="重建工料分析" onClick="window.open('UpdateGlfx.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>')">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                  <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                  <input name="sjcb" type="hidden" value="" size="20" maxlength="17" >
                </p>
                <p>
                  <input name="ckjs" disabled type="button" value="查看定额结算结果" onClick="window.open('ViewCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
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

	if(	javaTrim(FormName.khjskze)=="") {
		alert("请输入[客户结算金额]！");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "客户结算金额"))) {
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




	if(	!radioChecked(FormName.kbxbz)) {
		alert("请选择[可保修标志]！");
		FormName.kbxbz[0].focus();
		return false;
	}

	if (FormName.kbxbz[0].checked || FormName.kbxbz[1].checked)
	{
		if(	javaTrim(FormName.bxkssj)=="") {
			alert("请输入[保修开始时间]！");
			FormName.bxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxkssj, "保修开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.bxjzsj)=="") {
			alert("请输入[保修截止时间]！");
			FormName.bxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxjzsj, "保修截止时间"))) {
			return false;
		}

		var choo=0;

		var i = 0;
		if (<%=row%>==1){
			if( FormName.xzbxxm.checked ){
				choo=1;
			}
		} 
		else{ 
			for (i=0;i <<%=row%>;i++ ){
				if( FormName.xzbxxm[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择【保修项目】");
			return false;
		}
	
	}
	else{
		FormName.bxkssj.value="";
		FormName.bxjzsj.value="";

		if(	javaTrim(FormName.bybxsm)=="") {
			alert("请选择[保修说明]！");
			FormName.bybxsm.focus();
			return false;
		}
	}






	FormName.action="SaveInsertCw_gdjsjl.jsp";
	FormName.submit();
	FormName.dejs.disabled=false;
	FormName.clzdyxm.disabled=false;
	FormName.ckjs.disabled=false;
	FormName.dydz.disabled=false;
	FormName.dygs.disabled=false;
	return true;
}

//-->
</SCRIPT>
