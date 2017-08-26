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

<body bgcolor="#FFFFFF">


<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String dwbh= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
double wdzgce= 0;
double qye= 0;
double zkl= 0;
double zjxzkl= 0;
double cdzwjmje= 0;
double glfjmje= 0;
double sjjmje= 0;

double suijin= 0;
double suijinbfb= 0;
double glfbfb= 0;
double zqguanlif= 0;
double guanlif= 0;
double sjf= 0;
double glf= 0;

double zqwjrqyexm= 0;
double zhwjrqyexm= 0;
String wjrqyexmsm=null;

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

double qdhdzk=10;
double glfzk=10;
double zjxhdzk=10;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,fgsbh,dwbh,sjsbh,sjs,sjsgh,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,glfbfb,zqguanlif,guanlif,sjf,glf ";
	ls_sql+=" ,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm ,cxhdbm,cxhdbmxq,cxhdbmzh ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		zjxzkl=rs.getDouble("zjxzkl");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");

		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();

	ls_sql="select qdhdzk,glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
		zjxhdzk=rs.getDouble("zjxhdzk");
	}
	rs.close();
	ps.close();

	if (qdhdzk<10 || glfzk<10 )
	{
		out.println("<P><font color='#FF0000'><strong>提醒：促销活动有折扣，折扣将被忽略，请确认是否正确</strong></font>");
	}


	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  cw_qyexgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	
	}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}


%>


<form method="post" action="SaveInsertCw_qyexgjl2.jsp" name="insertform" target="_blank">
<div align="center">修改－签约额（<font color="#FF0000"><strong>所有金额手动计算，系统不自动计算</strong></font>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">修改记录号</font></td>
      <td width="31%"> 
      <input type="text" name="xgjlh" value="<%=xgjlh%>" size="20" maxlength="9" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">客户编号</font></td>
      <td width="31%"> 
        <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000FF">合同号</font></td>
      <td width="31%"> <%=hth%> </td>
      <td align="right" width="19%"><font color="#0000FF">客户姓名</font></td>
      <td width="31%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000FF">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000FF">签约店面</font></td>
      <td width="31%"> 
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>         </td>
      <td align="right" width="19%"><font color="#0000FF">设计师</font></td>
      <td width="31%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000FF">公司促销活动</font></td>
      <td colspan="3"><%=cxhdbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000FF">小区促销活动</font></td>
      <td colspan="3"><%=cxhdbmxq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000FF">展会促销活动</font></td>
      <td colspan="3"><%=cxhdbmzh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center">促销活动折扣</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">签单折扣</font></td>
      <td><%=qdhdzk%></td>
      <td align="right"><font color="#0000FF">管理费折扣</font></td>
      <td><%=glfzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="19%" align="right"><font color="#0000FF">增减项折扣</font></td>
      <td width="31%"><%=zjxhdzk%></td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#E8E8FF"><strong><font color="#0000FF">修改前</font></strong></td>
      <td colspan="2" align="center" bgcolor="#FFFFCC"><strong>修改后</strong></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">工程原报价</font></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <input type="text" name="xgqwdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>      </td>
      <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>工程原报价</td>
      <td width="31%" bgcolor="#FFFFCC"> 
        <input type="text" name="xghwdzgce" value="<%=wdzgce%>" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">合同折扣</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqzkl" value="<%=zkl%>" size="10" maxlength="9" readonly>
        （>0且<=10） </td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>合同折扣</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghzkl" value="<%=zkl%>" size="10" maxlength="9"  >
        （>0且<=10） </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">增减项折扣</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqzjxzkl" value="<%=zjxzkl%>" size="10" maxlength="9" readonly>
        （>0且<=10）</td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>增减项折扣</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghzjxzkl" value="<%=zjxzkl%>" size="10" maxlength="9" >
        （>0且<=10） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">签约额</font></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <input type="text" name="xgqqye" value="<%=qye%>" size="20" maxlength="17" readonly>      </td>
      <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>签约额</td>
      <td width="31%" bgcolor="#FFFFCC"> 
        <input type="text" name="xghqye" value="<%=qye%>" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">合同减免额</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqcdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="17" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>合同减免额</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghcdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="17"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">管理费百分比</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqglfbfb" value="<%=glfbfb%>" size="20" maxlength="17" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>管理费百分比</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghglfbfb" value="<%=glfbfb%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">折前管理费</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqzqguanlif" value="<%=zqguanlif%>" size="20" maxlength="17" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>折前管理费</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghzqguanlif" value="<%=zqguanlif%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">折后管理费</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqguanlif" value="<%=guanlif%>" size="20" maxlength="17" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>折后管理费</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghguanlif" value="<%=guanlif%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">管理费减免额</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqglfjmje" value="<%=glfjmje%>" size="20" maxlength="17" ></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>管理费减免额</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghglfjmje" value="<%=glfjmje%>" size="20" maxlength="17" ></td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">税金百分比</font></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <input type="text" name="xgqsuijinbfb" value="<%=suijinbfb%>" size="10" maxlength="9" readonly>
        % </td>
      <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>税金百分比</td>
      <td width="31%" bgcolor="#FFFFCC"> 
        <input type="text" name="xghsuijinbfb" value="<%=suijinbfb%>" size="10" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">税金</font></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <input type="text" name="xgqsuijin" value="<%=suijin%>" size="20" maxlength="17" readonly>      </td>
      <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>税金</td>
      <td width="31%" bgcolor="#FFFFCC"> 
        <input type="text" name="xghsuijin" value="<%=suijin%>" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">税金减免额</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqsjjmje" value="<%=sjjmje%>" size="20" maxlength="17" ></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>税金减免额</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghsjjmje" value="<%=sjjmje%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">折前未记入签约额项目</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqzqwjrqyexm" size="20" maxlength="17"  value="<%=zqwjrqyexm%>" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>折前未记入签约额项目</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghzqwjrqyexm" size="20" maxlength="17"  value="<%=zqwjrqyexm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">折后未记入签约额项目</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqzhwjrqyexm" size="20" maxlength="17"  value="<%=zhwjrqyexm%>" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>折后未记入签约额项目</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghzhwjrqyexm" size="20" maxlength="17"  value="<%=zhwjrqyexm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">未记入签约额项目说明</font></td>
      <td bgcolor="#E8E8FF"><input type="text" name="xgqwjrqyexmsm" size="20" maxlength="100"  value="<%=wjrqyexmsm%>" readonly></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>未记入签约额项目说明</td>
      <td bgcolor="#FFFFCC"><input type="text" name="xghwjrqyexmsm" size="20" maxlength="100"  value="<%=wjrqyexmsm%>" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">设计费</font></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <input type="text" name="xgqsjf" value="<%=sjf%>" size="20" maxlength="17" readonly>      </td>
      <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>设计费</td>
      <td width="31%" bgcolor="#FFFFCC"> 
        <input type="text" name="xghsjf" value="<%=sjf%>" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">服务费</font></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <input type="text" name="xgqglf" value="<%=glf%>" size="20" maxlength="17" readonly>      </td>
      <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>服务费</td>
      <td width="31%" bgcolor="#FFFFCC"> 
        <input type="text" name="xghglf" value="<%=glf%>" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">录入部门</font></td>
      <td width="31%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>      </td>
      <td width="19%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="2"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.xgjlh)=="") {
		alert("请输入[修改记录号]！");
		FormName.xgjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.xghzkl)=="") {
		alert("请输入[修改后合同折扣率]！");
		FormName.xghzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.xghzkl, "修改后合同折扣率"))) {
		return false;
	}
	if (FormName.xghzkl.value<=0 || FormName.xghzkl.value>10)
	{
		alert("错误！[修改后合同折扣率]应该在0和10之间！");
		FormName.xghzkl.select();
		return false;
	}
	if(	javaTrim(FormName.xghzjxzkl)=="") {
		alert("请输入[修改后增减项折扣率]！");
		FormName.xghzjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.xghzjxzkl, "修改后增减项折扣率"))) {
		return false;
	}
	if (FormName.xghzjxzkl.value<0 || FormName.xghzjxzkl.value>10)
	{
		alert("错误！[修改后增减项折扣率]应该在0和10之间！");
		FormName.xghzjxzkl.select();
		return false;
	}

	if(	javaTrim(FormName.xghcdzwjmje)=="") {
		alert("请输入[修改后合同减免额]！");
		FormName.xghcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.xghcdzwjmje, "修改后合同减免额"))) {
		return false;
	}
	if (FormName.xghcdzwjmje.value<0 || FormName.xghcdzwjmje.value>100)
	{
		alert("错误！[修改后合同减免额]应该在0和100之间！");
		FormName.xghcdzwjmje.select();
		return false;
	}
	if(	javaTrim(FormName.xghglfjmje)=="") {
		alert("请输入[修改后管理费减免额]！");
		FormName.xghglfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.xghglfjmje, "修改后管理费减免额"))) {
		return false;
	}
	if (FormName.xghglfjmje.value<0 || FormName.xghglfjmje.value>100)
	{
		alert("错误！[修改后管理费减免额]应该在0和100之间！");
		FormName.xghglfjmje.select();
		return false;
	}
	if(	javaTrim(FormName.xghsjjmje)=="") {
		alert("请输入[修改后税金减免额]！");
		FormName.xghsjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.xghsjjmje, "修改后税金减免额"))) {
		return false;
	}
	if (FormName.xghsjjmje.value<0 || FormName.xghsjjmje.value>100)
	{
		alert("错误！[修改后税金减免额]应该在0和100之间！");
		FormName.xghsjjmje.select();
		return false;
	}

	if(	javaTrim(FormName.xghwdzgce)=="") {
		alert("请输入[修改后工程原报价]！");
		FormName.xghwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.xghwdzgce, "修改后工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.xghqye)=="") {
		alert("请输入[修改后签约额]！");
		FormName.xghqye.focus();
		return false;
	}
	if(!(isFloat(FormName.xghqye, "修改后签约额"))) {
		return false;
	}

	if (parseFloat(FormName.xghwdzgce.value)<parseFloat(FormName.xghqye.value))
	{
		alert("[工程原报价]不能小于[签约额]！");
		FormName.xghqye.select();
		return false;
	}

	if(	javaTrim(FormName.xghglfbfb)=="") {
		alert("请输入[管理费百分比]！");
		FormName.xghglfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.xghglfbfb, "管理费百分比"))) {
		return false;
	}
	if (FormName.xghglfbfb.value<0 || FormName.xghglfbfb.value>100)
	{
		alert("错误！[管理费百分比]应该在0和100之间！");
		FormName.xghglfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.xghzqguanlif)=="") {
		alert("请输入[折前管理费]！");
		FormName.xghzqguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.xghzqguanlif, "折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.xghguanlif)=="") {
		alert("请输入[折后管理费]！");
		FormName.xghguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.xghguanlif, "折后管理费"))) {
		return false;
	}

	if(	javaTrim(FormName.xghsuijinbfb)=="") {
		alert("请输入[修改后税金百分比]！");
		FormName.xghsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.xghsuijinbfb, "修改后税金百分比"))) {
		return false;
	}
	if (FormName.xghsuijinbfb.value<0 || FormName.xghsuijinbfb.value>100)
	{
		alert("错误！[修改后税金百分比]应该在0和100之间！");
		FormName.xghsuijinbfb.select();
		return false;
	}

	
	if(	javaTrim(FormName.xghsuijin)=="") {
		alert("请输入[修改后税金]！");
		FormName.xghsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.xghsuijin, "修改后税金"))) {
		return false;
	}
	if(	javaTrim(FormName.xghsjf)=="") {
		alert("请输入[修改后设计费]！");
		FormName.xghsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.xghsjf, "修改后设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.xghglf)=="") {
		alert("请输入[修改后服务费]！");
		FormName.xghglf.focus();
		return false;
	}
	if(!(isFloat(FormName.xghglf, "修改后服务费"))) {
		return false;
	}

	if(	javaTrim(FormName.xghzqwjrqyexm)=="") {
		alert("请输入[折前未记入签约额项目]！");
		FormName.xghzqwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.xghzqwjrqyexm, "折前未记入签约额项目"))) {
		return false;
	}
	if(	javaTrim(FormName.xghzhwjrqyexm)=="") {
		alert("请输入[折后未记入签约额项目]！");
		FormName.xghzhwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.xghzhwjrqyexm, "折后未记入签约额项目"))) {
		return false;
	}

	if (FormName.xghzqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.xghwjrqyexmsm)=="") {
			alert("请输入[未记入签约额项目说明]！");
			FormName.xghwjrqyexmsm.select();
			return false;
		}
	}

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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注]！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
