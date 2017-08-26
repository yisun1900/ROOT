<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xjr=null;
String xjsj=null;
String jclxbm=null;
String jcjgbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String jcwtflbm=null;
String xxlybm=null;
String sffszg=null;
String dwbh=null;
String ygbh=null;

String ssfgs=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
double jlje=0;


String jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gdm_gdjcjl.jlje,khbh,xjr,xjsj,jclxbm,lrr,lrsj,gdm_gdjcjl.bz,jcjgbm,sgdmc,jcwtflbm,xxlybm,sffszg,gdm_gdjcjl.dwbh,gdm_gdjcjl.ygbh ";
	ls_sql+=" from  gdm_gdjcjl,sq_sgd";
	ls_sql+=" where gdm_gdjcjl.sgd=sq_sgd.sgd(+) and  (jcjlh='"+jcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlje=rs.getDouble("jlje");
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		jclxbm=cf.fillNull(rs.getString("jclxbm"));
		jcjgbm=cf.fillNull(rs.getString("jcjgbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		jcwtflbm=cf.fillNull(rs.getString("jcwtflbm"));
		xxlybm=cf.fillNull(rs.getString("xxlybm"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">精益工程管理（检查记录号：<%=jcjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#000099">客户编号</font>              </td>
              <td width="32%"><%=khbh%> </td>
              <td width="18%" align="right"> 
              <font color="#000099">实开工日期</font>              </td>
              <td width="32%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right"><font color="#000099">联系方式</font></td>
              <td width="32%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">设计师</font></td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right"><font color="#000099">施工队</font></td>
              <td width="32%"><%=sgd%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">工程担当</font></td>
              <td width="32%"><%=zjxm%></td>
              <td width="18%" align="right"><font color="#000099">施工班组</font></td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>信息来源</td>
              <td><select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xxlybm,xxlymc from gdm_xxlybm order by xxlybm",xxlybm);
%>
              </select></td>
              <td align="right">检查类型 </td>
              <td><select name="jclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jclxbm,jclxmc from gdm_jclxbm order by jclxbm",jclxbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">检查结果 </td>
              <td width="32%"><select name="jcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jcjgbm,jcjgmc from gdm_jcjgbm order by jcjgbm",jcjgbm);
%>
              </select></td>
              <td width="18%" align="right">问题分类</td>
              <td width="32%"><select name="jcwtflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
		cf.selectItem(out,"select jcwtflbm,jcwtflmc from gdm_jcwtflbm order by jcwtflbm",jcwtflbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否发生整改</td>
              <td><%
	cf.radioToken(out, "sffszg","Y+发生&N+未发生",sffszg);
%></td>
              <td align="right"><font color="#FF0000">*</font>奖励金额</td>
              <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="16" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">责任部门</td>
              <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(editform)">
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,dwbh);
%>
              </select></td>
              <td align="right">负责人</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                <%
	cf.selectItem(out,"select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+dwbh+"' order by yhmc",ygbh);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>检查人              </td>
              <td width="32%"> 
              <input type="text" name="xjr" size="20" maxlength="20"  value="<%=xjr%>" >              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>检查时间              </td>
              <td width="32%"> 
              <input type="text" name="xjsj" size="20" maxlength="10"  value="<%=xjsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000CC">录入人</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000CC">录入时间</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="jcjlh"  value="<%=jcjlh%>" >
            <tr> 
              <td height="2" colspan="4" align="center">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="button"  value="录入项目" onClick="window.open('InsertGdm_jcjlmx.jsp?jcjlh=<%=jcjlh%>&khbh=<%=khbh%>&ssfgs=<%=ssfgs%>')" name="lr"  >
                <input type="button"  value="查看项目" onClick="window.open('Gdm_jcjlmxList.jsp?jcjlh=<%=jcjlh%>')" name="cx" >
                  <input type="button"  value="上传照片" onClick="f_lrzp(editform)" name="lrzp" >
                  <input type="button"  value="查看照片" onClick="f_ckzp(editform)" name="ckzp" >
                  <input type="reset"  value="重输">              </td>
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
<%
	//启用Ajax
	cf.ajax(out);
%>

function getZrbm(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;


	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	strToSelect(editform.ygbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xjr)=="") {
		alert("请输入[检查人]！");
		FormName.xjr.focus();
		return false;
	}
	if(	javaTrim(FormName.xjsj)=="") {
		alert("请输入[检查时间]！");
		FormName.xjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xjsj, "检查时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xxlybm)=="") {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
		return false;
	}


	if(	!radioChecked(FormName.sffszg)) {
		alert("请选择[是否发生整改]！");
		FormName.sffszg[0].focus();
		return false;
	}
	if (FormName.sffszg[0].checked)
	{
		if(	javaTrim(FormName.dwbh)=="") {
			alert("请选择[责任部门]！");
			FormName.dwbh.focus();
			return false;
		}
		if(	javaTrim(FormName.ygbh)=="") {
			alert("请选择[负责人]！");
			FormName.ygbh.focus();
			return false;
		}
	}
	else{
		FormName.dwbh.value="";
		FormName.ygbh.value="";
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("请选择[奖励金额]！");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "奖励金额"))) {
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

	FormName.action="SaveEditGdm_gdjcjl.jsp";
	FormName.submit();
	return true;
}

function f_lrzp(FormName)//参数FormName:Form的名称
{
   
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[巡检记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
   
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[巡检记录号]！");
		FormName.jcjlh.focus();
		return false;
	}
   
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
