<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));

String ssfgs=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwmc=null;
String zjxm=null;
String sjkgrq=null;
String sjjgrq=null;


String khbh=null;
String xjr=null;
String xjsj=null;
String xxlymc=null;
String jclxmc=null;
String jcjgmc=null;
String jcwtflmc=null;
String sffszg=null;
String zrbm=null;
String zrbmmc=null;
String zrr=null;
double jlje=0;
String lrr=null;
String lrsj=null;
String bz=null;

String clzt=null;
String jssj=null;
String jsr=null;
String jssm=null;
String jhcfasj=null;
String jhjjsj=null;

String shr=null;
String shsj=null;
String shsm=null;

String cfajlh=null;
String jjfa=null;
String sjcfar=null;
String sjcfasj=null;

String shjl=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdm_gdjcjl.jlje,khbh,xjr,xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,DECODE(sffszg,'Y','发生','N','未发生') sffszg,gdm_gdjcjl.dwbh,dwmc,gdm_gdjcjl.zrr,lrr,lrsj,gdm_gdjcjl.bz ";
	ls_sql+=" ,gdm_gdjcjl.clzt,gdm_gdjcjl.jssm,gdm_gdjcjl.jhcfasj,gdm_gdjcjl.jhjjsj,gdm_gdjcjl.jssj,gdm_gdjcjl.jsr";
	ls_sql+=" ,shr,shsj,shsm";
	ls_sql+=" ,cfajlh,jjfa,sjcfar,sjcfasj";
	ls_sql+=" from  gdm_gdjcjl,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm,sq_dwxx";
	ls_sql+=" where gdm_gdjcjl.jcjlh='"+jcjlh+"'";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
    ls_sql+=" and gdm_gdjcjl.dwbh=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		jssm=cf.fillNull(rs.getString("jssm"));
		jhcfasj=cf.fillNull(rs.getDate("jhcfasj"));
		jhjjsj=cf.fillHtml(rs.getDate("jhjjsj"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));

		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shsm=cf.fillHtml(rs.getString("shsm"));

		cfajlh=cf.fillNull(rs.getString("cfajlh"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		sjcfar=cf.fillNull(rs.getString("sjcfar"));
		sjcfasj=cf.fillNull(rs.getDate("sjcfasj"));

		jlje=rs.getDouble("jlje");
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xxlymc=cf.fillNull(rs.getString("xxlymc"));
		jcjgmc=cf.fillNull(rs.getString("jcjgmc"));
		jclxmc=cf.fillNull(rs.getString("jclxmc"));
		jcwtflmc=cf.fillNull(rs.getString("jcwtflmc"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		zrbm=cf.fillNull(rs.getString("dwbh"));
		zrbmmc=cf.fillNull(rs.getString("dwmc"));
		zrr=cf.fillNull(rs.getString("zrr"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("9"))//9：方案审核通过
	{
		shjl="Y";
	}
	else if (clzt.equals("A"))//A：方案审核未通过
	{
		shjl="N";
	}

	ls_sql="select hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,dwmc,zjxm,sjkgrq,sjjgrq,crm_khxx.fgsbh";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		ssfgs=cf.fillHtml(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>方案审核－修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">方案审核－修改（监察记录号：<%=jcjlh%>） </div>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">客户编号</font>    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">合同号</font>    </td>
    <td width="32%"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">客户姓名</font></td>
    <td width="33%"> <%=khxm%></td>
    <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
    <td width="32%"> <%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">电话</font></td>
    <td><%=lxfs%></td>
    <td align="right"><font color="#0000CC">房屋地址</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">设计师</font>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">工程担当</font>    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">施工队</font>    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">施工班组</font>    </td>
    <td width="32%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
    <td width="33%"> <%=sjkgrq%> </td>
    <td width="18%" align="right"><font color="#0000CC">实交工日期</font></td>
    <td width="32%"> <%=sjjgrq%> </td>
  </tr>
</table>

<BR>
<BR>
<center>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr bgcolor="#FFFFFF">
      <td align="right">信息来源</td>
      <td><%=xxlymc%></td>
      <td align="right">检查类型 </td>
      <td><%=jclxmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">检查结果 </td>
      <td width="32%"><%=jcjgmc%></td>
      <td width="18%" align="right">问题分类</td>
      <td width="32%"><%=jcwtflmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否发生整改</td>
      <td><%=sffszg%></td>
      <td align="right">奖励金额</td>
      <td><%=jlje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">责任部门</td>
      <td><%=zrbmmc%></td>
      <td align="right">负责人</td>
      <td><%=zrr%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">检查人 </td>
      <td width="32%"><%=xjr%>
      </td><td width="18%" align="right">检查时间 </td>
      <td width="32%"><%=xjsj%>
      </td></tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">录入人 </td>
      <td width="32%"><%=lrr%>
      </td><td width="18%" align="right">录入时间 </td>
      <td width="32%"><%=lrsj%>
      </td></tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">备注</td>
      <td colspan="3"><%=bz%>
      </td></tr>
  </table>

<BR>
<table border="1" width="95%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">项目小类</td>
	<td  width="5%">项目编码</td>
	<td  width="15%">项目名称</td>
	<td  width="5%">违规级别</td>
	<td  width="7%">整改要求</td>
	<td  width="7%">处罚人员职务</td>
	<td  width="5%">处罚人员</td>
	<td  width="5%">员工扣分</td>
	<td  width="5%">员工罚款</td>
	<td  width="5%">施工队扣分</td>
	<td  width="5%">施工队罚款</td>
	<td  width="5%">违章次数</td>
	<td  width="85%">备注</td>
</tr>
<%
	String mx_xmxlmc=null;
	String mx_xmbm=null;
	String mx_xmmc=null;
	String mx_wgjbmc=null;
	String mx_zgyq=null;
	String mx_xzzwbm=null;
	String mx_yhmc=null;
	String mx_ygkf=null;
	String mx_ygfkje=null;
	String mx_sgdkf=null;
	String mx_sgdfkje=null;
	String mx_wzcs=null;
	String mx_bz=null;

	ls_sql="SELECT xmxlmc,xmbm,xmmc,wgjbmc,zgyq,xzzwbm,yhmc,ygkf,ygfkje,sgdkf,sgdfkje,wzcs,bz  ";
	ls_sql+=" FROM gdm_jcjlmx  ";
    ls_sql+=" where gdm_jcjlmx.jcjlh='"+jcjlh+"'";
    ls_sql+=" order by xmdlbm,xmxlbm,xmbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		mx_xmxlmc=cf.fillNull(rs.getString("xmxlmc"));
		mx_xmbm=cf.fillNull(rs.getString("xmbm"));
		mx_xmmc=cf.fillNull(rs.getString("xmmc"));
		mx_wgjbmc=cf.fillNull(rs.getString("wgjbmc"));
		mx_zgyq=cf.fillNull(rs.getString("zgyq"));
		mx_xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		mx_yhmc=cf.fillHtml(rs.getString("yhmc"));
		mx_ygkf=cf.fillNull(rs.getString("ygkf"));

		mx_ygfkje=cf.fillHtml(rs.getString("ygfkje"));
		mx_sgdkf=cf.fillHtml(rs.getString("sgdkf"));
		mx_sgdfkje=cf.fillHtml(rs.getString("sgdfkje"));
		mx_wzcs=cf.fillHtml(rs.getString("wzcs"));
		mx_bz=cf.fillHtml(rs.getString("bz"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=mx_xmxlmc%></td>
			<td><%=mx_xmbm%></td>
			<td><%=mx_xmmc%></td>
			<td><%=mx_wgjbmc%></td>
			<td><%=mx_zgyq%></td>
			<td><%=mx_xzzwbm%></td>
			<td><%=mx_yhmc%></td>
			<td><%=mx_ygkf%></td>
			<td><%=mx_ygfkje%></td>
			<td><%=mx_sgdkf%></td>
			<td><%=mx_sgdfkje%></td>
			<td><%=mx_wzcs%></td>
			<td align="left"><%=mx_bz%></td>
		</tr>
		<%
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
</table>

</center>


<form method="post" action="SaveXgShGdm_zgfajl.jsp" name="editform"  >
        <div align="center"><b>方案审核－修改</b>（出方案记录号：<%=cfajlh%>）</div>
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">责任部门</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zrbm+"'",zrbm);
%> 
        </select>      </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%"><strong><font color="#FF0000">
      <input name="button" type="button" onClick="window.open('CKPhoto.jsp?jcjlh=<%=jcjlh%>')"  value="查看现场照片"  >
      </font></strong></td>
    </tr>
    <tr>
      <td align="right"><font color="#0000CC">计划出方案时间</font></td>
      <td><%=jhcfasj%></td>
      <td align="right"><font color="#0000CC">计划解决时间</font></td>
      <td><%=jhjjsj%></td>
    </tr>
    <tr>
      <td align="right"><strong>接收人</strong></td>
      <td><%=jsr%></td>
      <td align="right"><strong>接收时间</strong></td>
      <td><%=jssj%></td>
    </tr>
    <tr>
      <td align="right"><strong>接收说明</strong></td>
      <td colspan="3"><%=jssm%></td>
    </tr>
    <tr>
      <td align="right"><strong>计划解决时间</strong></td>
      <td><%=jhjjsj%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><strong>解决方案</strong></td>
      <td colspan="3"><%=jjfa%></td>
    </tr>
    <tr>
      <td align="right"><strong>实际出方案人</strong></td>
      <td><%=sjcfar%> </td>
      <td align="right"><strong>实际出方案时间</strong></td>
      <td><%=sjcfasj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">审核人</font></td>
      <td><input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">审核时间</font></td>
      <td><input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>审核结论</td>
      <td colspan="3"><%
	cf.radioToken(out, "shjl","Y+通过&N+未通过",shjl);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>审核说明</td>
      <td colspan="3"><textarea name="shsm" cols="71" rows="9"><%=shsm%></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
		<input type="hidden" name="cfajlh" value="<%=cfajlh%>" >
          <input type="button"  value="存盘" onClick="f_do(editform)" >
          <input type="reset"  value="重输" name="reset"></td>
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
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.cfajlh)=="") {
		alert("请输入[出方案记录号]！");
		FormName.cfajlh.focus();
		return false;
	}

	if(	!radioChecked(FormName.shjl)) {
		alert("请选择[审核结论]！");
		FormName.shjl[0].focus();
		return false;
	}
	if (FormName.shjl[1].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("请输入[审核说明]！");
			FormName.shsm.focus();
			return false;
		}
	}


	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
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

	FormName.submit();
	return true;
}

 
//-->
</SCRIPT>
