<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ddbh=null;
String khbh=null;
String clgw=null;
String ztjjgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String hkze=null;
String jhtzshsj=null;
String bz=null;
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
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

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;

String wdzje=null;
String htcxhdje=null;

int dds=0;
String jjsjs="";

String sfyyh="N";
String yhkssj="";
String yhjzsj="";
String yhnr="";

String zczkl="10";
String dzyy=null;
String jjwjbz="";

String djlrfs="";//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
String kgcxhdbl="";//主材订单是否可改促销活动比例  Y：可改；N：不可改

try {
	conn=cf.getConnection();

	ls_sql="select zczkl,dzyy,htcxhdje,wdzje,zcdlbm,zcxlbm,ppbm,ddbh,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,jhtzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zczkl=cf.fillNull(rs.getString("zczkl"));
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=cf.fillNull(rs.getString("hkze"));
		jhtzshsj=cf.fillNull(rs.getDate("jhtzshsj"));
	}
	rs.close();
	ps.close();

	if (jjsjs.equals(""))
	{
		ls_sql="select cgsjs";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("cgsjs"));
		}
		rs.close();
		ps.close();
	}

	if (jjsjs.equals(""))
	{
		ls_sql="select jjsjs";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("jjsjs"));
		}
		rs.close();
		ps.close();
	}


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
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
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}

	ls_sql="select sfyyh,yhkssj,yhjzsj,yhnr ";
	ls_sql+=" from  jxc_ppxx,jxc_ppsqfgs";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm ";
	ls_sql+=" and jxc_ppsqfgs.ssfgs='"+ssfgs+"' and jxc_ppxx.ppmc='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
	}
	rs.close();
	ps.close();



	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zcdd";
    ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dds=rs.getInt(1);
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
<%
if (dds>0)
{
	%>
	<table border="1" width="115%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">订单编号</td>
		<td  width="9%">处理状态</td>
		<td  width="8%">主材小类</td>
		<td  width="12%">子品牌</td>
		<td  width="6%">驻店家居顾问</td>
		<td  width="6%">展厅家居顾问</td>
		<td  width="6%">项目专员</td>
		<td  width="9%">货款总额</td>
		<td  width="9%">增减项金额</td>
		<td  width="8%">录入时间</td>
		<td  width="6%">录入人</td>
		<td  width="14%">备注</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,zcxlbm,ppbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.lrsj,jc_zcdd.lrr,''";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
	%>
	</table>
	<%
}
%>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入主材合同（订单编号：<%=ddbh%>）
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="30%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="20%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="30%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">客户姓名</td>
              <td width="30%"><%=khxm%></td>
              <td width="20%" align="right">质检</td>
              <td width="30%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="20%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="30%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"> 
                施工队              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="20%" align="right"> 
                班长              </td>
              <td width="30%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"> 
                家装签约日期              </td>
              <td width="30%"> <%=qyrq%> </td>
              <td width="20%" align="right"> 
                家装签约额              </td>
              <td width="30%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">合同开工日期</td>
              <td width="30%"><%=kgrq%></td>
              <td width="20%" align="right">合同竣工日期</td>
              <td width="30%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="20%" align="right">参加促销活动</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"><font color="#0000CC">合同总额</font></td>
              <td width="30%"> 
                <input type="text" name="hkze" value="0" size="20" maxlength="10" readonly>              </td>
              <td width="20%" align="right" bgcolor="#FFFFCC"><font color="#0000CC">未打折金额</font></td>
              <td width="30%"> 
                <input type="text" name="wdzje" value="0" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"><font color="#0000CC">计入促销活动金额</font></td>
              <td width="30%"> 
                <input type="text" name="htcxhdje" value="0" size="20" maxlength="10" readonly>              </td>
              <td width="20%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">主材大类</font></td>
              <td><input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>              </td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">主材小类</font></td>
              <td><input type="text" name="zcxlbm" value="<%=zcxlbm%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">子品牌</font></td>
              <td><input type="text" name="ppbm" value="<%=ppbm%>" readonly>              </td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">订单折扣</font></td>
              <td><input type="text" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                  <b><font color="#0000FF">（>0且<=10）</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">打折原因</td>
              <td colspan="3"><textarea name="dzyy" cols="71" rows="3"><%=dzyy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">品牌是否有优惠</font></td>
              <td><%
	cf.radioToken(out,"N+否&Y+是",sfyyh,true);
%></td>
              <td align="right"><font color="#0000FF">优惠期</font></td>
              <td>(<%=yhkssj%>)－－(<%=yhjzsj%>)</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">优惠内容</font></td>
              <td colspan="3"><%=yhnr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>项目专员</td>
              <td width="30%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="<%=xmzy%>"><%=xmzy%></option>
                </select>              </td>
              <td width="20%" align="right">家居设计师</td>
              <td width="30%"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(jjsjs,pdgc)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||':'||dh  from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N')",jjsjs);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>驻店家居顾问              </td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc",clgw);
%> 
                </select>              </td>
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>展厅家居顾问              </td>
              <td width="30%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc",ztjjgw);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>是否等待送货通知              </td>
              <td width="30%"> 
                <select name="ddshbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+不需等待通知&2+需等待通知",ddshbz);
%> 
                </select>              </td>
              <td width="20%" align="right"> 
                计划通知送货时间              </td>
              <td width="30%"> 
                <input type="text" name="jhtzshsj" value="<%=jhtzshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">合同送货时间</td>
              <td width="30%"> 
                <input type="text" name="htshsj" size="20" maxlength="10"  value="<%=htshsj%>" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>签合同时间</td>
              <td width="30%"> 
                <input type="text" name="qhtsj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
              <td width="30%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
                </select></td>
              <td width="20%" align="right">可减项截止时间</td>
              <td width="30%"><input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=kjxsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center">
					<input type="hidden" name="whereddbh"  value="<%=whereddbh%>" >
                    <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
                    <input type="hidden" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
                <input type="hidden" name="sfyyh" value="<%=sfyyh%>" >
                <input type="hidden" name="yhkssj" value="<%=yhkssj%>" >
                <input type="hidden" name="yhjzsj" value="<%=yhjzsj%>">
                <input type="hidden" name="yhnr" value="<%=yhnr%>">
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input type="button"  value="完成合同" onClick="f_wc(editform)" name="wc" disabled>
                    <input type="button"  value="打印合同" onClick="window.open('/jcjj/dygl/zcht1.jsp?ddbh=<%=ddbh%>')" name="dy" disabled>
                <BR>
                <BR>
                <input type="button"  value="录入－输入型号" onClick="f_srxh(editform)" name="srxh" disabled>
                <input type="button"  value="录入－查询型号" onClick="f_cxxh(editform)" name="cxxh" disabled>
                <input type="button"  value="录入手写项目" onClick="f_xzwc(editform)" name="xzwc" disabled>
                  <input type="button"  value="批量修改明细" onClick="f_plxg(editform)" name="plxg" disabled>
                  <input type="button"  value="单项修改明细" onClick="f_dpxg(editform)" name="dpxg" disabled>				</td>
            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	
/*	
	if(	!radioChecked(FormName.jkxz)) {
		alert("请选择[客户交款性质]！");
		FormName.jkxz[0].focus();
		return false;
	}

	if (FormName.jkxz[0].checked)
	{
		notRadio(FormName.jkdd);
	}
	else{
		if(	!radioChecked(FormName.jkdd)) {
			alert("请选择[交款地点]！");
			FormName.jkdd[0].focus();
			return false;
		}
	}
*/

	if(	javaTrim(FormName.hkze)=="") {
		alert("请选择[合同总额]！");
		FormName.hkze.focus();
		return false;
	}
	if(!(isFloat(FormName.hkze, "合同总额"))) {
		return false;
	}
/*
	if (parseFloat(FormName.hkze.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.hkze.select();
		return false;
	}
*/
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折合同额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折合同额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.hkze.value))
	{
		alert("[未打折合同额]不能小于[合同总额]！");
		FormName.hkze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请选择[未打折合同额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折合同额"))) {
		return false;
	}
	if(	javaTrim(FormName.htcxhdje)=="") {
		alert("请选择[计入促销活动金额]！");
		FormName.htcxhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htcxhdje, "计入促销活动金额"))) {
		return false;
	}

	if(	javaTrim(FormName.xmzy)=="") {
		alert("请输入[项目专员]！");
		FormName.xmzy.focus();
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
	if(	javaTrim(FormName.ddshbz)=="") {
		alert("请选择[等待送货通知标志]！");
		FormName.ddshbz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhtzshsj, "计划通知送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[签合同时间]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "签合同时间"))) {
		return false;
	}

	if(	javaTrim(FormName.zczkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.zczkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zczkl, "订单折扣"))) {
		return false;
	}
	if (FormName.zczkl.value<=0 || FormName.zczkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.zczkl.select();
		return false;
	}
	if (FormName.zczkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveHtJc_zcdd.jsp";
	FormName.submit();

/*
	FormName.srxh.disabled=false;
	FormName.cxxh.disabled=false;
	FormName.plxg.disabled=false;
*/
	FormName.xzwc.disabled=false;
	FormName.dpxg.disabled=false;
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;

	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zcdd.jsp";
	FormName.submit();
	return true;
}
function f_srxh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";
	FormName.submit();
	return true;
}
function f_cxxh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}


function f_xzwc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtDj.jsp";
		<%
	}
	else if (djlrfs.equals("2"))
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtZk.jsp";
		<%
	}
	else
	{
		%>
		FormName.action="InsertJc_zcddmxSxht.jsp";
		<%
	}
%>
	FormName.submit();
	return true;
}

function f_plxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			FormName.action="EditAllDjBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllDjJc_zcddmx.jsp";
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			FormName.action="EditAllZkBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllZkJc_zcddmx.jsp";
			<%
		}
	}
	else
	{
		%>
		FormName.action="EditAllNoJc_zcddmx.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_dpxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
