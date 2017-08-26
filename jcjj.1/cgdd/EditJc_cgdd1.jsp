<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String khbh=null;
String dj=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jhccsj=null;
String jhfcsj=null;
String lrsj=null;
String bz=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String clzt=null;
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select ddbh,khbh,dj,clgw,ztjjgw,xmzy,jhccsj,jhfcsj,bz,khxm,fwdz,lxfs,hth,lrsj,clzt ";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		dj=cf.fillNull(rs.getString("dj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		clzt=cf.fillNull(rs.getString("clzt"));
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改橱柜订单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target='_blank'>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">合同号</td>
              <td width="35%"> 
                <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" >
              </td>
              <td width="15%" align="right">客户姓名</td>
              <td width="35%"> 
                <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">联系方式</td>
              <td colspan="3"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">项目专员</td>
              <td width="31%">
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc",xmzy);
%> 
                </select>
              </td>
              <td width="19%" align="right">订金</td>
              <td width="31%">
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2  from sq_yhxx where zwbm='08' order by yhmc",clgw);
%> 
                </select>
              </td>
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%">
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2  from sq_yhxx where zwbm='08' order by yhmc",ztjjgw);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">计划初测时间</div>
              </td>
              <td width="35%">
                <input type="text" name="jhccsj" size="20" maxlength="10"  value="<%=jhccsj%>" >
              </td>
              <td width="15%"> 
                <div align="right">计划复测时间</div>
              </td>
              <td width="35%">
                <input type="text" name="jhfcsj" value="<%=jhfcsj%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">录入时间</td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
              </td>
              <td width="15%" align="right">&nbsp;</td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereddbh"  value="<%=whereddbh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input type="button"  value="完成订单" onClick="f_end(editform)" name="wc" <% if (!clzt.equals("00")) out.println("disabled");%>>
                  </p>
                  <p> 
                    <input type="button"  value="录入橱柜明细" onClick="f_lrmm(editform)" name="lrmm" >
                    <input type="button"  value="查看橱柜明细" onClick="f_ckmm(editform)" name="ckmm" >
                  </p>
                  <p> 
                    <input type="button"  value="录入五金明细" onClick="f_lrwj(editform)" name="lrwj" >
                    <input type="button"  value="查看五金明细" onClick="f_ckwj(editform)" name="ckwj" >
                  </p>
                  <p> 
                    <input type="button"  value="录入电器明细" onClick="f_lrbl(editform)" name="lrbl" >
                    <input type="button"  value="查看电器明细" onClick="f_ckbl(editform)" name="ckbl" >
                  </p>
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[驻店家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("错误！没有[项目专员]！");
		FormName.xmzy.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[订金]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "订金"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhfcsj, "计划复测时间"))) {
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}

	FormName.action="SaveEditJc_cgdd1.jsp";
	FormName.submit();
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_cgdd.jsp";
	FormName.submit();
	return true;
}

function f_lrmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgyddmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgyddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgwjyddmx.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgwjyddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgdqyddmx.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgdqyddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
