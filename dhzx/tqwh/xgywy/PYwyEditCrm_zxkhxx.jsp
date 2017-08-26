<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String yhjs=(String)session.getAttribute("yhjs");

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
String ssfgs=null;
String ywy=null;
String ywyssxz=null;
String ywybm=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String sjs="";
String qtqk="";

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ssfgs,ywy,ywyssxz,ywybm,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		ywybm=cf.fillNull(rs.getString("ywybm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
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

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}




%>

<html>
<head>
<title>派业务员</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">派业务员</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right"> 
              客户姓名            </td>
            <td width="33%"> <%=khxm%> </td>
            <td width="17%" align="right">设计师</td>
            <td width="33%"><%=sjs%></td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right"> 
              房屋地址            </td>
            <td colspan="3"> <%=fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right"> 
              房屋类型            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="17%" align="right"> 
              户型            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right"> 
              套内建筑面积            </td>
            <td width="33%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="17%" align="right"> 
              风格要求            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right"> 
              装修预算            </td>
            <td width="33%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="17%" align="right"> 
              关系客户            </td>
            <td width="33%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right" bgcolor="#FFFFFF"> 
              回单标志            </td>
            <td width="33%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
            <td width="17%" align="right"> 
              回单人            </td>
            <td width="33%"><%=hdr%></td>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right">回单装修地址</td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right">咨询状态</td>
            <td width="33%"><%=zxzt%> </td>
            <td width="17%" align="right">咨询登记部门</td>
            <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right"> 
              备注            </td>
            <td colspan="3"> <%=bz%> </td>
          </tr>
      </table>
	  
		  
<form method="post" action="SaveXgYwyEditCrm_zxkhxx.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><span class="STYLE2">*</span><span class="STYLE1">分公司</span></td>
              <td width="33%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwbh",ssfgs);
%> 
                </select>              </td>
              <td width="17%" align="right"><span class="STYLE1">原业务员</span></td>
              <td width="33%"><input type="text" name="oldywy" value="<%=ywy%>" size="20" maxlength="20" readonly></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><span class="STYLE2">*</span>业务员部门</td>
              <td><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeYwybm(editform)">
                <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwflbm='07' and dwlx!='F4' and cxbz='N' order by dwbh",ywybm);
	%>
              </select></td>
              <td align="right">业务员所属小组</td>
              <td><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXz(editform)">
                <option value=""></option>
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+ywybm+"' and dwlx='F4' and cxbz='N' order by dwbh",ywyssxz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right"><span class="STYLE2">*</span>新业务员</td>
              <td><select name="newywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%

		String sql=null;
		if (ywyssxz!=null && !ywyssxz.equals(""))
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
			sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" and sq_yhxx.dwbh='"+ywybm+"'";
			sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"'";

			sql+=" UNION ALL ";

			sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' ";
			sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" and sq_yhxx.dwbh='"+ywybm+"'";
			sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"'";

			sql+=" ORDER BY c1";
		}
		else{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
			sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" and sq_yhxx.dwbh='"+ywybm+"'";

			sql+=" UNION ALL ";

			sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' ";
			sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" and sq_yhxx.dwbh='"+ywybm+"'";

			sql+=" ORDER BY c1";
		}

		cf.selectItem(out,sql,"");

%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right"><span class="STYLE2">*</span>修改说明</td>
              <td colspan="3"> 
                <textarea name="xgsm" rows="3" cols="72"></textarea>              </td>
            </tr>
            <tr> 
              <td width="17%" height="2">&nbsp; 
                            </td>
              <td width="33%" height="2"> 
                 
                  <input type="hidden" name="khxm"  value="<%=khxm%>" >
                  <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
              </td>
              <td width="17%" height="2">&nbsp; 
                            </td>
              <td width="33%" height="2"> 
              <input type="reset"  value="重输">              </td>
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
<%
	//启用Ajax
	cf.ajax(out);
%>

var lx;

function changeYwybm(FormName)
{
	FormName.ywyssxz.length=1;
	FormName.newywy.length=1;

	if (FormName.ywybm.value=="")
	{
		return;
	}

	var sql;
	sql =" select dwbh,dwmc";
	sql+=" from sq_dwxx ";
	sql+=" where dwlx='F4' and cxbz='N' and ssdw='"+FormName.ywybm.value+"'";
	sql+=" ORDER BY dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="1";
	openAjax(actionStr);

}

function getBmYwy(FormName)
{
	FormName.newywy.length=1;

	if (FormName.ywybm.value=="")
	{
		return;
	}


	var sql;
	sql =" select yhmc";
	sql+=" from sq_yhxx ";
	sql+=" where dwbh='"+FormName.ywybm.value+"'";
	sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" ORDER BY yhmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="2";
	openAjax(actionStr);

}

function changeXz(FormName)
{
	var sql ="";
	FormName.newywy.length=1;

	if (FormName.ywyssxz.value=="")
	{
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='<%=ssfgs%>' ";
		sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='<%=zxdm%>' ";
		sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";

		sql+=" ORDER BY c1";
	}
	else{
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='<%=ssfgs%>' ";
		sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";
		sql+=" and sq_yhxx.sjsbh='"+FormName.ywyssxz.value+"'";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='<%=zxdm%>' ";
		sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";
		sql+=" and sq_yhxx.sjsbh='"+FormName.ywyssxz.value+"'";

		sql+=" ORDER BY c1";
	}

	lx="3";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="3")
	{
		strToSelect(editform.newywy,ajaxRetStr);
	}
	else if (lx=="1")
	{
		strToSelect(editform.ywyssxz,ajaxRetStr);
		getBmYwy(editform);
	}
	else if (lx=="2")
	{
		strToItem2(editform.newywy,ajaxRetStr);
	}


}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ywybm)=="") {
		alert("请输入[业务员部门]！");
		FormName.ywybm.focus();
		return false;
	}
	if(	javaTrim(FormName.newywy)=="") {
		alert("请输入[新业务员]！");
		FormName.newywy.focus();
		return false;
	}

	if(FormName.newywy.value==FormName.oldywy.value) {
		alert("[新业务员]与[原业务员]不能相同！");
		FormName.newywy.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsm)=="") {
		alert("请输入[修改说明]！");
		FormName.xgsm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
