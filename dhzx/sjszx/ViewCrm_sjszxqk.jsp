<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_sjszxqk_zxjlh=null;
String crm_sjszxqk_khbh=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_xb=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_lxfs=null;
String sq_dwxx_dwmc=null;
String crm_sjszxqk_sjs=null;
String crm_sjszxqk_zxsj=null;
String crm_sjszxqk_zxqk=null;
String crm_sjszxqk_lrr=null;
String crm_sjszxqk_lrsj=null;
String crm_sjszxqk_sfxhf=null;
String crm_sjszxqk_hfrq=null;
String wherecrm_sjszxqk_zxjlh=null;
wherecrm_sjszxqk_zxjlh=cf.GB2Uni(request.getParameter("zxjlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_sjszxqk.zxjlh as crm_sjszxqk_zxjlh,crm_sjszxqk.khbh as crm_sjszxqk_khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.xb as crm_zxkhxx_xb,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_sjszxqk.sjs as crm_sjszxqk_sjs,crm_sjszxqk.zxsj as crm_sjszxqk_zxsj,crm_sjszxqk.zxqk as crm_sjszxqk_zxqk,crm_sjszxqk.lrr as crm_sjszxqk_lrr,crm_sjszxqk.lrsj as crm_sjszxqk_lrsj,crm_sjszxqk.sfxhf as crm_sjszxqk_sfxhf,crm_sjszxqk.hfrq as crm_sjszxqk_hfrq ";
	ls_sql+=" from  crm_zxkhxx,crm_sjszxqk,sq_dwxx";
	ls_sql+=" where crm_sjszxqk.dwbh=sq_dwxx.dwbh and  crm_sjszxqk.khbh=crm_zxkhxx.khbh and  (crm_sjszxqk.zxjlh='"+wherecrm_sjszxqk_zxjlh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_sjszxqk_zxjlh=cf.fillNull(rs.getString("crm_sjszxqk_zxjlh"));
		crm_sjszxqk_khbh=cf.fillNull(rs.getString("crm_sjszxqk_khbh"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_xb=cf.fillNull(rs.getString("crm_zxkhxx_xb"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_lxfs=cf.fillNull(rs.getString("crm_zxkhxx_lxfs"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_sjszxqk_sjs=cf.fillNull(rs.getString("crm_sjszxqk_sjs"));
		crm_sjszxqk_zxsj=cf.fillNull(rs.getDate("crm_sjszxqk_zxsj"));
		crm_sjszxqk_zxqk=cf.fillNull(rs.getString("crm_sjszxqk_zxqk"));
		crm_sjszxqk_lrr=cf.fillNull(rs.getString("crm_sjszxqk_lrr"));
		crm_sjszxqk_lrsj=cf.fillNull(rs.getDate("crm_sjszxqk_lrsj"));
		crm_sjszxqk_sfxhf=cf.fillNull(rs.getString("crm_sjszxqk_sfxhf"));
		crm_sjszxqk_hfrq=cf.fillNull(rs.getDate("crm_sjszxqk_hfrq"));
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 设计师咨询信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">咨询记录号</div>
            </td>
            <td width="32%"> <%=crm_sjszxqk_zxjlh%> </td>
            <td width="18%"> 
              <div align="right">客户编号</div>
            </td>
            <td width="32%"> <%=crm_sjszxqk_khbh%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">客户姓名</div>
            </td>
            <td width="32%"> <%=crm_zxkhxx_khxm%> </td>
            <td width="18%"> 
              <div align="right">性别</div>
            </td>
            <td width="32%"> <%
	cf.radioToken(out, "M+男&W+女",crm_zxkhxx_xb,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">房屋地址</div>
            </td>
            <td width="32%"> <%=crm_zxkhxx_fwdz%> </td>
            <td width="18%">&nbsp;</td>
            <td width="32%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">咨询店面</div>
            </td>
            <td width="32%"> <%=sq_dwxx_dwmc%> </td>
            <td width="18%"> 
              <div align="right">设计师</div>
            </td>
            <td width="32%"> <%=crm_sjszxqk_sjs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">咨询情况</td>
            <td colspan="3"><%=crm_sjszxqk_zxqk%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">录入人</div>
            </td>
            <td width="32%"> <%=crm_sjszxqk_lrr%> </td>
            <td width="18%"> 
              <div align="right">录入时间</div>
            </td>
            <td width="32%"> <%=crm_sjszxqk_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">咨询时间</div>
            </td>
            <td width="32%"><%=crm_sjszxqk_zxsj%> </td>
            <td width="18%"> 
              <div align="right"></div>
            </td>
            <td width="32%">&nbsp; </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">是否需回访</div>
            </td>
            <td width="32%"><%
	cf.selectToken(out,"Y+需回访&N+不需回访",crm_sjszxqk_sfxhf,true);
%> </td>
            <td width="18%"> 
              <div align="right">回访日期&nbsp;</div>
            </td>
            <td width="32%"><%=crm_sjszxqk_hfrq%> </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
