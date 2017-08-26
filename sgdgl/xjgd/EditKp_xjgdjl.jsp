<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgbm=null;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
double jlje=0;
String zpml="";


String xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,xjr,xjsj,xjlxbm,lrr,lrsj,kp_xjgdjl.bz,xjjgbm,sgdmc,jlje,kp_xjgdjl.zpml ";
	ls_sql+=" from  kp_xjgdjl,sq_sgd";
	ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and  (xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlje=rs.getDouble("jlje");
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		xjjgbm=cf.fillNull(rs.getString("xjjgbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zpml=cf.fillNull(rs.getString("zpml"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz";
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
      <div align="center">请修改施工队检查记录（检查记录号：<%=xjjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#000099">客户编号</font></div>              </td>
              <td width="32%"><%=khbh%> </td>
              <td width="18%"> 
              <div align="right"><font color="#000099">实开工日期</font></div>              </td>
              <td width="32%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right"><font color="#000099">联系方式</font></td>
              <td width="32%"><input name="button" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
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
              <td width="18%" align="right"><font color="#000099">监察姓名</font></td>
              <td width="32%"><%=zjxm%></td>
              <td width="18%" align="right"><font color="#000099">施工班组</font></td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>检查类型</div>              </td>
              <td width="32%"> 
                <select name="xjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm);
%> 
              </select>              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>检查人</div>              </td>
              <td width="32%"> 
              <input type="text" name="xjr" size="20" maxlength="20"  value="<%=xjr%>" >              </td>
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>检查时间</div>              </td>
              <td width="32%"> 
              <input type="text" name="xjsj" size="20" maxlength="10"  value="<%=xjsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>奖励金额</td>
              <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="16" ></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></div>              </td>
              <td width="32%"> 
              <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>              </td>
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></div>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center">
                <input type="hidden" name="xjjgbm" value="<%=xjjgbm%>" >
				<input type="hidden" name="xjjlh"  value="<%=xjjlh%>" >
                <input type="hidden" name="zpml" value="<%=zpml%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button"  value="录入处罚项" onClick="window.open('yrk_lrxxmain.jsp?xjjlh=<%=xjjlh%>')" name="lr" >
                  <input type="button"  value="查看处罚项" onClick="window.open('Kp_xjgdmxList.jsp?xjjlh=<%=xjjlh%>')" name="cx" >
                  <input type="button"  value="录入整改项" onClick="window.open('InsertKp_zggdmx.jsp?xjjlh=<%=xjjlh%>')" name="lrzg"  >
                <input type="button"  value="查看整改项" onClick="window.open('Kp_zggdmxList.jsp?xjjlh=<%=xjjlh%>')" name="cxzg" >
                <input name="reset" type="reset"  value="重输">
                <br>
                  <input type="button"  value="上传无问题照片" onClick="f_lrzp(editform)" name="lrzp" >
                  <input type="button"  value="查看照片" onClick="f_ckzp(editform)" name="ckzp" >              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
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
	if(	javaTrim(FormName.xjlxbm)=="") {
		alert("请选择[检查类型]！");
		FormName.xjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xjjgbm)=="") {
		alert("请选择[检查结果]！");
		FormName.xjjgbm.focus();
		return false;
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

	FormName.action="SaveEditKp_xjgdjl.jsp";
	FormName.submit();
	return true;
}

function f_lrzp(FormName)//参数FormName:Form的名称
{
   
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[巡检记录号]！");
		FormName.xjjlh.focus();
		return false;
	}

	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		FormName.action="loadPhotoPad.jsp";
	}
	else
	{
		FormName.action="loadPhoto.jsp";
	}

	FormName.submit();
	return true;
}


function f_ckzp(FormName)//参数FormName:Form的名称
{
   
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[巡检记录号]！");
		FormName.xjjlh.focus();
		return false;
	}
   
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
