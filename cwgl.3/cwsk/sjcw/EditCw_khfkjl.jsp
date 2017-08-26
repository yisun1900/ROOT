<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sjbh=null;
String fklxbm=null;
String fkje=null;
String jkr=null;
String skr=null;
String sksj=null;
String skdw=null;
String lrr=null;
String lrsj=null;
String shbz=null;
String shr=null;
String shsj=null;
String bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String fkcsmc=null;
double yfkbl=0;
double yfkje=0;
String gysbh=null;
String ddbh=null;
String zcgysbh=null;
String zcddbh=null;

String skdd=null;
String dsksjbz=null;
String sjr=null;
String sjsj=null;

String khxm="";
String fwdz="";
String lxfs="";
String sjs="";
String qye="";
String hth="";
String dwbh="";
String sgd="";
String zjxm="";
String qyrq="";
String zt="";
String shyj="";

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gysbh,ddbh,zcgysbh,zcddbh,cw_khfkjl.shyj,skdd,dsksjbz,sjr,sjsj,zckx,lrdw,khbh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr,lrsj,bz,zffs,fkcsmc,cw_khfkjl.yfkbl,yfkje ";
	ls_sql+=" from  cw_khfkjl,cw_fkcs";
	ls_sql+=" where cw_khfkjl.fkcs=cw_fkcs.fkcs(+) and fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysbh=cf.fillNull(rs.getString("gysbh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		shyj=cf.fillNull(rs.getString("shyj"));
		skdd=cf.fillNull(rs.getString("skdd"));
		dsksjbz=cf.fillNull(rs.getString("dsksjbz"));
		sjr=cf.fillNull(rs.getString("sjr"));
		sjsj=cf.fillNull(rs.getDate("sjsj"));

		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkje=cf.fillNull(rs.getString("fkje"));
		jkr=cf.fillNull(rs.getString("jkr"));
		skr=cf.fillNull(rs.getString("skr"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skdw=cf.fillNull(rs.getString("skdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zffs=cf.fillNull(rs.getString("zffs"));
		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		yfkbl=rs.getDouble("yfkbl");
		yfkje=rs.getDouble("yfkje");
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,qyrq,zjxm,zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		hth=cf.fillNull(rs.getString("hth"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zt=cf.fillNull(rs.getString("zt"));
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,fwdz,lxfs,sjs,zxdm";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			dwbh=cf.fillNull(rs.getString("zxdm"));
		}
	}
	rs.close();
	ps.close();

	if (skr.equals(yhmc))
	{
//		out.println("错误！【收款人】与【审核人】不能相同");
//		return;
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
<title>财务审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"><div align="center">财务审核（<font color="#0000CC">收款序号：<%=fkxh%></font>）</div></td>
  </tr>
  <tr>
    <td width="100%" ><div align="center">
      <form method="post" action="SaveEditCw_khfkjl.jsp" name="editform">
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">客户编号</font></td>
            <td width="30%"><%=khbh%></td>
            <td width="20%" align="right"><font color="#0000CC">合同号</font></td>
            <td width="30%"><%=hth%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">客户姓名</font> </td>
            <td width="30%"><%=khxm%></td>
            <td width="20%" align="right"><font color="#0000CC">签约日期</font> </td>
            <td width="30%"><%=qyrq%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">房屋地址</font></td>
            <td colspan="3"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">设计师</font> </td>
            <td width="30%"><%=sjs%></td>
            <td width="20%" align="right"><font color="#0000CC">质检姓名</font> </td>
            <td width="30%"><%=zjxm%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">施工队</font> </td>
            <td width="30%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
            </td>
            <td width="20%" align="right"><font color="#0000CC">签约额</font> </td>
            <td width="30%"><%=qye%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right">收款类型</td>
            <td width="30%"><%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+fklxbm+"'",fklxbm,true);
%>
            <td width="20%" align="right">收款期数</td>
            <td width="30%"><%=fkcsmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td height="2" align="right">应收款比率</td>
            <td height="2"><%=yfkbl%> % </td>
            <td height="2" bgcolor="#FFFFFF" align="right">应收款金额</td>
            <td height="2"><%=yfkje%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td bgcolor="#FFFFFF" align="right">支付方式</td>
            <td><%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm where zffsbm='"+zffs+"'",zffs);
%>
            </td>
            <td align="right">收据编号</td>
            <td><%=sjbh%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td bgcolor="#FFFFFF" align="right">收款品牌</td>
            <td><%=gysbh%></td>
            <td align="right">收款订单编号</td>
            <td><%=ddbh%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right">转帐款项</td>
            <td width="30%"><%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+zckx+"'",zckx);
%></td>
            <td width="20%" align="right">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">转帐品牌</td>
            <td><%=zcgysbh%></td>
            <td align="right">转帐订单编号</td>
            <td><%=zcddbh%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"> 收款人 </td>
            <td width="30%"><%=skr%> </td>
            <td width="20%" align="right"> 收款时间 </td>
            <td width="30%"><%=sksj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">收款单位</font> </td>
            <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'",skdw,true);
%>
            </td>
            <td width="20%" align="right" bgcolor="#FFFFFF"></td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">录入人</font> </td>
            <td width="30%"><%=lrr%> </td>
            <td width="20%" align="right"><font color="#0000CC">录入时间</font> </td>
            <td width="30%"><%=lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right">是否需审核</td>
            <td width="30%"><%
	cf.selectToken(out,"1+不需审核&2+需审核",skdd,true);
%></td>
            <td width="20%" align="right">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">备注</td>
            <td colspan="3"><%=bz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td colspan="4" bgcolor="#CCFFCC">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#FF0000">*</font>审核结果</td>
            <td><%
	cf.radioToken(out,"dsksjbz","Y+审核通过&M+审核未通过",dsksjbz);
%></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">审核人</font></td>
            <td width="30%"><input type="text" name="sjr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
            </td>
            <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">审核时间</font></td>
            <td width="30%"><input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#FF0000">*</font>收款金额（可改）</td>
            <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" >
            </td>
            <td align="right"><font color="#FF0000">*</font>财务收款时间</td>
            <td><input type="text" name="sjsj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">审核意见</td>
            <td colspan="3"><textarea name="shyj" cols="71" rows="5"><%=shyj%></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center"><input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="fkxh"  value="<%=fkxh%>" >
                  <input name="button" type="button" onClick="f_do(editform)"  value="保存">
                  <input name="reset" type="reset"  value="重输">
                  <input type="button" value="查看收款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
            </td>
          </tr>
        </table>
      </form>
    </div></td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjr)=="") {
		alert("请输入[审核人]！");
		FormName.sjr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsj)=="") {
		alert("请输入[财务收款时间]！");
		FormName.sjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjsj, "财务收款时间"))) {
		return false;
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "收款金额"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("错误！[收款金额]不能为0");
		FormName.fkje.select();
		return false;
	}

	if(	!radioChecked(FormName.dsksjbz)) {
		alert("请选择[审核结果]！");
		FormName.dsksjbz[0].focus();
		return false;
	}

	if (FormName.dsksjbz[1].checked)
	{
		if(	javaTrim(FormName.shyj)=="") {
			alert("请输入[审核意见]！");
			FormName.shyj.focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
