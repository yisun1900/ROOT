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
		out.println("�����޵绰���ţ�����ϵϵͳ����Ա");
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ���ͻ���ţ�<%=khbh%>����<font color="#CC0000">*</font>Ϊ�����ֶΣ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_zxkhxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right">С������</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx",xqlx);
%>
              </select></td>
              <td align="right">�ͻ���Դ����</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm",khzyxz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�ͻ�����             </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�Ա�              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">��ϵ��ʽ</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" size="70" maxlength="100"  value="<%=lxfs%>" readonly>
                <input type="hidden" name="khlxfs" value="<%=khlxfs%>"  >
                <input name="button" type="button" onClick="if (javaTrim(khxm)=='') {alert('¼��[�ͻ�����]');khxm.select();return false;};window.open('getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="¼��绰""></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�����ʼ�</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                <font color="#FF0000">(ע�⣺�ж������<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
                </select>              </td>
              <td width="18%" align="right">�ֵ�</td>
              <td width="32%"><input name="jiedao" type="text" value="<%=jiedao%>" onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" size="20" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" height="2"><font color="#CC0000">*</font>С��</td>
              <td height="2"><input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(insertform)"></td>
              <td height="2" align="right">¥��</td>
              <td height="2"><input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="2">&nbsp;</td>
              <td height="2" colspan="3">ע�⣺<font color="#0000FF">���ݵ�ַ</font>���������ֵ���С����¥�ţ��Զ����ɣ�����¼��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000FF">���ݵ�ַ</font>             </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��Чͨ�ŵ�ַ</td>
              <td colspan="3"><input name="yxtxdz" type="text" value="<%=yxtxdz%>" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�Ƿ�Զ�̿ͻ�</td>
              <td><%
	cf.radioToken(out, "sfyckh","Y+��&N+��",sfyckh);
%></td>
              <td align="right">�ɵ�����</td>
              <td><select name="pdqybm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
		cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where dqbm='"+dqbm+"' order by pdqybm",pdqybm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ǼǱ���</td>
              <td><input name="djbbh" type="text" value="<%=djbbh%>" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">ϣ���μӹ�˾�����</font></td>
              <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">ϣ���μ�С�������</font></td>
              <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">ϣ���μ�չ������</font></td>
              <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ʦ</font></td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right"><font color="#0000FF">ҵ��Ա</font></td>
              <td width="32%"><%=ywy%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ͻ�����</font></td>
              <td><%=khjl%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������ҵ</td>
              <td><select name="sshybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm",sshybm);
%>
              </select></td>
              <td align="right">ְҵ</td>
              <td><select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td colspan="3"><input name="gmyx" type="text" value="<%=gmyx%>" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
                </select>              </td>
              <td width="18%" align="right">������</td>
              <td width="32%"><select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(fj)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="32%"><select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm);
%>
              </select></td>
              <td width="18%" align="right">���ۣ�Ԫ/m��</td>
              <td width="32%"> 
                <input type="text" name="fj" value="<%=fj%>" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">�ƻ�����ʱ��</td>
              <td width="32%"><input type="text" name="jhjfsj" value="<%=jhjfsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)"></td>
              <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">����              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">���ڽ������              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" rowspan="4" align="right"> 
			  <font color="#CC0000">*</font>��Ϣ��Դ<BR>
              <B><font color="#0000CC">(�����ѡ)</font></B>              </td>
              <td rowspan="4" width="32%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
                  <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
                </select>              </td>
              <td width="18%" align="right">���Ҫ��</td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">װ��Ԥ��</td>
              <td width="32%"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">Ԥ��װ��ʱ��</td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��ϵ�ͻ�</td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��Ϣ��Դ˵��</td>
              <td colspan="3"><input name="xxlysm" type="text" value="<%=xxlysm%>" size="73" maxlength="100"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"> 
                <div align="right">�ص���־              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)">
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%>
              </select>              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                <div align="right">�ص���              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
              <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20" onKeyUp="keyTo(yzxxbz)" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">�ص�װ�޵�ַ</td>
              <td colspan="3" bgcolor="#E8E8FF"> 
              <input type="text" name="cgdz" value="<%=cgdz%>" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�Ƿ���ط�              </td>
              <td width="32%" bgcolor="#FFFFFF"> <%
	cf.radioToken(out, "sfxhf","Y+��ط�&N+����ط�",sfxhf);
%> </td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">�ط�����              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
              <input type="text" name="hfrq" size="20" maxlength="10"  value="<%=hfrq%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��Ч��Ϣ��־</td>
              <td width="32%"> <%
	cf.radioToken(out, "yzxxbz","Y+��Ч��Ϣ&N+��Ч��Ϣ",yzxxbz);
%> </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��װ��־</td>
              <td width="32%"> <%
	cf.radioToken(out, "jzbz","1+��װ&2+��װ",jzbz);
%> </td>
            </tr>
			 <tr bgcolor="#E8E8FF"> 
              <td align="right"><font color="#CC0000">*</font>������־</td>
              <td><%
		cf.radioToken(out, "lfbz","N+δ����&Y+������",lfbz);
%></td>
              <td align="right">����ʱ��</td>
              <td> 
                <input type="text" name="lfsj" size="20" maxlength="20"  value="<%=lfsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����Ʒ��</td>
              <td><input name="clpp" type="text" value="<%=clpp%>" size="20" maxlength="20" ></td>
              <td align="right">���ƺ�</td>
              <td><input type="text" name="cph" value="<%=cph%>" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td colspan="3"><input type="text" name="czms" value="<%=czms%>" size="73" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����Ҫ��</td>
              <td colspan="3"><textarea name="gnyq" cols="72" rows="3" ><%=gnyq%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������</td>
              <td>
<%
	cf.radioToken(out, "hyzk","�ѻ�+�ѻ�&δ��+δ��",hyzk);
%>			  </td>
              <td align="right">�Ƿ����װ��</td>
              <td>
<%
	cf.radioToken(out, "sfdkzx","��+��&��+��",sfdkzx);
%>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td><input type="text" name="hznl" value="<%=hznl%>" size="20" maxlength="20" ></td>
              <td align="right">����ͬס</td>
              <td>
<%
	cf.radioToken(out, "lrtz","��+��&��+��",lrtz);
%>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ԤԼ����ʱ��</td>
              <td><input type="text" name="yylfsj" value="<%=yylfsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">�´�����ʱ��</td>
              <td><input type="text" name="xclfsj" value="<%=xclfsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ƻ���ƽ��ͼʱ��</td>
              <td><input type="text" name="jhctsj" value="<%=jhctsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">�ƻ���Ч��ͼʱ��</td>
              <td><input type="text" name="jhcxgtsj" value="<%=jhcxgtsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ƻ���ʩ��ͼʱ��</td>
              <td><input type="text" name="jhcsgtsj" value="<%=jhcsgtsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">�ƻ������ӱ���ʱ��</td>
              <td><input type="text" name="jhzbjsj" value="<%=jhzbjsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">��ע              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center" > 
				<input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
				<input type="hidden" name="cxhdbm"  value="<%=cxhdbm%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khzsxx.jsp?khbh=<%=khbh%>')"  value="�������Ϣ">
                  <input name="button2" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="��������ȯ">
                  <input type="reset"  value="����">              </td>
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
	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
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

function f_do(FormName)//����FormName:Form������
{
	cf_fwdz(FormName);

	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(!(isNumber(FormName.fj, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(	!selectChecked(FormName.xxlybm)) {
		alert("������[��Ϣ��Դ]��");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���ڽ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "�ط�����"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfrq)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hfrq.focus();
			return false;
		}
	}
	else{
		FormName.hfrq.value="";
	}

	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	!radioChecked(FormName.yzxxbz)) {
		alert("��ѡ��[��Ч��Ϣ��־]��");
		FormName.yzxxbz[0].focus();
		return false;
	}
	
   if(	!radioChecked(FormName.lfbz)) {
		alert("��ѡ��[������־]��");
		FormName.lfbz[0].focus();
		return false;
	}
	if (FormName.lfbz[1].checked)
	{
		if(	javaTrim(FormName.lfsj)=="") {
			alert("������[����ʱ��]��");
			FormName.lfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.lfsj, "����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.lfsj.value="";
	}
	
	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.jhctsj, "�ƻ���ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "�ƻ���Ч��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "�ƻ���ʩ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "�ƻ������ӱ���ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyckh)) {
		alert("��ѡ��[�Ƿ�Զ�̿ͻ� ]��");
		FormName.sfyckh[0].focus();
		return false;
	}




	FormName.action="SaveEditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
