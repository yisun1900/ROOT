<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String dybjjb=(String)session.getAttribute("bjjb");
//**************************************************************************888
double zcf=0;//A级主材费
double rgf=0;//A级人工费
double jjf=0;//A级机械费
double glfbl=0;//A级管理费百分比
double lrbl=0;//A级利润百分比
String zcmc=null;//A级主材名称
String zcgg=null;//A级主材规格

String zcjldwbm=null;
double bzcf=0;//级主材费
double brgf=0;//级人工费
double bjjf=0;//级机械费
double bglfbl=0;//级管理费百分比
double blrbl=0;//级利润百分比
String bzcmc=null;//级主材名称
String bzcgg=null;//级主材规格

double czcf=0;//级主材费
double crgf=0;//级人工费
double cjjf=0;//级机械费
double cglfbl=0;//级管理费百分比
double clrbl=0;//级利润百分比
String czcmc=null;//级主材名称
String czcgg=null;//级主材规格

//*******************************************************************************88
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double cbenj=0;
double sgdbj=0;
double bj=0;
double bbj=0;
double cbj=0;
String gycl=null;
String bgycl=null;
String cgycl=null;
String xh=null;

double clf=0;
double bclf=0;
double cclf=0;

String wybh=cf.GB2Uni(request.getParameter("wybh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcjldwbm,dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,sgdbj,cbenj,bj,bbj,cbj,gycl,bgycl,cgycl,xh,clf,bclf,cclf,zcf,jjf,rgf,glfbl,lrbl,zcmc,zcgg,bzcf,bjjf,brgf,bglfbl,blrbl,bzcmc,bzcgg,czcf,cjjf,crgf,cglfbl,clrbl,czcmc,czcgg";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where  wybh='"+wybh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcjldwbm=cf.fillNull(rs.getString("zcjldwbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sgdbj=rs.getDouble("sgdbj");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		bbj=rs.getDouble("bbj");
		cbj=rs.getDouble("cbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		bgycl=cf.fillNull(rs.getString("bgycl"));
		cgycl=cf.fillNull(rs.getString("cgycl"));
		xh=cf.fillNull(rs.getString("xh"));
		clf=rs.getDouble("clf");
		bclf=rs.getDouble("bclf");
		cclf=rs.getDouble("cclf");


		zcf=rs.getDouble("zcf");
		jjf=rs.getDouble("jjf");
		rgf=rs.getDouble("rgf");
		glfbl=rs.getDouble("glfbl");
		lrbl=rs.getDouble("lrbl");
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcgg=cf.fillNull(rs.getString("zcgg"));

		bzcf=rs.getDouble("bzcf");
		bjjf=rs.getDouble("bjjf");
		brgf=rs.getDouble("brgf");
		bglfbl=rs.getDouble("bglfbl");
		blrbl=rs.getDouble("blrbl");
		bzcmc=cf.fillNull(rs.getString("bzcmc"));
		bzcgg=cf.fillNull(rs.getString("bzcgg"));

		czcf=rs.getDouble("czcf");
		cjjf=rs.getDouble("cjjf");
		crgf=rs.getDouble("crgf");
		cglfbl=rs.getDouble("cglfbl");
		clrbl=rs.getDouble("clrbl");
		czcmc=cf.fillNull(rs.getString("czcmc"));
		czcgg=cf.fillNull(rs.getString("czcgg"));


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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改公装报价表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_jzbjb1.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">项目大类</td>
              <td width="28%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>
              </td>
              <td width="22%" align="right">项目小类</td>
              <td width="28%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">项目编号</div>
              </td>
              <td width="28%"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" readonly>
				<input type="hidden" name="oldxmbh" value="<%=xmbh%>" >
              </td>
              <td width="22%"> 
                <div align="right">地区</div>
              </td>
              <td width="28%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="73" maxlength="100"  value="<%=xmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">饰面</div>
              </td>
              <td width="28%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>
              </td>
              <td width="22%"> 
                <div align="right">工程量计量单位</div>
              </td>
              <td width="28%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">排序序号</div>
              </td>
              <td width="28%"> 
                <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >
              </td>
        <td align="right">主材计量单位编码</td>
              <td> 
                <select name="zcjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwbm","");
%> 
                </select>
              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="22%">成本价</td>
              <td bgcolor="#E8E8FF" width="28%"> 
                <input type="text" name="cbenj" value="<%=cbenj%>" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF" width="23%">施工队报价</td>
              <td bgcolor="#E8E8FF" width="27%"> 
                <input type="text" name="sgdbj" value="<%=sgdbj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
			%> 
            <tr bgcolor="#CCCCFF"> 
              <td height="22" align="right" width="22%"> <%=dzbjzjmc%>报价</td>
              <td width="28%"> 
                <input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"></div>
              </td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>主材名称</td>
              <td width="28%"> 
                <input type="text" name="zcmc" value="<%=zcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%"><%=dzbjzjmc%>主材规格</td>
              <td width="27%"> 
                <input type="text" name="zcgg" value="<%=zcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>主材费</td>
              <td width="28%"> 
                <input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzjmc%>辅材费</div>
              </td>
              <td width="27%"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>人工费</td>
              <td width="28%" bgcolor="#CCCCFF"> 
                <input type="text" name="rgf" value="<%=rgf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzjmc%>机械费</div>
              </td>
              <td width="27%"> 
                <input type="text" name="jjf" value="<%=jjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>管理费百分比</td>
              <td width="28%"> 
                <input type="text" name="glfbl" value="<%=glfbl%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzjmc%>利润百分比</div>
              </td>
              <td width="27%"> 
                <input type="text" name="lrbl" value="<%=lrbl%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="22%" align="right"><%=dzbjzjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="70" rows="8"><%=gycl%></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
			%> 
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>报价</td>
              <td width="28%"> 
                <input type="text" name="bbj" value="<%=bbj%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%">&nbsp;</td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>主材名称</td>
              <td width="28%"> 
                <input type="text" name="bzcmc" value="<%=bzcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%"><%=dzbjzgjmc%>主材规格</td>
              <td width="27%"> 
                <input type="text" name="bzcgg" value="<%=bzcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>主材费</td>
              <td width="28%"> 
                <input type="text" name="bzcf" value="<%=bzcf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzgjmc%>辅材费</div>
              </td>
              <td width="27%"> 
                <input type="text" name="bclf" value="<%=bclf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>人工费</td>
              <td width="28%"> 
                <input type="text" name="brgf" value="<%=brgf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzgjmc%>机械费</div>
              </td>
              <td width="27%"> 
                <input type="text" name="bjjf" value="<%=bjjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>管理费百分比</td>
              <td width="28%" bgcolor="#FF99CC"> 
                <input type="text" name="bglfbl" value="<%=bglfbl%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzgjmc%>利润百分比</div>
              </td>
              <td width="27%"> 
                <input type="text" name="blrbl" value="<%=blrbl%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td width="22%" align="right"><%=dzbjzgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="bgycl" cols="70" rows="8"><%=bgycl%></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
	{
			%> 
           <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>报价</td>
              <td width="28%"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%">&nbsp;</td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>主材名称</td>
              <td width="28%"> 
                <input type="text" name="czcmc" value="<%=czcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%"><%=dzbjgjmc%>主材规格</td>
              <td width="27%"> 
                <input type="text" name="czcgg" value="<%=czcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>主材费</td>
              <td width="28%"> 
                <input type="text" name="czcf" value="<%=czcf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjgjmc%>辅材费</div>
              </td>
              <td width="27%"> 
                <input type="text" name="cclf" value="<%=cclf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>人工费</td>
              <td width="28%"> 
                <input type="text" name="crgf" value="<%=crgf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjgjmc%>机械费</div>
              </td>
              <td width="27%"> 
                <input type="text" name="cjjf" value="<%=cjjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>管理费百分比</td>
              <td width="28%" bgcolor="#CCFFCC"> 
                <input type="text" name="cglfbl" value="<%=cglfbl%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjgjmc%>利润百分比</div>
              </td>
              <td width="27%"> 
                <input type="text" name="clrbl" value="<%=clrbl%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="22%" align="right"><%=dzbjgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="cgycl" cols="70" rows="8"><%=cgycl%></textarea>
              </td>
            </tr>
            <%
	}
%> 
            <input type="hidden" name="wybh"  value="<%=wybh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>
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
function f_do(FormName)//参数FormName:Form的名称
{
	
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
<%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
		%>
		if(	javaTrim(FormName.bj)=="") {
			alert("请输入[<%=dzbjzjmc%>报价]！");
			FormName.bj.focus();
			return false;
		}
		if(!(isFloat(FormName.bj, "<%=dzbjzjmc%>报价"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D"))
	{
		%>
		if(	javaTrim(FormName.bbj)=="") {
			alert("请输入[<%=dzbjzgjmc%>报价]！");
			FormName.bbj.focus();
			return false;
		}
		if(!(isFloat(FormName.bbj, "<%=dzbjzgjmc%>报价"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") )
	{
		%>
		if(	javaTrim(FormName.cbj)=="") {
			alert("请输入[<%=dzbjgjmc%>报价]！");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "<%=dzbjgjmc%>报价"))) {
			return false;
		}
		<%
	}
%>
	if(!(isInt(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
