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
String cgsjs=null;
String fgsbh=null;
String pdgc=null;
String ppmc=null;
String gys=null;
String dqbm=null;
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String listSql="";

try {
	conn=cf.getConnection();

	ls_sql="select crm_khxx.fgsbh,jc_cgdd.pdgc,jc_cgdd.ppmc,jc_cgdd.gys,ddbh,jc_cgdd.khbh,dj,clgw,ztjjgw,jc_cgdd.xmzy,jhccsj,jhfcsj,jc_cgdd.bz,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,jc_cgdd.lrsj,clzt,cgsjs ";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and jc_cgdd.ddbh='"+whereddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gys=cf.fillNull(rs.getString("gys"));
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
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">订单编号</font></td>
              <td width="32%"> 
              <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly></td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">客户编号</td>
              <td width="32%"><%=khbh%></td>
              <td width="17%" align="right">合同号</td>
              <td width="33%"><%=hth%></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">客户姓名</td>
              <td><%=khxm%></td>
              <td align="right">房屋地址</td>
              <td><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">派单工厂</td>
              <td width="32%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gyslb='2' order by sq_gysxx.gysmc";
	cf.selectItem(out,listSql,pdgc);

%> 
              </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">品牌</td>
              <td width="32%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql="select distinct sq_gysxx.ppmc c1,sq_gysxx.ppmc c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gyslb='2' order by sq_gysxx.ppmc";
	cf.selectItem(out,listSql,ppmc);
%> 
              </select>              </td>
              <td width="17%" align="right">供应商</td>
              <td width="33%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql="select distinct sq_gysxx.gys c1,sq_gysxx.gys c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gyslb='2' order by sq_gysxx.gys";
	cf.selectItem(out,listSql,gys);
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">项目专员</td>
              <td width="32%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='10'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='10'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,xmzy);
%> 
              </select>              </td>
              <td width="17%" align="right">订金</td>
              <td width="33%"> 
              <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">驻店家居顾问</td>
              <td width="32%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='08'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='08'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,clgw);
%> 
              </select>              </td>
              <td width="17%" align="right">展厅家居顾问</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='08'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='08'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,ztjjgw);
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">计划初测时间</td>
              <td width="32%"> 
              <input type="text" name="jhccsj" size="20" maxlength="10"  value="<%=jhccsj%>" onDblClick="JSCalendar(this)"></td>
              <td width="17%" align="right">计划复测时间</td>
              <td width="33%"> 
              <input type="text" name="jhfcsj" value="<%=jhfcsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">录入时间</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>              </td>
              <td width="17%" align="right">家居设计师</td>
              <td width="33%"> 
                <select name="cgsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='12'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='12'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,cgsjs);
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
					<input type="hidden" name="whereddbh"  value="<%=whereddbh%>" >
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(!(isFloat(FormName.dj, "订金"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhfcsj, "计划复测时间"))) {
		return false;
	}

	FormName.action="SaveTqEditJc_cgdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
