<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String dj=null;
String clgw=null;
String ztjjgw=null;
String jhccsj=null;
String lrsj=null;
String bz=null;
String clzt=null;
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
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
String cxhdbm=null;
String xmzy=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh="";
String ssfgs=null;
String dqbm=null;
String pdgc=null;
String xcmgc=null;
String sfpsjs=null;

String fkje=null;

try {
	conn=cf.getConnection();

	ls_sql="select jc_jjdd.khbh,dj,clgw,ztjjgw,xmzy,jhccsj,jc_jjdd.bz,jc_jjdd.lrsj,clzt,pdgc,xcmgc,sfpsjs ";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		dj=cf.fillNull(rs.getString("dj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		xcmgc=cf.fillNull(rs.getString("xcmgc"));
		sfpsjs=cf.fillNull(rs.getString("sfpsjs"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where zwbm='05' and ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where zwbm='04' and dwbh='"+dmbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
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

<form method="post" action="" name="editform">
      <div align="center"> 请修改家具订单</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"> 客户编号 </td>
              <td bgcolor="#CCCCFF"><%=khbh%> </td>
              <td align="right" bgcolor="#CCCCFF"> 合同号 </td>
              <td bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">客户姓名</td>
              <td><%=khxm%></td>
              <td align="right">质检</td>
              <td><%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr>
              <td bgcolor="#CCCCFF" align="right">签约店面</td>
              <td bgcolor="#CCCCFF"><%=dwmc%></td>
              <td bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td bgcolor="#CCCCFF"><%=sjs%>（<%=sjsdh%>）</td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"> 施工队 </td>
              <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
                （<%=dzdh%>） </td>
              <td align="right"> 班长 </td>
              <td><%=sgbz%>（<%=bzdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"> 家装签约日期 </td>
              <td><%=qyrq%> </td>
              <td align="right"> 家装签约额 </td>
              <td><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">合同开工日期</td>
              <td><%=kgrq%></td>
              <td align="right">合同竣工日期</td>
              <td><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right">参加促销活动</td>
              <td colspan="3"><%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">项目专员</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	out.println("<option value=\""+xmzy+"\">"+xmzy+"</option>");
%> 
                </select>              </td>
              <td width="19%" align="right">订金</td>
              <td width="31%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc",clgw);
%> 
                </select>              </td>
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc",ztjjgw);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">计划初测时间</td>
              <td width="31%"> 
                <input type="text" name="jhccsj" value="<%=jhccsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">是否需派设计师</td>
              <td width="31%"><%
	cf.radioToken(out, "sfpsjs","1+是",sfpsjs);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">家具工厂</td>
              <td width="31%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,pdgc);
%> 
                </select>              </td>
              <td width="19%" align="right">型材门工厂</td>
              <td width="31%"> 
                <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,xcmgc);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
					<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input type="button" value="打印预订单" onClick="window.open('/jcjj/dygl/dyydd.jsp?lx=jj&ddbh=<%=ddbh%>&khbh=<%=khbh%>')" name="dy">              </td>
            </tr>
          </table>
</form>


</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
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

	if(!(isFloat(FormName.dj, "订金"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}

/*
	if(	!radioChecked(FormName.sfpsjs)) {
		alert("请选择[是否需派设计师]！");
		FormName.sfpsjs[0].focus();
		return false;
	}
	if (FormName.sfpsjs[1].checked)
	{
		if (FormName.pdgc.value=="" && FormName.xcmgc.value=="")
		{
			alert("请选择[家具工厂]或[型材门工厂]！");
			FormName.pdgc.focus();
			return false;
		}
	}
*/

	FormName.action="SaveEditJc_jjdd.jsp";
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

	FormName.action="EndJc_jjdd.jsp";
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

	FormName.action="InsertJc_jjyddmx.jsp";
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

	FormName.action="Jc_jjyddmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
