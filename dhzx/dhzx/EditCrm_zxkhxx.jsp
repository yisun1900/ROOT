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
String sfyckh=null;
String pdqybm=null;

String lfbz=null;//20100915
String lfsj=null;//20100915

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select pdqybm,sfyckh,xqlx,cxhdbmxq,cxhdbmzh,email,cxhdbm,louhao,ysrbm,sjsbh,jzbz,jhjfsj,hdr,ssfgs,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm,lfbz,lfsj ";
	ls_sql+=" ,yxtxdz,sshybm,gmyx,khjl,xxlysm";
	ls_sql+=" ,jhctsj,jhcxgtsj,jhcsgtsj,jhzbjsj,khzyxz,jiedao,djbbh ";
	ls_sql+=" ,clpp,cph,czms,gnyq,hyzk,sfdkzx,hznl,lrtz,yylfsj,xclfsj ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pdqybm=cf.fillNull(rs.getString("pdqybm"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));
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
	out.print("Exception: " + ls_sql);
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
              <td align="right">小区类型</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx",xqlx);
%>
              </select></td>
              <td align="right">客户资源性质</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm",khzyxz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>客户姓名             </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>性别              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">联系方式</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" size="70" maxlength="100"  value="<%=lxfs%>" readonly>
                <input type="hidden" name="khlxfs" value="<%=khlxfs%>"  >
                <input name="button" type="button" onClick="if (javaTrim(khxm)=='') {alert('录入[客户姓名]');khxm.select();return false;};window.open('getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="录入电话""></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">电子邮件</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                <font color="#FF0000">(注意：有多个邮箱<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
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
            <tr bgcolor="#FFFFFF">
              <td align="right">有效通信地址</td>
              <td colspan="3"><input name="yxtxdz" type="text" value="<%=yxtxdz%>" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>是否远程客户</td>
              <td><%
	cf.radioToken(out, "sfyckh","Y+是&N+否",sfyckh);
%></td>
              <td align="right">派单区域</td>
              <td><select name="pdqybm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
		cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where dqbm='"+dqbm+"' order by pdqybm",pdqybm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">登记表编号</td>
              <td><input name="djbbh" type="text" value="<%=djbbh%>" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">希望参加公司促销活动</font></td>
              <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">希望参加小区促销活动</font></td>
              <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">希望参加展会促销活动</font></td>
              <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">设计师</font></td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right"><font color="#0000FF">业务员</font></td>
              <td width="32%"><%=ywy%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">客户经理</font></td>
              <td><%=khjl%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">所属行业</td>
              <td><select name="sshybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm",sshybm);
%>
              </select></td>
              <td align="right">职业</td>
              <td><select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">购买意向</td>
              <td colspan="3"><input name="gmyx" type="text" value="<%=gmyx%>" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">年龄区间</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
                </select>              </td>
              <td width="18%" align="right">月收入</td>
              <td width="32%"><select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(fj)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋类型</td>
              <td width="32%"><select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm);
%>
              </select></td>
              <td width="18%" align="right">房价（元/m）</td>
              <td width="32%"> 
                <input type="text" name="fj" value="<%=fj%>" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">计划交房时间</td>
              <td width="32%"><input type="text" name="jhjfsj" value="<%=jhjfsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)"></td>
              <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">户型              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">套内建筑面积              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" rowspan="4" align="right"> 
			  <font color="#CC0000">*</font>信息来源<BR>
              <B><font color="#0000CC">(允许多选)</font></B>              </td>
              <td rowspan="4" width="32%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
                  <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
                </select>              </td>
              <td width="18%" align="right">风格要求</td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">装修预算</td>
              <td width="32%"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">预计装修时间</td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>关系客户</td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">信息来源说明</td>
              <td colspan="3"><input name="xxlysm" type="text" value="<%=xxlysm%>" size="73" maxlength="100"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"> 
                <div align="right">回单标志              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)">
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%>
              </select>              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                <div align="right">回单人              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
              <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20" onKeyUp="keyTo(yzxxbz)" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">回单装修地址</td>
              <td colspan="3" bgcolor="#E8E8FF"> 
              <input type="text" name="cgdz" value="<%=cgdz%>" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>是否需回访              </td>
              <td width="32%" bgcolor="#FFFFFF"> <%
	cf.radioToken(out, "sfxhf","Y+需回访&N+不需回访",sfxhf);
%> </td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">回访日期              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
              <input type="text" name="hfrq" size="20" maxlength="10"  value="<%=hfrq%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>有效信息标志</td>
              <td width="32%"> <%
	cf.radioToken(out, "yzxxbz","Y+有效信息&N+无效信息",yzxxbz);
%> </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>家装标志</td>
              <td width="32%"> <%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%> </td>
            </tr>
			 <tr bgcolor="#E8E8FF"> 
              <td align="right"><font color="#CC0000">*</font>量房标志</td>
              <td><%
		cf.radioToken(out, "lfbz","N+未量房&Y+已量房",lfbz);
%></td>
              <td align="right">量房时间</td>
              <td> 
                <input type="text" name="lfsj" size="20" maxlength="20"  value="<%=lfsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">车辆品牌</td>
              <td><input name="clpp" type="text" value="<%=clpp%>" size="20" maxlength="20" ></td>
              <td align="right">车牌号</td>
              <td><input type="text" name="cph" value="<%=cph%>" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">穿着描述</td>
              <td colspan="3"><input type="text" name="czms" value="<%=czms%>" size="73" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">功能要求</td>
              <td colspan="3"><textarea name="gnyq" cols="72" rows="3" ><%=gnyq%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">婚姻情况</td>
              <td>
<%
	cf.radioToken(out, "hyzk","已婚+已婚&未婚+未婚",hyzk);
%>			  </td>
              <td align="right">是否贷款装修</td>
              <td>
<%
	cf.radioToken(out, "sfdkzx","是+是&否+否",sfdkzx);
%>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">孩子年龄</td>
              <td><input type="text" name="hznl" value="<%=hznl%>" size="20" maxlength="20" ></td>
              <td align="right">老人同住</td>
              <td>
<%
	cf.radioToken(out, "lrtz","是+是&否+否",lrtz);
%>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">预约量房时间</td>
              <td><input type="text" name="yylfsj" value="<%=yylfsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">下次来访时间</td>
              <td><input type="text" name="xclfsj" value="<%=xclfsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">计划出平面图时间</td>
              <td><input type="text" name="jhctsj" value="<%=jhctsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">计划出效果图时间</td>
              <td><input type="text" name="jhcxgtsj" value="<%=jhcxgtsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">计划出施工图时间</td>
              <td><input type="text" name="jhcsgtsj" value="<%=jhcsgtsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">计划做电子报价时间</td>
              <td><input type="text" name="jhzbjsj" value="<%=jhzbjsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">备注              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center" > 
				<input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
				<input type="hidden" name="cxhdbm"  value="<%=cxhdbm%>" >
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khzsxx.jsp?khbh=<%=khbh%>')"  value="活动赠送信息">
                  <input name="button2" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="调整代金券">
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
function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

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
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "电子邮件"))) {
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
	if(!(isNumber(FormName.fj, "房价"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "计划交房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(	!selectChecked(FormName.xxlybm)) {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "回访日期"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfrq)=="") {
			alert("请选择[回访日期]！");
			FormName.hfrq.focus();
			return false;
		}
	}
	else{
		FormName.hfrq.value="";
	}

	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	!radioChecked(FormName.yzxxbz)) {
		alert("请选择[有效信息标志]！");
		FormName.yzxxbz[0].focus();
		return false;
	}
	
   if(	!radioChecked(FormName.lfbz)) {
		alert("请选择[量房标志]！");
		FormName.lfbz[0].focus();
		return false;
	}
	if (FormName.lfbz[1].checked)
	{
		if(	javaTrim(FormName.lfsj)=="") {
			alert("请输入[量房时间]！");
			FormName.lfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.lfsj, "量房时间"))) {
			return false;
		}
	}
	else{
		FormName.lfsj.value="";
	}
	
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.jhctsj, "计划出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "计划出效果图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "计划出施工图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "计划做电子报价时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyckh)) {
		alert("请选择[是否远程客户 ]！");
		FormName.sfyckh[0].focus();
		return false;
	}




	FormName.action="SaveEditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
