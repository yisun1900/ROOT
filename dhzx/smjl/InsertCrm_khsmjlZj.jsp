<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
String lrbm=(String)session.getAttribute("dwbh");
%>
<%
String ssfgs=null;
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

String sgd=null;
String zjxm=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;

String qtqk="";

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int lfcs=0;
String jlh=null;


try {
	conn=cf.getConnection();

	ls_sql="select crm_zxkhxx.ssfgs,sgd,zjxm,khjl,sjs,ywy,dwmc,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,crm_zxkhxx.bz,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

	ls_sql="select NVL(max(substr(jlh,8,3)),0)";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lfcs=rs.getInt(1);
	}
	rs.close();
	ps.close();

    lfcs++;
	jlh=khbh+cf.addZero(lfcs,3);

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lfcs=rs.getInt(1);
	}
	rs.close();
	ps.close();

    lfcs++;
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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_khsmjlZj.jsp" name="insertform">
<div align="center">录入客户上门记录（记录号：<%=jlh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">记录号</td>
	<td  width="7%">上门次数</td>
	<td  width="7%">上门时间</td>
	<td  width="7%">上门目的</td>
	<td  width="5%">接待人</td>
	<td  width="9%">接待人部门</td>
	<td  width="20%">实际接待情况</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_khsmjl.jlh,crm_khsmjl.lfcs,TO_CHAR(crm_khsmjl.smsj,'YYYY-MM-DD'),crm_khsmjl.smmd,crm_khsmjl.jdr,a.dwmc jdrbm,crm_khsmjl.sjjdqk  ";
	ls_sql+=" FROM crm_zxkhxx,crm_khsmjl,sq_dwxx a ";
    ls_sql+=" where crm_khsmjl.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_khsmjl.jdrbm=a.dwbh(+) ";
    ls_sql+=" and crm_khsmjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_khsmjl.jlh ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khsmjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setDateType("long");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>		
  </table>
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
      </table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>上门时间</td> 
  <td width="32%"> 
    <input type="text" name="smsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>上门目的</td> 
  <td width="32%"> 
    <select name="smmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select smmd c1,smmd c2 from dm_smmd order by smmdbm","");
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>接待人部门</td> 
  <td width="32%"> 
    <select name="jdrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeBm(insertform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' and dwlx not in('F3','F4') order by dwlx desc,dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>接待人</td> 
  <td width="32%">
    <select name="jdrbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>上门次数</td> 
  <td width="32%">
	  <input type="text" name="lfcs" value="<%=lfcs%>" size="10" maxlength="10" readonly>次   </td>
  <td align="right" width="18%"></td> 
  <td width="32%">    </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>实际接待情况</td>
  <td colspan="3"><textarea name="sjjdqk" cols="72" rows="6"></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	    <input type="hidden" name="jlh" value="<%=jlh%>" >
	    <input type="hidden" name="khbh" value="<%=khbh%>" >
	    <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

function changeBm(FormName) 
{
	FormName.jdrbh.length=1;

	if (FormName.jdrbm.value=="")
	{
		return;
	}

	var sql;
	sql =" select sq_yhxx.ygbh,sq_yhxx.yhmc||'（'||xzzwbm||'）' c1";
	sql+=" from sq_yhxx ";
	sql+=" where sq_yhxx.dwbh='"+FormName.jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" UNION ";

	sql+=" select sq_yhxx.ygbh,sq_yhxx.yhmc||'（'||xzzwbm||'）' c1";
	sql+=" from sq_yhxx,sq_sqbm ";
	sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+FormName.jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" ORDER BY c1";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.jdrbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jlh)=="") {
		alert("请输入[记录号]！");
		FormName.jlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.smsj)=="") {
		alert("请输入[上门时间]！");
		FormName.smsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.smsj, "上门时间"))) {
		return false;
	}
	if(	javaTrim(FormName.smmd)=="") {
		alert("请选择[上门目的]！");
		FormName.smmd.focus();
		return false;
	}
	if(	javaTrim(FormName.jdrbm)=="") {
		alert("请选择[接待人部门]！");
		FormName.jdrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdrbh)=="") {
		alert("请输入[接待人]！");
		FormName.jdrbh.focus();
		return false;
	}
	if(!(isNumber(FormName.jdrbh, "接待人"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjdqk)=="") {
		alert("请输入[实际接待情况]！");
		FormName.sjjdqk.focus();
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.bc.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
