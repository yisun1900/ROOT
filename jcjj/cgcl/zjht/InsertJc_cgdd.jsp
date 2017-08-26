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
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String khlx=request.getParameter("zt");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

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
String xmzy="";
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh="";
String ssfgs=null;

String fkje=null;
String sqdj="";

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;
try {
	conn=cf.getConnection();

	if (khlx.equals("2"))//2:家装客户;4:非家装客户
	{
		ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,crm_khxx.fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,xmzy";
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
			xmzy=cf.fillNull(rs.getString("xmzy"));
		}
		rs.close();
		ps.close();
	}
	else
	{
		ls_sql="select khxm,fwdz,lxfs,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		}
		rs.close();
		ps.close();

		if (dmbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dmbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));
			}
			rs.close();
			ps.close();

		}
	}

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
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dmbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//活动订金
	double lsd=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51'";//11：家装款；21:木门；22:橱柜；23:主材；24：家具；31:木门订金；32:橱柜订金；33:主材订金；34：家具订金； 41：集成订金；51：促销活动订金；61：预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lsd=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (lsd>0)
	{
		fkje=lsd+"（活动订金）";
	}
	else{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='32'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			lsd=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (lsd>0)
		{
			fkje=lsd+"（橱柜订金）";
		}
	}
	if (lsd==0)
	{
		fkje="未付订金";
	}

	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ddbh=khbh+cf.addZero(count+1,2);
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

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">订单编号</td>
		<td  width="11%">处理状态</td>
		<td  width="10%">橱柜工厂</td>
		<td  width="9%">合同总额</td>
		<td  width="8%">柜体合同金额</td>
		<td  width="7%">台面合同金额</td>
		<td  width="7%">五金合同金额</td>
		<td  width="7%">电器合同金额</td>
		<td  width="6%">项目专员</td>
		<td  width="6%">驻店家居顾问</td>
		<td  width="6%">展厅家居顾问</td>
		<td  width="6%">录入人</td>
		<td  width="9%">录入时间</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_cgdd.ddbh as ddbh,clztmc,pdgcmc,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.clgw as jc_cgdd_clgw,jc_cgdd.xmzy as jc_cgdd_xmzy,jc_cgdd.ztjjgw as ztjjgw,jc_cgdd.lrr,jc_cgdd.lrsj";
		ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx ";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
		ls_sql+=" and jc_cgdd.khbh='"+khbh+"'";
		ls_sql+=" order by jc_cgdd.lrsj desc";
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
      <div align="center">请录入橱柜订单（订单编号：<%=ddbh%>）<font color="#FF0000"><%if (count>0) out.print("注意:该客户已有订单");%></font></div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="449" > 
      <div align="center">

<form method="post" action="" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right">客户编号</div>
              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right">合同号</div>
              </td>
              <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="19%" align="right">质检</td>
              <td width="31%"><%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="19%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="31%" bgcolor="#CCCCFF"><%=sjs%>（<%=sjsdh%>）</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
              <td width="19%"> 
                <div align="right">班长</div>
              </td>
              <td width="31%"><%=sgbz%>（<%=bzdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">家装签约日期</div>
              </td>
              <td width="31%"> <%=qyrq%> </td>
              <td width="19%"> 
                <div align="right">家装签约额</div>
              </td>
              <td width="31%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">合同开工日期</td>
              <td width="31%"><%=kgrq%></td>
              <td width="19%" align="right">合同竣工日期</td>
              <td width="31%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">参加促销活动</td>
              <td width="31%"> <%=cxhdbm%> </td>
              <td width="19%" align="right">订金</td>
              <td width="31%"><%=fkje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">项目专员</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
				<%
				if (xmzy.equals(""))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
				}
				else{
					out.println("<option value=\""+xmzy+"\">"+xmzy+"</option>");
				}
				%> 
                </select>
                <input type="hidden" name="khlx" value="<%=khlx%>">
                <input type="hidden" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%" align="right">橱柜订金</td>
              <td width="31%"> 
                <input type="text" name="dj" value="<%=sqdj%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">计划初测时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jhccsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">计划复测时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jhfcsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">橱柜品牌</td>
              <td width="31%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
//目前不用	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' order by gysmc","");
%> 
                </select>
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>是否需派设计师</td>
              <td width="31%">
                <input type="radio" name="sfpsjs" value="1" checked>
                是</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入人</td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%" align="right">录入时间</td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                  <input type="hidden" name="qddm" value="<%=dmbh%>" >
                  <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="button"  value="继续" onClick="f_do(insertform)">
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


	if(!(isFloat(FormName.dj, "订金"))) {
		return false;
	}

	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhfcsj, "计划复测时间"))) {
		return false;
	}

/*
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
	if(	!radioChecked(FormName.sfpsjs)) {
		alert("请选择[是否需派设计师]！");
		FormName.sfpsjs[0].focus();
		return false;
	}
	if (FormName.sfpsjs[1].checked)
	{
		if(	javaTrim(FormName.pdgc)=="") {
			alert("请输入[橱柜品牌]！");
			FormName.pdgc.focus();
			return false;
		}
	}
*/
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
	FormName.action="SaveInsertJc_cgdd.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;
}

//-->
</SCRIPT>
