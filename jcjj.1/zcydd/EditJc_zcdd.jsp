<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

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
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;

String fkje=null;
String sqdj="";
String wdzje=null;
String dqbm="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;

double zczkl=0;
String dzyy=null;

try {
	conn=cf.getConnection();

	ls_sql="select lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,dzyy,wdzje,zcdlbm,zcxlbm,ppbm,ddbh,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));

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

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
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
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='33'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			lsd=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}

	if (lsd>0)
	{
		fkje=lsd+"（主材订金）";
	}
	else{
		fkje="未付订金";
	}

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
      <div align="center"> 请修改主材预订单（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right">客户编号</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="17%" bgcolor="#CCCCFF"> 
                <div align="right">合同号</div>              </td>
              <td width="33%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"><%=khxm%></td>
              <td width="17%" align="right">质检</td>
              <td width="33%"><%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="32%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="17%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="33%" bgcolor="#CCCCFF"><%=sjs%>（<%=sjsdh%>）</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">施工队</div>              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
              <td width="17%"> 
                <div align="right">班长</div>              </td>
              <td width="33%"><%=sgbz%>（<%=bzdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">家装签约日期</div>              </td>
              <td width="32%"> <%=qyrq%> </td>
              <td width="17%"> 
                <div align="right">家装签约额</div>              </td>
              <td width="33%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">合同开工日期</td>
              <td width="32%"><%=kgrq%></td>
              <td width="17%" align="right">合同竣工日期</td>
              <td width="33%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">参加促销活动</td>
              <td width="32%"> <%=cxhdbm%> </td>
              <td width="17%" align="right">订金</td>
              <td width="33%"><%=fkje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font><font color="#0000FF">主材大类</font></td>
              <td width="32%"> 
                <input name="zcdlbm" type="text" value="<%=zcdlbm%>" size="20" readonly>              </td>
              <td width="17%" align="right"><font color="#0000FF">主材小类</font></td>
              <td width="33%"> 
                <input name="zcxlbm" type="text" value="<%=zcxlbm%>" size="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000FF">子品牌</font></td>
              <td colspan="3"> 
                <input name="ppbm" type="text" value="<%=ppbm%>" size="75" readonly>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">品牌是否有优惠</font></td>
              <td width="32%"><%
	cf.radioToken(out,"N+否&Y+是",sfyyh,true);
%></td>
              <td width="17%" align="right"><font color="#0000FF">优惠期</font></td>
              <td width="33%">(<%=yhkssj%>)－－(<%=yhjzsj%>)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">优惠内容</font></td>
              <td colspan="3"><%=yhnr%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>家居顾问</div>              </td>
              <td width="32%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc",clgw);
%> 
                </select>              </td>
              <td width="17%" align="right">计划测量时间</td>
              <td width="33%"><input type="text" name="jhclsj" size="20" maxlength="10"  value="<%=jhclsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                <input type="hidden" name="xmzy" value="<%=xmzy%>" >
                <input type="hidden" name="ztjjgw" value="<%=ztjjgw%>" >
                  <input type="hidden" name="whereddbh"  value="<%=whereddbh%>" >
                  <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="dqbm" value="<%=dqbm%>" >
                  <input type="hidden" name="zczkl" value="<%=zczkl%>" >
                  <input type="hidden" name="dzyy" value="<%=dzyy%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[子品牌]！");
		FormName.ppbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhclsj, "计划测量时间"))) {
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


	FormName.action="SaveEditJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
