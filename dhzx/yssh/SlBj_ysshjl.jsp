<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String khbh=null;
String dqbm=null;
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
String cgdz=null;
String yzxxbz=null;
String jzbz=null;

String sjs=null;
String khjl=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String xqbm=null;
String ywy=null;

String jhjfsj=null;
String hdr=null;
String sjsbh=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String louhao=null;
String ssfgs=null;
String zxkhlrjc=null;
String qdkhbljc=null;
String dzbjjc=null;

String sfzdzbj=null;
String jhzbjsj=null;
String bjjb=null;
String sczbjsj=null;
String zjzbjsj=null;
String dzbjze=null;
String bjbbh=null;

String sqsm=null;
String lrr=null;
String lrsj=null;
String ysshbz=null;
String slr=null;
String slsj=null;
String slsm=null;
String ysshr=null;
String ysshsj=null;
String ysshyj=null;
String jygq=null;
String jykgsj=null;
String jyjgsj=null;
String shdf=null;

String jsy="";

String ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,sqsm,lrr,lrsj,ysshbz,slr,slsj,slsm,ysshr,ysshsj,ysshyj,jygq,jykgsj,jyjgsj,shdf ";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  (ysshjl='"+ysshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slsm=cf.fillNull(rs.getString("slsm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		jygq=cf.fillNull(rs.getString("jygq"));
		jykgsj=cf.fillNull(rs.getDate("jykgsj"));
		jyjgsj=cf.fillNull(rs.getDate("jyjgsj"));
		shdf=cf.fillNull(rs.getString("shdf"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjbbh,khjl,ssfgs,louhao,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,jhjfsj,hdr,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" ,sfzdzbj,jhzbjsj,bjjb,sczbjsj,zjzbjsj,dzbjze";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sczbjsj=cf.fillNull(rs.getDate("sczbjsj"));
		zjzbjsj=cf.fillNull(rs.getDate("zjzbjsj"));
		dzbjze=cf.fillNull(rs.getString("dzbjze"));

		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
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
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select zxkhlrjc,qdkhbljc,dzbjjc,dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select jsy";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where khbh='"+khbh+"' and jsy is not null";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsy=cf.fillNull(rs.getString("jsy"));
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
<title>预算审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
    <div align="center"><strong>受理申请（预算审核记录：<%=ysshjl%>）</strong></div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveSlBj_ysshjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">客户姓名              </font></td>
              <td width="31%"><%=khxm%></td>
              <td width="19%" align="right"><font color="#0000FF">性别              </font></td>
              <td width="31%"> <%
	cf.radioToken(out,"M+男&W+女",xb,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">房屋地址</font> </td>
              <td><%=fwdz%></td>
              <td align="right"><font color="#0000FF">家装设计师</font></td>
              <td><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">业务员</font></td>
              <td><%=ywy%></td>
              <td align="right"><font color="#0000FF">客户经理</font></td>
              <td><%=khjl%></td>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">年龄区间</font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF">职业</font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm,true);
%>            </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">月收入</font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF">房价（元/m）</font></td>
              <td width="31%"><%=fj%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF"> 
              户型              </font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr><tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#0000FF"> 
              回单标志              </font></td>
              <td width="31%"> 
                 <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF"> 
              回单人              </font></td>
              <td width="31%"><%=hdr%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#0000FF">回单装修地址</font></td>
              <td colspan="3"><%=cgdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">是否需回访              </font></td>
              <td width="31%"> <%
	cf.radioToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%> </td>
              <td width="19%" align="right"> 
                <font color="#0000FF">回访日期              </font></td>
              <td width="31%"><%=hfrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">家装标志</font></td>
              <td width="31%"><%
	cf.selectToken(out,"1+家装&2+公装",jzbz,true);
%></td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF"> 
              备注              </font></td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF"> 
              <td colspan="4" height="24">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0000FF">是否做电子报价</font></td>
              <td><%
	cf.selectToken(out,"N+未做&Y+已做",sfzdzbj,true);
%></td>
              <td align="right"><font color="#0000FF">计划做电子报价时间</font></td>
              <td><%=jhzbjsj%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">报价级别</font></td>
              <td><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%>              </td>
              <td align="right"><font color="#0000FF">电子报价总额</font></td>
              <td><%=dzbjze%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0000FF">首次做电子报价时间</font></td>
              <td><%=sczbjsj%></td>
              <td align="right"><font color="#0000FF">最近做电子报价时间</font></td>
              <td><%=zjzbjsj%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#0000FF">报价版本号</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bjbbh%></td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF">
              <td colspan="4" height="24">&nbsp;</td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC">申请说明</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=sqsm%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC">录入人</font></td>
              <td bgcolor="#FFFFFF"><%=lrr%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">录入时间</font></td>
              <td bgcolor="#FFFFFF"><%=lrsj%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">受理人</font></td>
              <td><input type="text" name="slr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">受理时间</font></td>
              <td><input type="text" name="slsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>价审员</td>
              <td>
			  <select name="jsy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm='22' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' ";
		sql+=" and sq_yhxx.zwbm='22' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,jsy);
%>
              </select></td>
              <td align="right"><font color="#CC0000">*</font>建筑面积</td>
              <td><input type="text" name="fwmj" size="20" maxlength="10"  value="<%=fwmj%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">受理说明</td>
              <td colspan="3"><textarea name="slsm" cols="71" rows="3"><%=slsm%></textarea></td>
            </tr>
            
            <tr> 
              <td height="2" colspan="4" align="center"> 
				<input type="hidden" name="ysshjl"  value="<%=ysshjl%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
              <input type="button"  value="存盘" onClick="f_do(editform)">
              <input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="查看电子报价"></td>
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
	if(	javaTrim(FormName.slr)=="") {
		alert("请输入[受理人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("请输入[受理时间]！");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "受理时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jsy)=="") {
		alert("请输入[价审员]！");
		FormName.jsy.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[建筑面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "建筑面积"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
