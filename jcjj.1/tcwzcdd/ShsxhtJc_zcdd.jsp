<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

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

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;


double zqclf=0;
double zhclf=0;
double zqzjxclf=0;
double zhzjxclf=0;
double cbze=0;
double zjxcbze=0;
double htjsbl=0;
double zjxjsbl=0;
double alljsbl=0;

String sqdj="";
String wdzje=null;
String htcxhdje=null;
String jjsjs="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String dzyy=null;

double zczkl=0;
String listSql="";

try {
	conn=cf.getConnection();

	ls_sql="select zjxcbze,cbze,zqclf,zhclf,zqzjxclf,zhzjxclf,dzyy,lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,jjsjs,htcxhdje,wdzje,zcdlbm,zcxlbm,ppbm,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,jhtzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxcbze=rs.getDouble("zjxcbze");
		cbze=rs.getDouble("cbze");
		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");

		dzyy=cf.fillNull(rs.getString("dzyy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zczkl=rs.getDouble("zczkl");

		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
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

	if (zhclf!=0)
	{
		htjsbl=cf.round(100-cbze*100/zhclf,2);
	}
	else{
		htjsbl=0;
	}
	if (zhzjxclf!=0)
	{
		zjxjsbl=cf.round(100-zjxcbze*100/zhzjxclf,2);
	}
	else{
		zjxjsbl=0;
	}
	if ((zhclf+zhzjxclf)!=0)
	{
		alljsbl=cf.round(100-(cbze+zjxcbze)*100/(zhclf+zhzjxclf),2);
	}
	else{
		alljsbl=0;
	}

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
      <div align="center">审核手写合同（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="29%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">客户姓名</td>
              <td width="29%"><%=khxm%></td>
              <td width="21%" align="right">质检</td>
              <td width="29%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="29%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="21%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="29%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                施工队              </td>
              <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="21%" align="right"> 
                班长              </td>
              <td width="29%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                家装签约日期              </td>
              <td width="29%"> <%=qyrq%> </td>
              <td width="21%" align="right"> 
                家装签约额              </td>
              <td width="29%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">合同开工日期</td>
              <td width="29%"><%=kgrq%></td>
              <td width="21%" align="right">合同竣工日期</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right">参加促销活动</td>
              <td width="29%"> <%=cxhdbm%> </td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right"><font color="#0000FF">合同总额</font></td>
              <td width="29%"><%=hkze%></td>
              <td width="21%" align="right" bgcolor="#FFFFCC"><font color="#0000FF">未打折金额</font></td>
              <td width="29%"><%=wdzje%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right"><font color="#0000FF">计入促销活动金额</font></td>
              <td width="29%"><%=htcxhdje%></td>
              <td width="21%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0033CC"><b>成本金额</b></font></td>
              <td><%=cbze%><font color="#FF0000">（<b>合同</b>）</font></td>
              <td width="21%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0033CC"><b>成本金额</b></font></td>
              <td><%=zjxcbze%><font color="#FF0000">（<b>增减项</b>）</font></td>
              <td width="21%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0033CC"><b>成本总额</b></font></td>
              <td><%=cf.formatDouble(cbze+zjxcbze)%><font color="#FF0000">（<b>合同＋增减项</b>）</font></td>
              <td width="21%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFFFFF" align="right"><font color="#0000FF">主材大类</font></td>
              <td width="29%"><%=zcdlbm%></td>
              <td width="21%" align="right"><font color="#0000FF">主材小类</font></td>
              <td width="29%"><%=zcxlbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000FF">子品牌</font></td>
              <td width="29%"><%=ppbm%></td>
              <td width="21%" align="right">订单折扣</td>
              <td width="29%"><%=zczkl%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">打折原因</td>
              <td colspan="3"><%=dzyy%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000FF">品牌是否有优惠</font></td>
              <td width="29%"><%
	cf.radioToken(out,"N+否&Y+是",sfyyh,true);
%></td>
              <td width="21%" align="right"><font color="#0000FF">优惠期</font></td>
              <td width="29%">(<%=yhkssj%>)－－(<%=yhjzsj%>)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000FF">优惠内容</font></td>
              <td colspan="3"><%=yhnr%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">项目专员</td>
              <td width="29%"><%=xmzy%></td>
              <td width="21%" align="right">家居设计师</td>
              <td width="29%"> <%=jjsjs%></td>
            </tr>
			            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
               材料顾问              </td>
              <td width="29%"> <%=clgw%></td>
              <td width="21%" align="right"> 
                &nbsp              </td>
              <td width="29%">&nbsp</td>
            </tr>
            <!--<tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                驻店家居顾问              </td>
              <td width="29%"> <%=clgw%></td>
              <td width="21%" align="right"> 
                展厅家居顾问              </td>
              <td width="29%"> <%=ztjjgw%></td>
            </tr>-->
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                是否等待送货通知              </td>
              <td width="29%"> 
                  <%
	cf.selectToken(out,"1+不需等待通知&2+需等待通知",ddshbz,false);
%>              </td>
              <td width="21%" align="right"> 
                计划通知送货时间              </td>
              <td width="29%"><%=jhtzshsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">合同送货时间</td>
              <td width="29%"><%=htshsj%></td>
              <td width="21%" align="right">签合同时间</td>
              <td width="29%"><%=qhtsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                可减项截止时间              </td>
              <td width="29%"><%=kjxsj%></td>
              <td width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">备注</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                  <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
                  <input type="hidden" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
                  <input type="button"  value="批量修改结算价" onClick="f_plxg(editform)" >
                  <input type="button"  value="逐项修改结算价" onClick="f_zxxg(editform)"  >
              <input type="button"  value="完成审核" onClick="f_wc(editform)" name="wc" >              </td>
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
function f_plxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="LrjsjAllJc_zcddmx.jsp";
	FormName.submit();
//	FormName.wc.disabled=false;
	return true;
}

function f_zxxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="Jc_zcddmxLrjsjList.jsp";
	FormName.submit();
//	FormName.wc.disabled=false;
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="WcSxhtsh.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
