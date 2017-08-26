<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

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
String ysshbz=null;
String ysshyj=null;

String sfzdzbj=null;
String jhzbjsj=null;
String bjjb=null;
String sczbjsj=null;
String zjzbjsj=null;
String dzbjze=null;
String hth="";
String sfzhm="";
String hyh=null;
String clgw=null;



String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select sfzhm,hth,khjl,ysshbz,ysshyj,ssfgs,louhao,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,jhjfsj,hdr,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" ,sfzdzbj,jhzbjsj,bjjb,sczbjsj,zjzbjsj,dzbjze,hyh,clgw";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hyh=cf.fillNull(rs.getString("hyh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		hth=cf.fillNull(rs.getString("hth"));
		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sczbjsj=cf.fillNull(rs.getDate("sczbjsj"));
		zjzbjsj=cf.fillNull(rs.getDate("zjzbjsj"));
		dzbjze=cf.fillNull(rs.getString("dzbjze"));

		khjl=cf.fillNull(rs.getString("khjl"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
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
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();

	if (hth.equals(""))
	{
		ls_sql="select hth";
		ls_sql+=" from  crm_hthxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hth=cf.fillNull(rs.getString("hth"));
		}
		rs.close();
		ps.close();

		if (hth.equals(""))
		{
			out.println("提醒！请首选为该客户编号["+khbh+"]申请合同号");
		}

	}

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
<title>签设计合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>签设计合同</strong></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

      <form method="post" action="" name="editform" target="_blank"> 
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">客户姓名 </font></td>
              <td bgcolor="#E8E8FF"><%=khxm%></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">性别 </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.radioToken(out,"M+男&W+女",xb,true);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">房屋地址</font> </td>
              <td colspan="3" bgcolor="#E8E8FF"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">业务员</font></td>
              <td bgcolor="#E8E8FF"><%=ywy%></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">客户经理</font></td>
              <td bgcolor="#E8E8FF"><%=khjl%></td>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">年龄区间</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">职业</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm,true);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">月收入</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">房价（元/m）</font></td>
              <td bgcolor="#E8E8FF"><%=fj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> 户型 </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> 套内建筑面积 </font></td>
              <td bgcolor="#E8E8FF"><%=fwmj%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> 回单标志 </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> 回单人 </font></td>
              <td bgcolor="#E8E8FF"><%=hdr%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">回单装修地址</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><%=cgdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">是否需回访 </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.radioToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">回访日期 </font></td>
              <td bgcolor="#E8E8FF"><%=hfrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">家装标志</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectToken(out,"1+家装&2+公装",jzbz,true);
%></td>
              <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td bgcolor="#E8E8FF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> 备注 </font></td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">家装设计师</font></td>
              <td bgcolor="#FFFFFF">
              <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">材料顾问</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="clgw" value="<%=clgw%>" size="20" maxlength="20" readonly></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000FF">合同号</font></td>
              <td bgcolor="#FFFFFF">
				<input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" readonly></td>
              <td align="right" bgcolor="#FFFFFF">会员卡号</td>
              <td bgcolor="#FFFFFF"><input name="hyh" type="text" value="<%=hyh%>" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>平米数</td>
              <td bgcolor="#FFFFFF"><input type="text" name="pms" value="" size="20" maxlength="17" onChange="calValue(editform)">              </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>单价</td>
              <td bgcolor="#FFFFFF"><input type="text" name="dj" value="" size="20" maxlength="17" onChange="calValue(editform)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#CC0000">设计合同金额</font></td>
              <td width="32%" bgcolor="#FFFFFF"><input type="text" name="sjhtje" value="" size="20" maxlength="16" ></td>
              <td width="18%" align="right" bgcolor="#FFFFFF">身份证号码</td>
              <td width="32%" bgcolor="#FFFFFF"><input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>签设计合同时间</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qsjhtsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE2"><font color="#0000CC">录入时间</font></span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE2"><font color="#0000CC">录入人</font></span></td>
              <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
              <td align="right"><font color="#CC0000">*</font><span class="STYLE2"><font color="#0000CC">录入部门</font></span></td>
              <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="75" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)" name="sbutton">
                  <input type="reset"  value="重输">
				  <input type="button"  value="设计合同打印预览" onClick="f_dysjhtfj(editform)" name="dysjhtfj" disabled>
				  <input type="button"  value="促销协议打印预览" onClick="f_cxxydy11(editform)" name="cxxydy11" >
				  <%--<input type="button"  value="促销协议补充协议打印" onClick="f_cxxydy(editform)" name="cxxydy" >--%>
				   <input type="button"  value="集成主材促销协议" onClick="f_zcmxdy(editform)" name="zcmxdy" >
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
function calValue(FormName)
{  
	var sjhtje=FormName.pms.value*FormName.dj.value;
	sjhtje=round(sjhtje,2);
	FormName.sjhtje.value=sjhtje;
	if(sjhtje < 3000)
	{
		FormName.sjhtje.value=3000;
	}
	else
	{
		FormName.sjhtje.value=sjhtje;
	}
}

function f_cxxydy11(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	FormName.action="/cxxydy/cxxydy11.jsp";
	FormName.submit();
	return true;
}
function f_zcmxdy(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	FormName.action="/cxxydy/zcmxdy.jsp";
	FormName.submit();
	return true;
}
function f_dysjhtfj(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dyht/dysjhtfj.jsp";
	}
	else{
		FormName.action="/dyht/dysjhtfj.jsp";
	}
	FormName.submit();
	return true;
}
function f_cxxydy(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/cxxydy/cxxydy.jsp";
	}
	else{
		FormName.action="/cxxydy/cxxydy.jsp";
	}
	FormName.submit();
	return true;
}

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}

	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.qsjhtsj)=="") {
		alert("请输入[签设计合同时间]！");
		FormName.qsjhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj, "签设计合同时间"))) {
		return false;
	}
	if(	javaTrim(FormName.pms)=="") {
		alert("请输入[平米数]！");
		FormName.pms.focus();
		return false;
	}
	if(!(isFloat(FormName.pms, "平米数"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sjhtje)=="") {
		alert("请输入[设计合同金额]！");
		FormName.sjhtje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjhtje, "设计合同金额"))) {
		return false;
	}
//	if (parseFloat(FormName.sjhtje.value)==0)
//	{
//		alert("[设计合同金额]不能为0！");
//		FormName.sjhtje.focus();
//		return false;
//	}
	if(!(isSfzhm(FormName.sfzhm, "身份证号码"))) {
		return false;
	}
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

    FormName.action="SaveEditCrm_zxkhxx.jsp";  
	FormName.submit();
	FormName.dysjhtfj.disabled=false;
	return true;
}
//-->
</SCRIPT>
