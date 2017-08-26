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

String sjs="";
String qtqk="";

String sjs2="";
String sjs3="";
String sjs4="";
String sjs5="";
String sjs6="";
String sjs7="";
String sjs8="";
String sjs9="";

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sjsbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
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

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ls_sql+=" order by xh ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sjs2=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs3=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs4=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs5=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs6=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs7=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs8=rs.getString("sjs");
	}
	if (rs.next())
	{
		sjs9=rs.getString("sjs");
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
<title>更换设计师</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 更换设计师</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"> 
              客户姓名            </td>
            <td width="35%"> <%=khxm%> </td>
            <td width="15%" align="right"> 
              性别            </td>
            <td width="35%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">所属城区</td>
            <td width="35%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </td>
            <td width="15%" align="right">联系方式</td>
            <td width="35%"> <%=lxfs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"> 
              房屋地址            </td>
            <td colspan="3"> <%=fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"> 
              房屋类型            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="15%" align="right"> 
              户型            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"> 
              套内建筑面积            </td>
            <td width="35%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="15%" align="right"> 
              风格要求            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"> 
              装修预算            </td>
            <td width="35%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="15%" align="right"> 
              关系客户            </td>
            <td width="35%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right" bgcolor="#FFFFFF"> 
              回单标志            </td>
            <td width="35%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
            <td width="15%" align="right"> 
              回单人            </td>
            <td width="35%"><%=hdr%></td>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">回单装修地址</td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">咨询状态</td>
            <td width="35%"><%=zxzt%> </td>
            <td width="15%" align="right">咨询登记部门</td>
            <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"> 
              备注            </td>
            <td colspan="3"> <%=bz%> </td>
          </tr>
      </table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">咨询时间</td>
	<td  width="10%">店面</td>
	<td  width="8%">设计师</td>
	<td  width="52%">咨询情况</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT zxsj,dwmc,sjs,zxqk";
	ls_sql+=" FROM crm_sjszxqk,sq_dwxx  ";
    ls_sql+=" where crm_sjszxqk.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=" and crm_sjszxqk.khbh='"+wherekhbh+"'";
	ls_sql+=" order by zxjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[3]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px' bgcolor="#CCCCCC">
  <tr  align="center"> 
	<td width="6%">回访次数</td>
	<td width="9%">回访时间</td>
	<td width="13%">回访部门</td>
	<td width="6%">回访人</td>
	<td width="56%">客户回访情况</td>
	<td width="10%">是否提醒责任人</td>
</tr>
<%
	ls_sql="SELECT crm_zxhfjl.hfcs,crm_zxhfjl.hfsj,sq_dwxx.dwmc hfbm ,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,DECODE(crm_zxhfjl.clfs,'0','不提醒','1','提醒店面','2','提醒设计师')";
	ls_sql+=" FROM crm_zxhfjl,sq_dwxx";
    ls_sql+=" where crm_zxhfjl.khbh='"+wherekhbh+"' and crm_zxhfjl.hfbm=sq_dwxx.dwbh(+)";
	ls_sql+=" order by crm_zxhfjl.hfjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[3]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%> 

</table>

		  
		  
<form method="post" action="SaveGhSjsCrm_zxkhxx.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4"><b><font color="#000066">更换设计师</font></b></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">咨询店面</td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"' order by dwbh",zxdm);
%> 
                </select>              </td>
              <td width="15%" align="right">所属设计室</td>
              <td width="35%">
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSjsbh(editform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssdw='"+zxdm+"' and a.dwlx in('F3') order by dwbh",sjsbh);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">主设计师</td>
              <td> 
                <input type="hidden" name="oldsjs"  value="<%=sjs%>" >
                <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs);
%> 
                </select>              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
             <tr bgcolor="#FFFFCC">
              <td colspan="4" align="center"><strong><font color="#000066">其他设计师（针对一个客户有多个设计师）</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">设计师二</td>
              <td>
                <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs2);
%> 
                </select>              </td>
              <td align="right">设计师三</td>
              <td><select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs3);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">设计师四</td>
              <td>
                <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs4);
%> 
                </select>              </td>
              <td align="right">设计师五</td>
              <td><select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs5);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">设计师六</td>
              <td>
                <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs6);
%> 
                </select>              </td>
              <td align="right">设计师七</td>
              <td><select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs7);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">设计师八</td>
              <td>
                <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs8);
%> 
                </select>              </td>
              <td align="right">设计师九</td>
              <td><select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs9);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>更换设计师说明</td>
              <td colspan="3"><label>
                <textarea name="sbyyxs" cols="71" rows="3" ></textarea>
              </label></td>
            </tr>
           <tr> 
              <td colspan="4" align="center"> 
                  <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
              <input type="reset"  value="重输"></td>
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
	cf.ajax(out);//启用AJAX
%>


function changeSjsbh(FormName)
{
	if (FormName.sjsbh.value=="")
	{
		return;
	}

	FormName.sjs[0].length=1;
	FormName.sjs[1].length=1;
	FormName.sjs[2].length=1;
	FormName.sjs[3].length=1;
	FormName.sjs[4].length=1;
	FormName.sjs[5].length=1;
	FormName.sjs[6].length=1;
	FormName.sjs[7].length=1;
	FormName.sjs[8].length=1;

	var sql;
	sql =" select yhmc";
	sql+=" from sq_yhxx ";
	sql+=" where sjsbh='"+FormName.sjsbh.value+"'";
	sql+=" and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" ORDER BY yhmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToItem2(editform.sjs[0],ajaxRetStr);
	strToItem2(editform.sjs[1],ajaxRetStr);
	strToItem2(editform.sjs[2],ajaxRetStr);
	strToItem2(editform.sjs[3],ajaxRetStr);
	strToItem2(editform.sjs[4],ajaxRetStr);
	strToItem2(editform.sjs[5],ajaxRetStr);
	strToItem2(editform.sjs[6],ajaxRetStr);
	strToItem2(editform.sjs[7],ajaxRetStr);
	strToItem2(editform.sjs[8],ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zxdm)=="") {
		alert("请输入[咨询店面]！");
		FormName.zxdm.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs[0])=="") {
		alert("请输入[主设计师]！");
		FormName.sjs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.sbyyxs)=="") {
		alert("请输入[更换设计师说明]！");
		FormName.sbyyxs.focus();
		return false;
	}
/*	
	if (FormName.sjs[0].value==FormName.oldsjs.value)
	{
		alert("错误！请选择不同的[主设计师]！");
		FormName.sjs[0].focus();
		return false;
	}
*/

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
