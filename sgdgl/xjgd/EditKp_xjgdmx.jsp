<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xjjlh=null;
String kpdlbm=null;
String kpxmbm=null;
String kpjg=null;
String kpcfbm=null;
double kf=0;
double sgdfk=0;
double kcjdebl=0;
String wzcs=null;
String bz=null;
String wherexjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
String wherekpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String zpml ="";
try {
	conn=cf.getConnection();


	ls_sql="select xjjlh,kp_xjgdmx.kpxmbm,kpdlbm,kp_xjgdmx.kpjg,kp_xjgdmx.kf,kp_xjgdmx.kpcfbm,bz,sgdfk,kcjdebl,wzcs ";
	ls_sql+=" from  kp_xjgdmx";
	ls_sql+=" where  (xjjlh="+wherexjjlh+") and  (kp_xjgdmx.kpxmbm='"+wherekpxmbm+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpxmbm=cf.fillNull(rs.getString("kpxmbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
		bz=cf.fillNull(rs.getString("bz"));
		kf=rs.getDouble("kf");
		sgdfk=rs.getDouble("sgdfk");
		kcjdebl=rs.getDouble("kcjdebl");
		wzcs=cf.fillNull(rs.getString("wzcs"));
	}
	rs.close();
	ps.close();

	ls_sql="select zpml";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpml=rs.getString("zpml");
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">施工队检查明细--修改（<font color="#0000CC">检查记录：<%=xjjlh%></font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_xjgdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC"></font>项目大类</td>
              <td width="31%"> 
                <select name="kpdlbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpxm(insertform)">
                   <option value=""></option>
                 <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC"></font>检查项目</td>
              <td width="32%"> 
                <select name="kpxmbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpjg(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct kpxmbm,kpxmmc from kp_gckpxm where kpdlbm='"+kpdlbm+"' order by kpxmbm",kpxmbm);
%> 
                </select>
                <input type="hidden" name="wherexjjlh"  value="<%=wherexjjlh%>" >
                <input type="hidden" name="wherekpxmbm"  value="<%=wherekpxmbm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC"></font>违规分级</div>
              </td>
              <td width="31%"> 
                <select name="kpjg" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpcf(insertform)">
                   <option value=""></option>
                 <%
	cf.selectItem(out,"select distinct kpjg,DECODE(kpjg,1,'轻微违章',2,'严重违章',3,'特别严重') from kp_gckpxm where kpdlbm='"+kpdlbm+"' and kpxmbm='"+kpxmbm+"'",kpjg);
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
                <input name="sczp" type="button" onClick="f_sczp(insertform)"  value="上传照片">
                <input name="ckzp" type="button" onClick="f_ckzp(insertform)"  value="查看照片">
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
	FormName.kpxmbm.length=1;  
	FormName.kpjg.length=1;  

	if(FormName.kpdlbm.value=="") 
	{
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpdlbm="+FormName.kpdlbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpjg(FormName)
{               
	FormName.kpjg.length=1;  

	if(FormName.kpxmbm.value=="") 
	{
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpcf(FormName)
{               

	if(FormName.kpjg.value=="") 
	{
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value+"&kpjg="+FormName.kpjg.value;
	parent.menu.aform.submit();

}                                                                                                                                                       
function f_do(FormName)//参数FormName:Form的名称
{
	if(FormName.kpxmbm.value=="") {
		alert("请选择[检查项目]！");
		FormName.kpxmbm.focus();
		return false;
	}
	if(FormName.kpjg.value=="") {
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

function f_sczp(FormName)//参数FormName:Form的名称
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="XmloadFilePad.jsp?xjjlh=<%=xjjlh%>&lx=2&zpgjz="+encodeURI(FormName.kpxmbm.value)+"&zpml=<%=zpml%>&zpsm="+encodeURI(FormName.kpxmbm.options[FormName.kpxmbm.selectedIndex].text);
		window.open(urlStr);
	}
	else
	{
		var urlStr="XmloadFile.jsp?xjjlh=<%=xjjlh%>&lx=2&zpgjz="+FormName.kpxmbm.value+"&zpml=<%=zpml%>&zpsm="+FormName.kpxmbm.options[FormName.kpxmbm.selectedIndex].text;
		window.open(urlStr);
	}
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	var urlStr="viewXmPhoto.jsp?xjjlh=<%=xjjlh%>&lx=2&zpgjz="+encodeURI(FormName.kpxmbm.value)+"&zpsm="+encodeURI(FormName.kpxmbm.options[FormName.kpxmbm.selectedIndex].text);
	window.open(urlStr);
}

//-->
</SCRIPT>
