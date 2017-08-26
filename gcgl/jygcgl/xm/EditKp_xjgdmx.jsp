<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jcjlh=null;
String kpdlbm=null;
String xmbm=null;
String kpjg=null;
String kpcfbm=null;
double kf=0;
double sgdfk=0;
double kcjdebl=0;
String wzcs=null;
String bz=null;
String wherejcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
String wherexmbm=cf.GB2Uni(request.getParameter("xmbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jcjlh,gdm_jcjlmx.xmbm,kpdlbm,gdm_jcjlmx.kpjg,gdm_jcjlmx.kf,gdm_jcjlmx.kpcfbm,bz,sgdfk,kcjdebl,wzcs ";
	ls_sql+=" from  gdm_jcjlmx";
	ls_sql+=" where  (jcjlh="+wherejcjlh+") and  (gdm_jcjlmx.xmbm='"+wherexmbm+"') ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jcjlh=cf.fillNull(rs.getString("jcjlh"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		xmbm=cf.fillNull(rs.getString("xmbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
		bz=cf.fillNull(rs.getString("bz"));
		kf=rs.getDouble("kf");
		sgdfk=rs.getDouble("sgdfk");
		kcjdebl=rs.getDouble("kcjdebl");
		wzcs=cf.fillNull(rs.getString("wzcs"));
	}
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">施工队检查明细--修改（<font color="#0000CC">检查记录：<%=jcjlh%></font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditGdm_jcjlmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC"></font>项目大类</td>
              <td width="31%"> 
                <select name="kpdlbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpxm(insertform)">
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC"></font>检查项目</td>
              <td width="32%"> 
                <select name="xmbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpjg(insertform)">
                  <%
	cf.selectItem(out,"select distinct xmbm,kpxmmc from gdm_gcxm where kpdlbm='"+kpdlbm+"' order by xmbm",xmbm);
%> 
                </select>
                <input type="hidden" name="wherejcjlh"  value="<%=wherejcjlh%>" >
                <input type="hidden" name="wherexmbm"  value="<%=wherexmbm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC"></font>违规分级</div>
              </td>
              <td width="31%"> 
                <select name="kpjg" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpcf(insertform)">
                  <%
	cf.selectItem(out,"select distinct kpjg,DECODE(kpjg,1,'轻微违章',2,'严重违章',3,'特别严重') from gdm_gcxm where kpdlbm='"+kpdlbm+"' and xmbm='"+xmbm+"'",kpjg);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC"></font>违章次数</div>
              </td>
              <td width="32%"> 
                <input type="text" name="wzcs" value="<%=wzcs%>" size="27" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">扣分</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="kf" value="<%=kf%>" size="27" maxlength="16" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">罚款</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="27" maxlength="16" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font><font color="#0000CC">扣除接单额百分比</font></td>
              <td width="31%"> 
                <input type="text" name="kcjdebl" value="<%=kcjdebl%>" size="10" maxlength="16" readonly>
                % </td>
              <td width="18%" align="right"><font color="#0000CC">其它处罚</font></td>
              <td width="32%"> 
                <select name="kpcfbm" style="FONT-SIZE:14PX;WIDTH:200PX">
                  <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm where kpcfbm='"+kpcfbm+"' ",kpcfbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="19%">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="79" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> &nbsp; 
                <input type="button"  value="保存" onClick="f_do(insertform)">
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
function getKpxm(FormName)
{               
	FormName.xmbm.length=0;  
	FormName.kpjg.length=0;  
	if(	javaTrim(FormName.kpdlbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpdlbm="+FormName.kpdlbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpjg(FormName)
{               
	FormName.kpjg.length=0;  

	if(	javaTrim(FormName.xmbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?xmbm="+FormName.xmbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpcf(FormName)
{               

	if(	javaTrim(FormName.kpjg)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?xmbm="+FormName.xmbm.value+"&kpjg="+FormName.kpjg.value;
	parent.menu.aform.submit();

}                                                                                                                                                       
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请选择[检查项目]！");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("请选择[违规分级]！");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("请选择[扣分]！");
		FormName.kf.focus();
		return false;
	}
	if(	javaTrim(FormName.wzcs)=="") {
		alert("请选择[违章次数]！");
		FormName.wzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcs, "违章次数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
