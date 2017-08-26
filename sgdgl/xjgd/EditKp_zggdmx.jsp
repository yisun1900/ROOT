<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>修改数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String zgjlh=request.getParameter("zgjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String xjjlh=null;
String ssfgs =null;
String zgxm=null;
String zgsm=null;
String yqjjsj=null;
String fkbm=null;
String ygbh=null;
String fkbmjsr=null;

String sgd =null;
String sgdbh =null;
String sgdmc =null;
String zpml ="";
String sgfgs ="";//施工分公司


int count=0;

try {
	conn=cf.getConnection();

	ls_sql="select xjjlh,zgxm,zgsm,yqjjsj,fkbm,ygbh,fkbmjsr";
	ls_sql+=" from  kp_zggdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		zgxm=cf.fillNull(rs.getString("zgxm"));
		zgsm=cf.fillNull(rs.getString("zgsm"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));
		fkbm=cf.fillNull(rs.getString("fkbm"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		fkbmjsr=cf.fillNull(rs.getString("fkbmjsr"));
	}
	rs.close();
	ps.close();

	ls_sql="select fgsbh,crm_khxx.sgd,sgdmc,kp_xjgdjl.zpml,crm_khxx.sgfgs";
	ls_sql+=" from  kp_xjgdjl,crm_khxx,sq_sgd";
	ls_sql+=" where  kp_xjgdjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and  crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and xjjlh='"+xjjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");
		zpml=rs.getString("zpml");
		sgfgs=cf.fillNull(rs.getString("sgfgs"));//施工分公司
	}
	rs.close();
	ps.close();

	if (sgfgs.equals(""))
	{
		sgfgs=ssfgs;
	}

	ls_sql="select ygbh";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where  sfzszg in('Y','N') and dwbh='ZJG33' and yhmc='"+sgdmc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdbh=rs.getString("ygbh");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
<form method="post" action="SaveEditKp_zggdmx.jsp" name="insertform" target="_blank">

          <center>整改记录号:<%=zgjlh%></center>
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1">*</span>要求解决时间</td>
              <td width="33%"><input name="yqjjsj" type="text" onDblClick="JSCalendar(this)" value="<%=yqjjsj%>" size="20" maxlength="10"></td>
              <td width="19%" align="right"><span class="STYLE1">*</span>检查记录号</td>
              <td width="31%">
				  <input type="text" name="xjjlh" value="<%=xjjlh%>"  size="20" readonly>			  </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>反馈部门</td>
              <td><select name="fkbm" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getZrbm(insertform)">
                <option value=""></option>
                <%
	String sql="";
	sql="select dwbh,dwmc from sq_dwxx  where  (ssfgs='"+sgfgs+"' or ssfgs='99999') and cxbz='N' and dwlx in('A0','A1','F0','F1','F2','F7','F8') order by dwbh";
	cf.selectItem(out,sql,fkbm);
%>
              </select></td>
              <td align="right"><span class="STYLE1">*</span>反馈部门接收人</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+fkbm+"' order by yhmc";
	cf.selectItem(out,sql,ygbh);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1">*</span>整改说明</td>
              <td colspan="3"> 
                <textarea name="zgsm" cols="74" rows="5" ><%=zgsm%></textarea>              </td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
 					<input type="hidden" name="zgjlh" value="<%=zgjlh%>" >
					<input type="hidden" name="oldygbh" value="<%=ygbh%>" >
               
                <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input name="sczp" type="button" onClick="f_sczp(insertform)"  value="上传照片">
                <input name="ckzp" type="button" onClick="f_ckzp(insertform)"  value="查看照片">
                <input name="zgxm" type="hidden"  value="<%=zgxm%>" size="75" maxlength="100"></td>
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
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function getZrbm(FormName)
{
	if (FormName.fkbm.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;

	czlx=3;

	if (FormName.fkbm.value=='ZJG33')//工程管理中心
	{
		var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.fkbm.value+"' and yhmc='<%=sgdmc%>' order by yhmc";
	}
	else{
		var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.fkbm.value+"' order by yhmc";
	}
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
		strToSelect(insertform.ygbh,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zgjlh)=="") {
		alert("请输入[整改记录号]！");
		FormName.zgjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.xjjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.yqjjsj)=="") {
		alert("请输入[要求解决时间]！");
		FormName.yqjjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yqjjsj, "要求解决时间"))) {
		return false;
	}


	if(	javaTrim(FormName.zgxm)=="") {
		alert("请输入[整改项目]！");
		FormName.zgxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkbm)=="") {
		alert("请输入[反馈部门]！");
		FormName.fkbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[反馈部门接收人]！");
		FormName.ygbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zgsm)=="") {
		alert("请输入[整改说明]！");
		FormName.zgsm.focus();
		return false;
	}


	FormName.submit();
	return true;
}

function f_sczp(FormName)//参数FormName:Form的名称
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="ZgloadFilePad.jsp?xjjlh=<%=xjjlh%>&lx=3&zpgjz="+encodeURI(FormName.zgxm.value)+"&zpml=<%=zpml%>&zpsm="+encodeURI(FormName.zgxm.value);
		window.open(urlStr);
	}
	else
	{
		var urlStr="ZgloadFile.jsp?xjjlh=<%=xjjlh%>&lx=3&zpgjz="+FormName.zgxm.value+"&zpml=<%=zpml%>&zpsm="+FormName.zgxm.value;
		window.open(urlStr);
	}
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	var urlStr="viewZgPhoto.jsp?xjjlh=<%=xjjlh%>&lx=3&zpgjz="+encodeURI(FormName.zgxm.value)+"&zpsm="+encodeURI(FormName.zgxm.value);
	window.open(urlStr);
}


//-->
</SCRIPT>
