<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dwbh=(String)session.getAttribute("dwbh");

	String khbh=cf.GB2Uni(request.getParameter("khbh"));
%>
<%

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String cqbm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String sqbh=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khxm,fwdz,lxfs,cqbm,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();

	int count=0;
	ls_sql="select NVL(max(substr(sqbh,8,2)),0)";
	ls_sql+=" from  ybj_cgsq";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	sqbh=khbh+cf.addZero(count+1,2);

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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请填写样板间参观申请（申请编号：<%=sqbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertYbj_cgsqY.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="32%"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="sqbh" value="<%=sqbh%>" >
                <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">联系方式</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="20" maxlength="50" readonly >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" readonly >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">所属城区</font></div>
              </td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"'",cqbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">要求装修风格</div>
              </td>
              <td width="32%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">要求装修价位</div>
              </td>
              <td width="32%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">要求户型</div>
              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">要求户型面积</div>
              </td>
              <td width="32%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">要求油色</div>
              </td>
              <td width="32%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">是否已签单</font></div>
              </td>
              <td width="32%"> 
                <select name="sfyqd" style="FONT-SIZE:12PX;WIDTH:152PX">
					<option selected value="Y">已签单</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>申请店面</div>
              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>申请人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sqr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申请店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sfyqd)=="") {
		alert("请选择[是否已签单]！");
		FormName.sfyqd.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
