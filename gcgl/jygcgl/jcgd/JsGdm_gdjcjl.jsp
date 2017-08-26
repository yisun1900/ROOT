<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdm_gdjcjl.jlje,khbh,xjr,xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,DECODE(sffszg,'Y','发生','N','未发生') sffszg,gdm_gdjcjl.dwbh,dwmc,gdm_gdjcjl.zrr,lrr,lrsj,gdm_gdjcjl.bz ";
	ls_sql+=" from  gdm_gdjcjl,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm,sq_dwxx";
	ls_sql+=" where gdm_gdjcjl.jcjlh='"+jcjlh+"'";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
    ls_sql+=" and gdm_gdjcjl.dwbh=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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
<title>工地监察记录－接收</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">工地监察记录－接收（监察记录号：<%=jcjlh%>） </div>

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
%> 
</table>
<BR>

<table width="95%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="25%"><div align="center"><font color="#000099">文件名称</font></td>
    <td width="60%"><div align="center"><font color="#000099">照片</font></td>
  </tr>
  <%

	String yszpmc=null;
	ls_sql="SELECT xjzpmc";
	ls_sql+=" FROM gdm_jcjlzp";
	ls_sql+=" where  jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
      <tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center"><%=yszpmc%>
		  </td>
		  <td width="60%"> 
			<div align="center"><img src="/gcgl/jygcgl/images/<%=yszpmc.toUpperCase() %>" width="300">
		  </td>
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

<form method="post" action="SaveJsGdm_gdjcjl.jsp" name="editform">
        <div align="center"><b>工地监察记录－接收</b></div>
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
      <td width="33%">&nbsp;</td>
    </tr>
    
    <tr>
      <td rowspan="2" align="right"><font color="#FF0000">*</font>处理状态</td>
      <td rowspan="2"><%
	cf.radioToken(out, "clzt","2+已接收等待出方案<BR>&D+已接收不需出方案","");
%></td>
      <td align="right">计划出方案时间</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    </tr>
    
    <tr>
      <td align="right">计划解决时间</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">接收人</font></td>
      <td width="32%"> 
        <input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">接收时间</font></td>
      <td width="33%"> 
        <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>接收说明</td>
      <td colspan="3"> 
        <textarea name="jssm" cols="87" rows="10"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
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
	if(	!radioChecked(FormName.clzt)) {
		alert("请选择[处理状态]！");
		FormName.clzt[0].focus();
		return false;
	}

	if (FormName.clzt[0].checked)
	{
		if(	javaTrim(FormName.jhcfasj)=="") {
			alert("请输入[计划出方案时间]！");
			FormName.jhcfasj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhcfasj, "计划出方案时间"))) {
			return false;
		}

		FormName.jhjjsj.value="";
	}
	else{
		if(	javaTrim(FormName.jhjjsj)=="") {
			alert("请输入[计划解决时间]！");
			FormName.jhjjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhjjsj, "计划解决时间"))) {
			return false;
		}

		FormName.jhcfasj.value="";
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[接收人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[接收时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "接收时间"))) {
		return false;
	}

	if(	javaTrim(FormName.jssm)=="") {
		alert("请选择[接收说明]！");
		FormName.jssm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
