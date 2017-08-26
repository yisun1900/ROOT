<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

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
double wdzgce=0;
double zkl=0;
double qye=0;
String cxhdbm=null;
String fgsbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String kkjlh=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,cxhdbm,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,zkl,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");

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
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(kkjlh,6,4)),0)";
	ls_sql+=" from  cw_kqtkjl";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	kkjlh=sgd+cf.addZero(count+1,4);
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>施工队扣款记录（扣款记录号：<%=kkjlh%>）</strong></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="9%">扣款记录号</td>
		<td  width="7%">施工队</td>
		<td  width="12%">扣款项目</td>
		<td  width="10%">扣款金额</td>
		<td  width="7%">录入人</td>
		<td  width="10%">录入时间</td>
		<td  width="6%">结算</td>
		<td  width="39%">备注</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT cw_kqtkjl.kkjlh,sq_sgd.sgdmc,qtkkmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj, DECODE(cw_kqtkjl.jsbz,'N','未结算','Y','已结算'),cw_kqtkjl.bz  ";
	ls_sql+=" FROM cw_kqtkjl,sq_sgd,dm_qtkkbm  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd";
    ls_sql+=" and cw_kqtkjl.qtkkbm=dm_qtkkbm.qtkkbm(+)";
    ls_sql+=" and cw_kqtkjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_kqtkjl.kkjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<form method="post" action="SaveInsertCw_kqtkjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">客户编号</td>
              <td width="33%"><%=khbh%></td>
              <td align="right" width="17%">合同号</td>
              <td width="33%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"><%=khxm%> </td>
              <td width="17%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="33%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="17%"> 
                <div align="right">设计师</div>
              </td>
              <td width="33%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">签约日期</td>
              <td width="33%"><%=qyrq%></td>
              <td align="right" width="17%">实际完结日期</td>
              <td width="33%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">合同开工日期</td>
              <td width="33%"><%=kgrq%></td>
              <td align="right" width="17%">合同竣工日期</td>
              <td width="33%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">实际开工日期</td>
              <td width="33%"><%=sjkgrq%></td>
              <td align="right" width="17%">实际竣工日期</td>
              <td width="33%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">参加促销活动</td>
              <td width="33%"><%=cxhdbm%></td>
              <td width="17%" align="right">工程签约额</td>
              <td width="33%"><%=qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>施工队</td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd);
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#CC0000">*</font>扣款项目</td>
              <td width="33%"> 
                <select name="qtkkbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qtkkbm,qtkkmc from dm_qtkkbm order by qtkkbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>扣款金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kkje" value="" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>录入时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>录入部门</div>
              </td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="kkjlh" value="<%=kkjlh%>" >
                <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.qtkkbm)=="") {
		alert("请选择[扣款项目]！");
		FormName.qtkkbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kkje)=="") {
		alert("请输入[扣款金额]！");
		FormName.kkje.focus();
		return false;
	}
	if(!(isFloat(FormName.kkje, "扣款金额"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请选择[备注]！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
