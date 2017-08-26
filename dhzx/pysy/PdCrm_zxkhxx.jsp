<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

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
String sbyybm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;
String sjsbh=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String ssfgs=null;
String sgd=null;
String zjxm=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;
String ysy=null;

String qtqk="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ysy,crm_zxkhxx.ssfgs,sgd,zjxm,khjl,sjs,ywy,dwmc,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,crm_zxkhxx.bz,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysy=cf.fillNull(rs.getString("ysy"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
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
<title>派预算员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">派预算员</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              客户姓名            </td>
            <td width="32%"> <%=khxm%> </td>
            <td width="18%" align="right"> 
              性别            </td>
            <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              房屋地址            </td>
            <td colspan="3"> <%=fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">咨询店面</td>
            <td><%=dwmc%></td>
            <td align="right">设计师</td>
            <td><%=sjs%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">客户经理</td>
            <td><%=khjl%></td>
            <td align="right">业务员</td>
            <td><%=ywy%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              房屋类型            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="18%" align="right"> 
              户型            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              套内建筑面积            </td>
            <td width="32%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="18%" align="right"> 
              风格要求            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              装修预算            </td>
            <td width="32%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="18%" align="right"> 
              关系客户            </td>
            <td width="32%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right" bgcolor="#FFFFFF"> 
              回单标志            </td>
            <td width="32%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
            <td width="18%" align="right"> 
              回单人            </td>
            <td width="32%"><%=hdr%></td>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">回单装修地址</td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">咨询状态</td>
            <td width="32%"><%=zxzt%> </td>
            <td width="18%" align="right">咨询登记部门</td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              备注            </td>
            <td colspan="3"> <%=bz%> </td>
          </tr>
      </table>
		  
<form method="post" action="SavePdCrm_zxkhxx.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>预算员</td>
              <td width="82%"><select name="ysy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
					cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('20') and sq_yhxx.sfzszg in('Y','N') order by yhmc",ysy);
				%>
              </select></td>
            </tr>
            
            <tr> 
              <td colspan="2" align="center"> 
                             
            <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">                                           
                <input type="reset"  value="重输">			  </td>
            </tr>
          </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysy)=="") {
		alert("请输入[预算员]！");
		FormName.ysy.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
