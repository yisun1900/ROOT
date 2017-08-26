<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String wjqk=null;
String sqdj=null;

String clgw=null;
String ztjjgw=null;
String lrr=null;
String lrsj=null;
String jhccsj=null;
String dwbh=null;
String cxhdbm=null;
String xmzy=null;
String bz=null;
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String clzt=null;


String fkje=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,wjqk,sqdj,clgw,ztjjgw,lrr,lrsj,dwbh,bz,clzt,jhccsj,xmzy,khxm,fwdz,lxfs,hth ";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		wjqk=cf.fillNull(rs.getString("wjqk"));
		sqdj=cf.fillNull(rs.getString("sqdj"));

		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
	}
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
      <div align="center">请修改木门预订单（预订单编号：<%=yddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
              <td width="19%"> 
                <div align="right">五金情况</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "wjqk","1+客户自购&2+公司购买",wjqk);
%> </td>
              <td width="20%"> 
                <div align="right">木门订金</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sqdj" size="20" maxlength="9"  value="<%=sqdj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc",clgw);
%> 
                </select>
              </td>
              <td width="20%" align="right">展厅家居顾问</td>
              <td width="30%">
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc",ztjjgw);
%> 
                </select>
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
              <td width="20%" align="right">计划初测时间</td>
              <td width="30%"> 
                <input type="text" name="jhccsj" value="<%=jhccsj%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td width="20%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="30%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入部门</td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
                </select>
              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input type="button"  value="完成预订单" onClick="f_end(editform)" name="wc" <% if (!clzt.equals("00")) out.println("disabled");%>>
                  </p>
                  <p> 
                    <input type="button"  value="录入木门明细" onClick="f_lrmm(editform)" name="lrmm" >
                    <input type="button"  value="查看木门明细" onClick="f_ckmm(editform)" name="ckmm" >
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
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
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
/*
	if(	!radioChecked(FormName.wjqk)) {
		alert("请选择[五金情况]！");
		FormName.wjqk[0].focus();
		return false;
	}
*/
	if(!(isFloat(FormName.sqdj, "收取定金"))) 
	{
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}

	FormName.action="SaveEditJc_mmydd1.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}

	FormName.action="EndJc_mmydd.jsp";
	FormName.submit();
	return true;
}

function f_lrmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}

	FormName.action="InsertJc_mmydmx.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}

	FormName.action="Jc_mmydmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
