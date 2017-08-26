<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String sgph=request.getParameter("sgph");

String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;
String psfs=null;
String jhshsj=null;

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	ls_sql=" select lrr,lrsj,dwbh,bz,psfs,jhshsj ";
	ls_sql+=" from cl_clsgd where sgph='"+sgph+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		lrr = cf.fillNull(rs.getString("lrr"));
		lrsj = cf.fillNull(rs.getDate("lrsj"));
		dwbh = cf.fillNull(rs.getString("dwbh"));
		bz = cf.fillNull(rs.getString("bz"));
		jhshsj = cf.fillNull(rs.getDate("jhshsj"));
		psfs = cf.fillNull(rs.getString("psfs"));
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<html>
<head>
<title>配送</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">配送(申购批号:<%=sgph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform" >
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">录入人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">录入时间</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">申购单位</font></td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">配送方式</font></td>
              <td width="32%"><%
	cf.radioToken(out, "psfs","1+配送&2+自提&9+其它",psfs);
%></td>
              <td width="18%" align="right"><font color="#000099">计划送货时间</font></td>
              <td width="32%"> 
                <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font>实际送货时间</td>
              <td width="32%"> 
                <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="18%"><font color="#CC0000">*</font>运费</td>
              <td width="32%"> 
                <input type="text" name="yf" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">配送录入人</font></td>
              <td width="32%"> 
                <input type="text" name="pslrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">配送录入时间</font></td>
              <td width="32%"> 
                <input type="text" name="pslrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input name="sgph" type="hidden" value="<%=sgph%>">
                <input type="button" name="cp" value=" 存 盘 " onClick="f_do(insertform)">
                &nbsp; 
                <input type="button"   value="查看库存" onClick="window.open('/fcgl/tjfx/kcfxList.jsp?fgs=<%=dwbh%>')">
                <input type="reset"   value=" 重 输 " name="reset">
                &nbsp; &nbsp; </td>
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
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[实际送货时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "实际送货时间"))) {
		return false;
	}

	if(	javaTrim(FormName.pslrr)=="") {
		alert("请输入[配送录入人]！");
		FormName.pslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.pslrsj)=="") {
		alert("请输入[配送录入时间]！");
		FormName.pslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pslrsj, "配送录入时间"))) {
		return false;
	}

	if(	javaTrim(FormName.yf)=="") {
		alert("请输入[运费]！");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "运费"))) {
		return false;
	}

	FormName.action="SavePsCl_clsgd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
