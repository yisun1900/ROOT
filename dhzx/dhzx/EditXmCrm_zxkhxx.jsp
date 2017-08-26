<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String zdyhbz=(String)session.getAttribute("zdyhbz");
%>
<%

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String jiedao=null;
String cgdz=null;
String yzxxbz=null;
String jzbz=null;

String sjs=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String xqbm=null;
String ywy=null;
String ssfgs=null;

String jhjfsj=null;
String hdr=null;
String sjsbh=null;
String ysrbm=null;
String louhao=null;
String cxhdbm=null;
String dqbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String email=null;

String yxtxdz=null;
String sshybm=null;
String gmyx=null;
String khjl=null;
String xxlysm=null;

String jhctsj=null;
String jhcxgtsj=null;
String jhcsgtsj=null;
String jhzbjsj=null;
String khzyxz=null;
String djbbh=null;
String xqlx=null;
String dhqh=null;
String khlxfs="";

String clpp=null;
String cph=null;
String czms=null;
String gnyq=null;
String hyzk=null;
String sfdkzx=null;
String hznl=null;
String lrtz=null;
String yylfsj=null;
String xclfsj=null;

String lfbz=null;//20100915
String lfsj=null;//20100915

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select xqlx,cxhdbmxq,cxhdbmzh,email,cxhdbm,louhao,ysrbm,sjsbh,jzbz,jhjfsj,hdr,ssfgs,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm,lfbz,lfsj ";
	ls_sql+=" ,yxtxdz,sshybm,gmyx,khjl,xxlysm";
	ls_sql+=" ,jhctsj,jhcxgtsj,jhcsgtsj,jhzbjsj,khzyxz,jiedao,djbbh ";
	ls_sql+=" ,clpp,cph,czms,gnyq,hyzk,sfdkzx,hznl,lrtz,yylfsj,xclfsj ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clpp=cf.fillNull(rs.getString("clpp"));
		cph=cf.fillNull(rs.getString("cph"));
		czms=cf.fillNull(rs.getString("czms"));
		gnyq=cf.fillNull(rs.getString("gnyq"));
		hyzk=cf.fillNull(rs.getString("hyzk"));
		sfdkzx=cf.fillNull(rs.getString("sfdkzx"));
		hznl=cf.fillNull(rs.getString("hznl"));
		lrtz=cf.fillNull(rs.getString("lrtz"));
		yylfsj=cf.fillNull(rs.getDate("yylfsj"));
		xclfsj=cf.fillNull(rs.getDate("xclfsj"));

		xqlx=cf.fillNull(rs.getString("xqlx"));
		djbbh=cf.fillNull(rs.getString("djbbh"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		jhctsj=cf.fillNull(rs.getDate("jhctsj"));
		jhcxgtsj=cf.fillNull(rs.getDate("jhcxgtsj"));
		jhcsgtsj=cf.fillNull(rs.getDate("jhcsgtsj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));

		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		sshybm=cf.fillNull(rs.getString("sshybm"));
		gmyx=cf.fillNull(rs.getString("gmyx"));

		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		email=cf.fillNull(rs.getString("email"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		
		lfbz=cf.fillNull(rs.getString("lfbz"));
		lfsj=cf.fillNull(rs.getDate("lfsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm,dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
	}
	rs.close();
	ps.close();

	if (dhqh==null || dhqh.equals(""))
	{
		out.println("错误！无电话区号，请联系系统管理员");
		return;
	}

	String lxr="";
	String lx="";
	String getdhqh="";
	String qhdh="";
	String dhhm="";
	String fenji="";
	ls_sql="select qhdh,lxr,dhhm,fj,dhqh,lx ";
	ls_sql+=" from  crm_khlxfs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qhdh=cf.fillNull(rs.getString("qhdh"));
		lxr=cf.fillNull(rs.getString("lxr"));
		dhhm=cf.fillNull(rs.getString("dhhm"));
		fenji=cf.fillNull(rs.getString("fj"));
		getdhqh=cf.fillNull(rs.getString("dhqh"));
		lx=cf.fillNull(rs.getString("lx"));

		khlxfs+=lxr+"^"+lx+"^"+dhqh+"^"+qhdh+"^"+dhhm+"^"+fenji+"*";
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
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
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息（客户编号：<%=khbh%>）（<font color="#CC0000">*</font>为必填字段）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_zxkhxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>客户姓名             </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>所属城区</td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
                </select>              </td>
              <td width="18%" align="right">街道</td>
              <td width="32%"><input name="jiedao" type="text" value="<%=jiedao%>" onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" size="20" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" height="2"><font color="#CC0000">*</font>小区</td>
              <td height="2"><input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(insertform)"></td>
              <td height="2" align="right">楼号</td>
              <td height="2"><input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="2">&nbsp;</td>
              <td height="2" colspan="3">注意：<font color="#0000FF">房屋地址</font>（城区＋街道＋小区＋楼号）自动生成，不需录入</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000FF">房屋地址</font>             </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center" > 
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">              </td>
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

function cf_fwdz(FormName)
{  
	FormName.jiedao.value=strTrim(FormName.jiedao.value);
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
	cf_fwdz(FormName);

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}

	FormName.action="SaveEditXmCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
