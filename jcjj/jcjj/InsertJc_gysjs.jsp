<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");
String ssfgs=request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double hkze=0;
double jsje=0;
String gys=null;
String ppbm=null;
try {
	conn=cf.getConnection();

	int ddgyssl=0;
	ls_sql =" select count(distinct gys)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddgyssl>1)
	{
		out.println("错误！不是同一供应商订单");
		return;
	}

	int ddppsl=0;
	ls_sql =" select count(distinct ppbm)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddppsl>1)
	{
		out.println("错误！不是同一品牌");
		return;
	}


	int isShMark=0;
	String jcddbh=null;
	String jcppbm=null;
	ls_sql =" select ddbh,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jcddbh=rs.getString("ddbh");
		jcppbm=rs.getString("ppbm");

		String getdsksjbz=null;
		String getfkxh=null;
		String getkhbh=null;
		String fkkhxm=null;
		String fkfwdz=null;
		String getdwmc=null;
		ls_sql =" select fkxh,dsksjbz,khbh,fkkhxm,fkfwdz,dwmc";
		ls_sql+=" from cw_khfkjl,sq_dwxx";
		ls_sql+=" where cw_khfkjl.ddbh='"+jcddbh+"' and scbz='N' and skdd='2'";//1：不需审核；2：需审核
		ls_sql+=" and cw_khfkjl.dsksjbz!='Y'";//N: 未审核；Y: 审核通过；M:审核未通过
		ls_sql+=" and cw_khfkjl.dwbh=sq_dwxx.dwbh(+)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getfkxh=rs1.getString("fkxh");
			getdsksjbz=rs1.getString("dsksjbz");
			getkhbh=rs1.getString("khbh");
			fkkhxm=rs1.getString("fkkhxm");
			fkfwdz=rs1.getString("fkfwdz");
			getdwmc=rs1.getString("dwmc");

			isShMark++;

			out.println("<BR>订单【"+jcddbh+"】错误！收款序号【"+getfkxh+"】未审核:【客户编号:"+getkhbh+"】【姓名:"+fkkhxm+"】【地址:"+fkfwdz+"】【店面:"+getdwmc+"】");
		}
		rs1.close();
		ps1.close();
	
	
	}
	rs.close();
	ps.close();


	ls_sql =" select distinct gys,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gys=rs1.getString(1);
		ppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();



	
	ls_sql="update jc_zcdd set cbze=round(zcpclf*fdbl/100+tjpclf*tjpfdbl/100,2)";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql =" select sum(cbze),sum(round(ycf*ycfjsbl/100,2)),sum(round(qtf*azfjsbl/100,2)),sum(wdzje)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj=rs1.getDouble(1);
		ycfzj=rs1.getDouble(2);
		qtfzj=rs1.getDouble(3);
		hkze=rs1.getDouble(4);
	}
	rs1.close();
	ps1.close();


	jsje=cbzj+ycfzj+qtfzj;
	jsje=cf.round(jsje,2);




%>


<CENTER >
  <B><font size="3">松下亿达集成家居主材商户结算单</font></B>
</CENTER>

<form method="post" action="" name="editform" >
<div align="center">厂商结算（供应商：<%=gys%>、品牌：<%=ppbm%>）</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">所属公司</font></td>
      <td bgcolor="#FFFFFF"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select></td>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    
    <tr bgcolor="#CCCCFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font><font color="#0000CC">结算人</font> </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font>结算时间 </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">材料成本</font></td>
      <td><input type="text" name="cbzj" value="<%=cbzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">远程费</font></td>
      <td><input type="text" name="ycfzj" value="<%=ycfzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">其它费</font></td>
      <td><input type="text" name="qtfzj" value="<%=qtfzj%>" size="20" maxlength="20" readonly/></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>扣除费用</td>
      <td><input type="text" name="kcfy" value="0" size="20" maxlength="20" onChange="f_jsjg(editform)"/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">结算金额</font></td>
      <td><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="20" readonly/></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">结算说明</td>
      <td colspan="3"><textarea name="jssm" cols="71" rows="3"></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center">
<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
          <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
		<%
	}
%>
			<input type="hidden" name="gys"  value="<%=gys%>" >          
			<input type="hidden" name="ppbm"  value="<%=ppbm%>" >          
			<input type="button"  value="结算" onClick="f_do(editform)"  <%if (isShMark>0) out.println("disabled");%>>
			<input type="reset"  value="重输" name="reset"></td>
    </tr>
  </table>
</form>

<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center" height="23">
	<td  width="4%">订单编号</td>
	<td  width="4%">姓名</td>
	<td  width="4%">级别</td>
	<td  width="6%">店面</td>
	<td  width="4%">材料员</td>
	<td  width="4%">订单类型</td>
	<td  width="6%">购买日期</td>
	<td  width="6%">产品品牌</td>
	<td  width="5%">销售合同号</td>
	<td  width="5%">正常品材料费</td>
	<td  width="5%">特价品材料费</td>
	<td  width="5%">安装费</td>
	<td  width="5%">远程费</td>
	<td  width="5%">实际交款</td>
	<td  width="4%">正常品结算比例</td>
	<td  width="4%">特价品结算比例</td>
	<td  width="4%">安装费结算比例</td>
	<td  width="4%">远程费结算比例</td>
	<td  width="5%">结算金额</td>
	<td  width="6%">产品大类</td>
	<td  width="223%">备注</td>
</tr>
  <%

	String bjjbmc=null;
	String getkhxm=null;
	String zcdlbm=null;
	String getddbh=null;
	String getzcxlbm=null;
	String getppbm=null;
	String getxshth=null;
	String getddlx=null;
	double getwdzje=0;
	double gethkze=0;
	double getzqclf=0;
	double getzcpclf=0;
	double gettjpclf=0;

	double getfdbl=0;
	double gettjpfdbl=0;
	double getazfjsbl=0;
	double getycfjsbl=0;
	double getfdje=0;

	double getfkje=0;
	double getqtf=0;
	double getycf=0;
	String getqhtsj=null;
	String getbz=null;
	String getdwmc=null;
	String getclgw=null;

	double allwdzje=0;
	double allhkze=0;
	double allzqclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allfdje=0;
	double allqtf=0;
	double allycf=0;
	double allfkje=0;

	ls_sql="SELECT bjjbmc,crm_khxx.khxm,dwmc,jc_zcdd.clgw,jc_zcdd.ddbh,zcxlbm,ppbm,jc_zcdd.xshth,jc_zcdd.wdzje,jc_zcdd.qhtsj ";
	ls_sql+=" ,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.fdbl,jc_zcdd.tjpfdbl,round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2)+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2) fdje,jc_zcdd.bz,jc_zcdd.qtf,jc_zcdd.ycf,decode(jc_zcdd.ddlx,'9','集成','E','散客')ddlx,jc_zcdd.zcdlbm";
	ls_sql+=" ,jc_zcdd.azfjsbl,jc_zcdd.ycfjsbl";
	ls_sql+=" FROM jc_zcdd,crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddlx in('9','E')";//9：集成家居主材;E;散客
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)"; 
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
	ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		getdwmc=cf.fillNull(rs.getString("dwmc"));
		getclgw=cf.fillHtml(rs.getString("clgw"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getddbh=cf.fillNull(rs.getString("ddbh"));
		getzcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		getppbm=cf.fillNull(rs.getString("ppbm"));
		zcdlbm=cf.fillHtml(rs.getString("zcdlbm"));

		getxshth=cf.fillNull(rs.getString("xshth"));
		getwdzje=rs.getDouble("wdzje");
		gethkze=rs.getDouble("hkze");
		getzqclf=rs.getDouble("zqclf");
		getzcpclf=rs.getDouble("zcpclf");
		gettjpclf=rs.getDouble("tjpclf");
		getfdbl=rs.getDouble("fdbl");
		gettjpfdbl=rs.getDouble("tjpfdbl");
		getfdje=rs.getDouble("fdje");
		getddlx=cf.fillNull(rs.getString("ddlx"));
		getazfjsbl=rs.getDouble("azfjsbl");
		getycfjsbl=rs.getDouble("ycfjsbl");

		getqhtsj=cf.fillNull(rs.getDate("qhtsj"));
		getbz=cf.fillHtml(rs.getString("bz"));
		getqtf=rs.getDouble("qtf");
		getycf=rs.getDouble("ycf");

		allwdzje+=getwdzje;
		allwdzje=cf.round(allwdzje,2);
		allhkze+=gethkze;
		allhkze=cf.round(allhkze,2);
		allfdje+=getfdje;
		allfdje=cf.round(allfdje,2);
		allzqclf+=getzqclf;
		allzqclf=cf.round(allzqclf,2);

		allzcpclf+=getzcpclf;
		allzcpclf=cf.round(allzcpclf,2);
		alltjpclf+=gettjpclf;
		alltjpclf=cf.round(alltjpclf,2);
		
		allqtf+=getqtf;
		allqtf=cf.round(allqtf,2);
		allycf+=getycf;
		allycf=cf.round(allycf,2);

		ls_sql=" select sum(fkje) ";
		ls_sql+=" from cw_khfkjl";
		ls_sql+=" where ddbh='"+getddbh+"' and fklxbm='23' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			getfkje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allfkje+=getfkje;
		allfkje=cf.round(allfkje,2);

		%>
		<tr bgcolor="#FFFFF"  align="center" height="23">
			<td><%=getddbh%></td>
			<td><%=getkhxm%></td>
			<td><%=bjjbmc%></td>
			<td><%=getdwmc%></td>
			<td><%=getclgw%></td>
			<td><%=getddlx%></td>
			<td><%=getqhtsj%></td>
			<td><%=getppbm%></td>
			<td><%=getxshth%></td>
			<td><%=getzcpclf%></td>
			<td><%=gettjpclf%></td>
			<td><%=getqtf%></td>
			<td><%=getycf%></td>
			<td><%=getfkje%></td>
			<td><%=getfdbl%>%</td>
			<td><%=gettjpfdbl%>%</td>
			<td><%=getazfjsbl%>%</td>
			<td><%=getycfjsbl%>%</td>
			<td><%=getfdje%></td>
			<td><%=zcdlbm%></td>
			<td><%=getbz%></td>
		</tr>
		<%

	 }
	 rs.close();
	 ps.close();
%> 
	<tr bgcolor="#FFFFF"  align="center" height="23">
		<td colspan="2">合 计</td>
		<td colspan="6">&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allzcpclf%></td>
		<td><%=alltjpclf%></td>
		<td><%=allqtf%></td>
		<td><%=allycf%></td>
		<td><%=allfkje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allfdje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

<%
	if ((int)(cbzj+ycfzj+qtfzj)!=(int)allfdje)
	{
		out.println("<B><font color=\"#FF0000\">错误！明细["+allfdje+"]与汇总金额["+(cbzj+ycfzj+qtfzj)+"]不一致</B></font>");
		return;
	}

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>


</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var jsje=<%=jsje%>-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;

}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("请选择[结算人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请选择[结算时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(	javaTrim(FormName.kcfy)=="") {
		alert("请选择[扣除费用]！");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "扣除费用"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请选择[结算金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算金额"))) {
		return false;
	}

	FormName.action="SaveInsertJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_dy(FormName)//参数FormName:Form的名称
{
	FormName.action="DyJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_szbz(FormName)//参数FormName:Form的名称
{
	FormName.action="chooseJs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
