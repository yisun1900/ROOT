<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String fgflbm=null;
String zxjwbm=null;
String hxbm=null;
String hxmjbm=null;
String ysbm=null;
String sfyqd=null;
String khxm=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String sjs=null;
String bz=null;
String khbh=null;
String wheresqbh=cf.GB2Uni(request.getParameter("sqbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ybj_cgsq.dwbh,ybj_cgsq.fgflbm,ybj_cgsq.zxjwbm,ybj_cgsq.hxbm,ybj_cgsq.hxmjbm,ybj_cgsq.ysbm,ybj_cgsq.sfyqd,khxm,fwdz,cqbm,lxfs,sjs,ybj_cgsq.bz,ybj_cgsq.khbh ";
	ls_sql+=" from  ybj_cgsq,crm_khxx";
	ls_sql+=" where  sqbh="+wheresqbh+"  ";
	ls_sql+=" and ybj_cgsq.khbh=crm_khxx.khbh and sfyqd='Y'";

	ls_sql+=" union ";
	
	ls_sql+=" select ybj_cgsq.dwbh,ybj_cgsq.fgflbm,ybj_cgsq.zxjwbm,ybj_cgsq.hxbm,ybj_cgsq.hxmjbm,ybj_cgsq.ysbm,ybj_cgsq.sfyqd,khxm,fwdz,cqbm,lxfs,sjs,ybj_cgsq.bz,ybj_cgsq.khbh ";
	ls_sql+=" from  ybj_cgsq,crm_zxkhxx";
	ls_sql+=" where  sqbh="+wheresqbh+"  ";
	ls_sql+=" and ybj_cgsq.khbh=crm_zxkhxx.khbh and sfyqd='N'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		sfyqd=cf.fillNull(rs.getString("sfyqd"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 修改样板间参观申请（申请编号：<%=wheresqbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditYbj_cgsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="20"  value="<%=khxm%>" >
              </td>
              <td width="18%" align="right">联系方式</td>
              <td width="32%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100"  value="<%=fwdz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">所属城区</div>
              </td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" >
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
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
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
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm);
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
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
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
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm);
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
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>是否已签单</div>
              </td>
              <td width="32%"> 
                <select name="sfyqd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"Y+已签单&N+未签单",sfyqd,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheresqbh"  value="<%=wheresqbh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
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
function f_do(FormName)//参数FormName:Form的名称
{
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
