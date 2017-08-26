<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
%>
<%

String khbh=null;
String smsj=null;
String smmd=null;
String jdr=null;
String jdrbh=null;
String jdrbm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String jlh=cf.GB2Uni(request.getParameter("jlh"));

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
String sbyybm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String sjsbh=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String sgd=null;
String zjxm=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,smsj,smmd,jdr,jdrbh,jdrbm,lrr,lrsj,lrbm,ssfgs,bz ";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where  (jlh='"+jlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		smsj=cf.fillNull(rs.getDate("smsj"));
		smmd=cf.fillNull(rs.getString("smmd"));
		jdr=cf.fillNull(rs.getString("jdr"));
		jdrbh=cf.fillNull(rs.getString("jdrbh"));
		jdrbm=cf.fillNull(rs.getString("jdrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select sgd,zjxm,khjl,sjs,ywy,dwmc,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
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
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveJgCrm_khsmjl.jsp" name="editform">
<div align="center">客户上门－接待结果录入</div>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            客户姓名            </span></td>
            <td width="32%"> <%=khxm%> </td>
            <td width="18%" align="right"> 
              <span class="STYLE2">性别</span> </td>
            <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            房屋地址            </span></td>
            <td colspan="3"> <%=fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><span class="STYLE2">咨询店面</span></td>
            <td><%=dwmc%></td>
            <td align="right"><span class="STYLE2">设计师</span></td>
            <td><%=sjs%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><span class="STYLE2">客户经理</span></td>
            <td><%=khjl%></td>
            <td align="right"><span class="STYLE2">业务员</span></td>
            <td><%=ywy%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            房屋类型            </span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            户型            </span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            套内建筑面积            </span></td>
            <td width="32%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            风格要求            </span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            装修预算            </span></td>
            <td width="32%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            关系客户            </span></td>
            <td width="32%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE2"> 
            回单标志            </span></td>
            <td width="32%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            回单人            </span></td>
            <td width="32%"><%=hdr%></td>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2">回单装修地址</span></td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2">咨询状态</span></td>
            <td width="32%"><%=zxzt%> </td>
            <td width="18%" align="right"><span class="STYLE2">咨询登记部门</span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            备注            </span></td>
            <td colspan="3"> <%=bz%> </td>
          </tr>
      </table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">上门时间</span></td> 
  <td width="32%"><%=smsj%></td>
  <td align="right" width="18%"><span class="STYLE2">上门目的</span></td> 
  <td width="32%"><%=smmd%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">接待人部门</span></td> 
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jdrbm+"'",jdrbm,true);
%>  </td>
  <td align="right" width="18%"><span class="STYLE2">接待人</span></td> 
  <td width="32%"><%=jdr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2 STYLE2">录入人</span></td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2">录入时间</span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2 STYLE2">录入部门</span></td>
  <td>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right"><span class="STYLE2">所属分公司</span></td>
  <td>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">备注</span></td> 
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>实际接待情况</td> 
  <td colspan="3"> 
    <textarea name="sjjdqk" cols="72" rows="6"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">接待结果录入人</span></td> 
  <td width="32%"><input type="text" name="jdjglrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">接待结果录入时间</span> </td>
  <td width="32%"><input type="text" name="jdjglrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="jlh"  value="<%=jlh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjjdqk)=="") {
		alert("请输入[实际接待情况]！");
		FormName.sjjdqk.focus();
		return false;
	}
	if(	javaTrim(FormName.jdjglrr)=="") {
		alert("请输入[接待结果录入人]！");
		FormName.jdjglrr.focus();
		return false;
	}
	if(	javaTrim(FormName.jdjglrsj)=="") {
		alert("请输入[接待结果录入时间]！");
		FormName.jdjglrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jdjglrsj, "接待结果录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
