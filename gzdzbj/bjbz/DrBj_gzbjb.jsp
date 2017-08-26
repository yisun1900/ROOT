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

String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
String bj=null;
String bbj=null;
String cbj=null;
String gycl=null;
String bgycl=null;
String cgycl=null;
String xh=null;


String wybh=cf.GB2Uni(request.getParameter("wybh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,bbj,cbj,gycl,bgycl,cgycl,xh ";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where  wybh='"+wybh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		bj=cf.fillNull(rs.getString("bj"));
		bbj=cf.fillNull(rs.getString("bbj"));
		cbj=cf.fillNull(rs.getString("cbj"));
		gycl=cf.fillNull(rs.getString("gycl"));
		bgycl=cf.fillNull(rs.getString("bgycl"));
		cgycl=cf.fillNull(rs.getString("cgycl"));
		xh=cf.fillNull(rs.getString("xh"));
	

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
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<html>
<head>
<title>从标准项目导入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 从标准项目导入 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveDrBj_jzbjb.jsp" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">项目大类</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>
              </td>
              <td width="19%" align="right" bgcolor="#FFFFFF">项目小类</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">项目编号</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" readonly>
				<input type="hidden" name="oldxmbh" value="<%=xmbh%>" >
              </td>
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">地区</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">项目名称</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="xmmc" size="72" maxlength="100"  value="<%=xmmc%>" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">饰面</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>
              </td>
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">工程量计量单位</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">排序序号</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >
              </td>
              <td width="19%" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="31%" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
			%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><%=dzbjzjmc%>报价</td>
              <td colspan="3" bgcolor="#CCCCFF"> 
                <input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><%=dzbjzjmc%>工艺材料简介</td>
              <td colspan="3" bgcolor="#CCCCFF"> 
                <textarea name="gycl" cols="71" rows="8"> <%=gycl%> </textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
			%> 
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right"><%=dzbjzgjmc%>报价</td>
              <td colspan="3"> 
                <input type="text" name="bbj" value="<%=bbj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right"><%=dzbjzgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="bgycl" cols="71" rows="8"><%=bgycl%></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
	{
			%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><%=dzbjgjmc%>报价</td>
              <td colspan="3"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><%=dzbjgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="cgycl" cols="71" rows="8"><%=cgycl%></textarea>
              </td>
            </tr>
            <%
	}
%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">录入人</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhdlm%>" readonly>
              </td>
              <td width="19%" align="right" bgcolor="#FFFFFF">录入时间</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">报价类型</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">自定义项目</option>
                </select>
              </td>
              <td width="19%" align="right" bgcolor="#FFFFFF">审核标志</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="shbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未审核</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
					<input type="hidden" name="oldwybh"  value="<%=wybh%>" >
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
			alert("请输入[普通报价]！");
			FormName.bj.focus();
			return false;
		}
		if(!(isFloat(FormName.bj, "普通报价"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
		%>
		if(	javaTrim(FormName.bbj)=="") {
			alert("请输入[精品报价]！");
			FormName.bbj.focus();
			return false;
		}
		if(!(isFloat(FormName.bbj, "精品报价"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
	{
		%>
		if(	javaTrim(FormName.cbj)=="") {
			alert("请输入[乐华梅兰单价]！");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "乐华梅兰单价"))) {
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
