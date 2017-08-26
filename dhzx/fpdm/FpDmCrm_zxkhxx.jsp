<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

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

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;
String ssfgs=null;
String sjsbh=null;
String ywy=null;

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
	ls_sql="select ywy,ssfgs,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ywy=cf.fillNull(rs.getString("ywy"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<title>分配咨询店面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">分配咨询店面</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">客户姓名</div>
            </td>
            <td width="35%"> <%=khxm%> </td>
            <td width="14%"> 
              <div align="right">性别</div>
            </td>
            <td width="36%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">所属城区</td>
            <td width="35%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </td>
            <td width="14%" align="right">房屋地址</td>
            <td width="36%"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">房屋类型</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="14%"> 
              <div align="right">户型</div>
            </td>
            <td width="36%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">套内建筑面积</div>
            </td>
            <td width="35%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="14%"> 
              <div align="right">风格要求</div>
            </td>
            <td width="36%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">装修预算</div>
            </td>
            <td width="35%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="14%"> 
              <div align="right">关系客户</div>
            </td>
            <td width="36%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#FFFFFF"> 
              <div align="right">回单标志</div>
            </td>
            <td width="35%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
            <td width="14%"> 
              <div align="right">回单人</div>
            </td>
            <td width="36%"><%=hdr%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">回单装修地址</td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">咨询登记部门</td>
            <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%></td>
            <td width="14%" align="right">业务员</td>
            <td width="36%"><%=ywy%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">咨询状态</td>
            <td width="35%"><%=zxzt%> </td>
            <td width="14%" align="right">失败原因</td>
            <td width="36%"><%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm where sbyybm='"+sbyybm+"'",sbyybm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">备注</div>
            </td>
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
	pageObj.alignStr[4]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%> 

</table>

		  
		  
<form method="post" action="SaveFpDmCrm_zxkhxx.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4"><b><font color="#000066">分配咨询店面</font></b></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">客户所属分公司</td>
              <td width="33%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>
              </td>
              <td width="15%" align="right">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">咨询店面</td>
              <td>
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeDwbh(editform)">
          <%
			if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",zxdm);
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ",zxdm);
			}
			else if (kfgssq.equals("4") || kfgssq.equals("5"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ",zxdm);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
%> 
                </select>
              </td>
              <td align="right">部门小组</td>
              <td>
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
			if (zxdm!=null)
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+zxdm+"' order by dwbh",sjsbh);
			}
			else{
				if (kfgssq.equals("3"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh",sjsbh);
				}
			}
%>
                </select>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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


function changeDwbh(FormName)
{
	FormName.sjsbh.length=1;

	if (FormName.zxdm.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+FormName.zxdm.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.sjsbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zxdm)=="") {
		alert("请输入[咨询店面]！");
		FormName.zxdm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
