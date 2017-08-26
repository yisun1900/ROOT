<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String sqsj=null;
String sqr=null;
String wcbz=null;
String wcsj=null;
String wcr=null;
String yjjzsj=null;
String gxqwdzgce=null;
String gxqzkl=null;
String gxqqye=null;
String gxqsuijin=null;
String gxqsuijinbfb=null;
String gxqsjf=null;
String gxqglf=null;
String gxqguanlif=null;

double gxhwdzgce=0;
double gxhzkl=0;
double gxhqye=0;
double gxhsuijin=0;
double gxhsuijinbfb=0;
double gxhsjf=0;
double gxhglf=0;
double gxhguanlif=0;

String bz=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String zt=null;
String gcjdbm=null;
String fgsbh=null;
String dwbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sqsj,fgsbh,sqr,wcbz,wcsj,wcr,yjjzsj,gxqwdzgce,gxqzkl,gxqqye,gxqsuijin,gxqsuijinbfb,gxqsjf,gxqglf,gxqguanlif,gxhwdzgce,gxhzkl,gxhqye,gxhsuijin,gxhsuijinbfb,gxhsjf,gxhglf,gxhguanlif,bz ";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where khbh='"+khbh+"' and  wcbz='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqr=cf.fillNull(rs.getString("sqr"));
		wcbz=cf.fillNull(rs.getString("wcbz"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		wcr=cf.fillNull(rs.getString("wcr"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		gxqwdzgce=cf.fillNull(rs.getString("gxqwdzgce"));
		gxqzkl=cf.fillNull(rs.getString("gxqzkl"));
		gxqqye=cf.fillNull(rs.getString("gxqqye"));
		gxqsuijin=cf.fillNull(rs.getString("gxqsuijin"));
		gxqsuijinbfb=cf.fillNull(rs.getString("gxqsuijinbfb"));
		gxqsjf=cf.fillNull(rs.getString("gxqsjf"));
		gxqglf=cf.fillNull(rs.getString("gxqglf"));
		gxqguanlif=cf.fillNull(rs.getString("gxqguanlif"));

/*
		gxhwdzgce=rs.getDouble("gxhwdzgce");
		gxhzkl=rs.getDouble("gxhzkl");
		gxhqye=rs.getDouble("gxhqye");
		gxhsuijin=rs.getDouble("gxhsuijin");
		gxhsuijinbfb=rs.getDouble("gxhsuijinbfb");
		gxhsjf=rs.getDouble("gxhsjf");
		gxhglf=rs.getDouble("gxhglf");
		gxhguanlif=rs.getDouble("gxhguanlif");
*/

		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,zjxm,kgrq,jgrq,sjkgrq,sjjgrq,zt,gcjdbm,fgsbh,dwbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	rs.close();
	ps.close();

	String jzbz=null;
	String bjjb=null;
	String zklx="";
	double spzkl=0;
	ls_sql="select jzbz,bjjb,zklx,spzkl";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jzbz=rs.getString("jzbz");
		bjjb=rs.getString("bjjb");
		zklx=cf.fillNull(rs.getString("zklx"));
		spzkl=rs.getDouble("spzkl");
	}
	else{
		out.println("错误！咨询客户信息不存在："+khbh);
		return;
	}
	rs.close();
	ps.close();

	if (bjjb==null)
	{
		out.println("<P>错误！咨询客户报价级别不存在");
		return;
	}

	if (spzkl==0)//批准折扣率
	{
		spzkl=10;
	}

	gxhzkl=spzkl;
////////////////
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	qye=dzbj.getBjje(conn,khbh,"yzf");

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
<form method="post" action="SaveEditCw_czbjsqjl.jsp" name="editform" target="_blank">
  <div align="center">重做报价－完成</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">客户编号</font></div>
      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">合同号</font></div>
      </td>
      <td width="31%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">客户姓名</font></div>
      </td>
      <td width="31%"> <%=khxm%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">签约店面</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">设计师</font></div>
      </td>
      <td width="31%"> <%=sjs%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">质检员</font></div>
      </td>
      <td width="31%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">施工队</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">施工班组</font></div>
      </td>
      <td width="31%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">授权人</td>
      <td width="31%"><%=sqr%> </td>
      <td align="right" width="19%">授权时间</td>
      <td width="31%"><%=sqsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>完成人</td>
      <td width="31%"> 
        <input type="text" name="wcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>完成时间</td>
      <td width="31%"> 
        <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前合同原报价</font></td>
      <td width="31%"> 
        <input type="text" name="gxqwdzgce" size="20" maxlength="17"  value="<%=gxqwdzgce%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">更新后合同原报价</font></td>
      <td width="31%"> 
        <input type="text" name="gxhwdzgce" size="20" maxlength="17"  value="<%=gxhwdzgce%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前折扣率</font></td>
      <td width="31%"> 
        <input type="text" name="gxqzkl" size="10" maxlength="9"  value="<%=gxqzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b> </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">更新后折扣率</font></td>
      <td width="31%"> 
        <input type="text" name="gxhzkl" size="10" maxlength="9"  value="<%=gxhzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前签约额</font></td>
      <td width="31%"> 
        <input type="text" name="gxqqye" size="20" maxlength="17"  value="<%=gxqqye%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">更新后签约额</font></td>
      <td width="31%"> 
        <input type="text" name="gxhqye" size="20" maxlength="17"  value="<%=gxhqye%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前税金百分比</font></td>
      <td width="31%"> 
        <input type="text" name="gxqsuijinbfb" size="10" maxlength="9"  value="<%=gxqsuijinbfb%>" readonly>
        % </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">更新后税金百分比</font></td>
      <td width="31%"> 
        <input type="text" name="gxhsuijinbfb" size="10" maxlength="9"  value="<%=gxhsuijinbfb%>" readonly>
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前税金</font></td>
      <td width="31%"> 
        <input type="text" name="gxqsuijin" size="20" maxlength="17"  value="<%=gxqsuijin%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">更新后税金</font></td>
      <td width="31%"> 
        <input type="text" name="gxhsuijin" size="20" maxlength="17"  value="<%=gxhsuijin%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前设计费</font></td>
      <td width="31%"> 
        <input type="text" name="gxqsjf" size="20" maxlength="17"  value="<%=gxqsjf%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>更新后设计费</td>
      <td width="31%"> 
        <input type="text" name="gxhsjf" size="20" maxlength="17"  value="<%=gxhsjf%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前服务费</font></td>
      <td width="31%"> 
        <input type="text" name="gxqglf" size="20" maxlength="17"  value="<%=gxqglf%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>更新后服务费</td>
      <td width="31%"> 
        <input type="text" name="gxhglf" size="20" maxlength="17"  value="<%=gxhglf%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">更新前管理费</font></td>
      <td width="31%"> 
        <input type="text" name="gxqguanlif" size="20" maxlength="17"  value="<%=gxqguanlif%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>更新后管理费</td>
      <td width="31%"> 
        <input type="text" name="gxhguanlif" size="20" maxlength="17"  value="<%=gxhguanlif%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="sqsj"  value="<%=sqsj%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
      </td>
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
	if(	javaTrim(FormName.wcr)=="") {
		alert("请输入[完成人]！");
		FormName.wcr.focus();
		return false;
	}
	if(	javaTrim(FormName.wcsj)=="") {
		alert("请输入[完成时间]！");
		FormName.wcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "完成时间"))) {
		return false;
	}


	if(	javaTrim(FormName.gxhwdzgce)=="") {
		alert("请输入[更新后合同原报价]！");
		FormName.gxhwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhwdzgce, "更新后合同原报价"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhzkl)=="") {
		alert("请输入[更新后折扣率]！");
		FormName.gxhzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzkl, "更新后折扣率"))) {
		return false;
	}
	if (FormName.gxhzkl.value<0 || FormName.gxhzkl.value>10)
	{
		alert("错误！[更新后折扣率]应该在0和10之间！");
		FormName.gxhzkl.select();
		return false;
	}


	if(	javaTrim(FormName.gxhqye)=="") {
		alert("请输入[更新后签约额]！");
		FormName.gxhqye.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhqye, "更新后签约额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsuijin)=="") {
		alert("请输入[更新后税金]！");
		FormName.gxhsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijin, "更新后税金"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhsuijinbfb)=="") {
		alert("请输入[更新后税金百分比]！");
		FormName.gxhsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijinbfb, "更新后税金百分比"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhsjf)=="") {
		alert("请输入[更新后设计费]！");
		FormName.gxhsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjf, "更新后设计费"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhglf)=="") {
		alert("请输入[更新后服务费]！");
		FormName.gxhglf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglf, "更新后服务费"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhguanlif)=="") {
		alert("请输入[更新后管理费]！");
		FormName.gxhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhguanlif, "更新后管理费"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
