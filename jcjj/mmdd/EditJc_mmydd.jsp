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
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String clzt=null;

String fkje=null;
String ssfgs=null;
String listSql="";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,wjqk,sqdj,clgw,ztjjgw,lrr,lrsj,dwbh,bz,clzt,jhccsj,xmzy ";
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
	}
	rs.close();

	ls_sql="select fgsbh,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,crm_khxx.dwbh,dwmc,cxhdbm";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();

	//活动订金
	double lsd=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51'";//11：家装款；21:木门；22:橱柜；23:主材；24：家具；31:木门订金；32:橱柜订金；33:主材订金；34：家具订金； 41：集成订金；51：促销活动订金；61：预付款
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		lsd=rs.getDouble(1);
	}
	rs.close();

	if (lsd>0)
	{
		fkje=lsd+"（活动订金）";
	}
	else{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='31'";
		rs =stmt.executeQuery(ls_sql);
		if (rs.next())
		{
			lsd=rs.getDouble(1);
		}
		rs.close();
		if (lsd>0)
		{
			fkje=lsd+"（木门订金）";
		}
	}
	if (lsd==0)
	{
		fkje="未付订金";
	}
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="20%" bgcolor="#CCCCFF" align="right">客户编号</td>
              <td width="30%" bgcolor="#CCCCFF"><%=khbh%></td>
              <td width="20%" bgcolor="#CCCCFF" align="right">合同号</td>
              <td width="30%" bgcolor="#CCCCFF"><%=hth%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">客户姓名</td>
              <td width="30%"><%=khxm%>（<%=lxfs%>）</td>
              <td width="20%" align="right">工程签约额</td>
              <td width="30%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="20%" bgcolor="#CCCCFF" align="right">装修设计师</td>
              <td width="30%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">应开工日期</td>
              <td width="30%"><%=kgrq%></td>
              <td width="20%" align="right">应竣工日期</td>
              <td width="30%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="20%" align="right">参加促销活动</td>
              <td width="30%"> <%=cxhdbm%> </td>
              <td width="20%" align="right">订金</td>
              <td width="30%"><%=fkje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">五金情况</div>
              </td>
              <td width="30%"> <%
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
              <td width="20%" align="right">驻店家居顾问</td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,clgw);
%> 
                </select>
              </td>
              <td width="20%" align="right">展厅家居顾问</td>
              <td width="30%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,ztjjgw);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">项目专员</td>
              <td width="30%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value='<%=xmzy%>'><%=xmzy%></option>
                </select>
              </td>
              <td width="20%" align="right">计划初测时间</td>
              <td width="30%"> 
                <input type="text" name="jhccsj" value="<%=jhccsj%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入人</div>
              </td>
              <td width="30%"> 
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
              <td width="20%" align="right">录入部门</td>
              <td width="30%"> 
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
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input type="button" value="打印预订单" onClick="window.open('/jcjj/dygl/dyydd.jsp?lx=mm&ddbh=<%=yddbh%>&khbh=<%=khbh%>')" name="dy">
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
	if(	javaTrim(FormName.ztjjgw)=="") {
		alert("请输入[展厅家居顾问]！");
		FormName.ztjjgw.focus();
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

	FormName.action="SaveEditJc_mmydd.jsp";
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
